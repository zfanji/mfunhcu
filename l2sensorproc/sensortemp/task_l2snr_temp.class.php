<?php
/**
 * Created by PhpStorm.
 * User: zehongli
 * Date: 2015/12/13
 * Time: 12:22
 */
//include_once "../../l1comvm/vmlayer.php";
include_once "dbi_l2snr_temp.class.php";

class classTaskL2snrTemp
{
    //构造函数
    public function __construct()
    {

    }

    public function func_temperature_process($platform, $deviceId, $statCode, $content)
    {
        switch($platform)
        {
            case MFUN_TECH_PLTF_WECHAT:
                $length = hexdec(substr($content, 2, 2)) & 0xFF;
                $length = ($length + 2)*2; //消息总长度等于length＋1B 控制字＋1B长度本身
                if ($length != strlen($content)){
                    return "ERROR WECHAT_TEMP: message length invalid";  //消息长度不合法，直接返回
                }
                $sub_key = hexdec(substr($content, 4, 2)) & 0xFF;
                switch ($sub_key) //MODBUS操作字处理
                {
                    case MFUN_HCU_MODBUS_DATA_REPORT:
                        $resp = $this->wx_temperature_req_process($deviceId, $content);
                        break;
                    default:
                        $resp = "";
                        break;
                }
                break;
            case MFUN_TECH_PLTF_HCUGX:
                $raw_MsgHead = substr($content, 0, MFUN_HCU_MSG_HEAD_LENGTH);  //截取4Byte MsgHead
                $msgHead = unpack(MFUN_HCU_MSG_HEAD_FORMAT, $raw_MsgHead);

                $length = hexdec($msgHead['Len']) & 0xFF;
                $length =  ($length+2) * 2; //因为收到的消息为16进制字符，消息总长度等于length＋1B控制字＋1B长度本身
                if ($length != strlen($content)) {
                    return "ERROR HCUGX_TEMP: message length invalid";  //消息长度不合法，直接返回
                }
                $data = substr($content, MFUN_HCU_MSG_HEAD_LENGTH, $length - MFUN_HCU_MSG_HEAD_LENGTH);//截取消息数据域

                $opt_key = hexdec($msgHead['Cmd']) & 0xFF;
                switch ($opt_key) //MODBUS操作字处理
                {
                    case MFUN_HCU_MODBUS_DATA_REPORT:
                        $resp = $this->hcu_temperature_req_process($deviceId, $statCode, $data);
                        break;
                    default:
                        $resp = "ERROR HCUGX_TEMP: Invalid Operation Command";
                        break;
                }
                break;
            case MFUN_TECH_PLTF_HCUSTM:
                $raw_MsgHead = substr($content, 0, MFUN_HCU_MSG_HEAD_LENGTH);  //截取6Byte MsgHead
                $msgHead = unpack(MFUN_HCU_MSG_HEAD_FORMAT, $raw_MsgHead);
                $length = hexdec($msgHead['Len']) & 0xFF;
                $length =  ($length+2) * 2; //因为收到的消息为16进制字符，消息总长度等于length＋1B控制字＋1B长度本身
                if ($length != strlen($content)) {
                    return "ERROR HCUSTM_TEMP: message length invalid";  //消息长度不合法，直接返回
                }

                $opt_key = hexdec($msgHead['Cmd']) & 0xFF;

                if ($opt_key == MFUN_HCU_OPT_FHYS_TEMPSTAT_IND){
                    $data = substr($content, MFUN_HCU_MSG_HEAD_LENGTH, 2);
                    $data = hexdec($data) & 0xFF;
                    $classDbiL2snrTemp = new classDbiL2snrTemp();
                    $resp = $classDbiL2snrTemp->dbi_hcu_fhys_temp_status_update($deviceId, $statCode, $data);
                }
                elseif ($opt_key == MFUN_HCU_OPT_FHYS_TEMPDATA_IND){
                    $data = substr($content, MFUN_HCU_MSG_HEAD_LENGTH, 4);
                    //$data = hexdec($data) & 0xFFFF; //直接存成16进制的字符，高2位为整数部分，低2位为小数部分
                    $classDbiL2snrTemp = new classDbiL2snrTemp();
                    $resp = $classDbiL2snrTemp->dbi_hcu_fhys_temp_data_process($deviceId, $statCode, $data);
                }
                else
                    $resp = "ERROR HCUSTM_TEMP: Invalid Operation Command";

                break;
            case MFUN_TECH_PLTF_JDIOT:
                $resp = ""; //no response message
                break;
            default:
                $resp = "TEMPERATURE_SERVICE: PLTF invalid";
                break;
        }
        return $resp;
    }

    public function func_temperature_huitp_process($platform, $deviceId, $statCode, $content)
    {
        switch($platform)
        {
            case MFUN_TECH_PLTF_WECHAT:
                $length = hexdec(substr($content, 2, 2)) & 0xFF;
                $length = ($length + 2)*2; //消息总长度等于length＋1B 控制字＋1B长度本身
                if ($length != strlen($content)){
                    return "ERROR WECHAT_TEMP: message length invalid";  //消息长度不合法，直接返回
                }
                $sub_key = hexdec(substr($content, 4, 2)) & 0xFF;
                switch ($sub_key) //MODBUS操作字处理
                {
                    case MFUN_HCU_MODBUS_DATA_REPORT:
                        $resp = $this->wx_temperature_req_process($deviceId, $content);
                        break;
                    default:
                        $resp = "";
                        break;
                }
                break;
            case MFUN_TECH_PLTF_HCUGX:

                $temp = $content[1]['HUITP_IEID_uni_temp_value']['tempValue'];
                $dataFormat = pow(10,$content[1]['HUITP_IEID_uni_temp_value']['dataFormat']);
                $tempValue = hexdec($temp) / $dataFormat;
                $timeStamp = $content[1]['HUITP_IEID_uni_temp_value']['timeStamp'];

                $resp = $this->hcu_temperature_req_huitp_process($deviceId, $statCode, $timeStamp, $tempValue);

                break;
            case MFUN_TECH_PLTF_HCUSTM:
                $raw_MsgHead = substr($content, 0, MFUN_HCU_MSG_HEAD_LENGTH);  //截取6Byte MsgHead
                $msgHead = unpack(MFUN_HCU_MSG_HEAD_FORMAT, $raw_MsgHead);
                $length = hexdec($msgHead['Len']) & 0xFF;
                $length =  ($length+2) * 2; //因为收到的消息为16进制字符，消息总长度等于length＋1B控制字＋1B长度本身
                if ($length != strlen($content)) {
                    return "ERROR HCUSTM_TEMP: message length invalid";  //消息长度不合法，直接返回
                }

                $opt_key = hexdec($msgHead['Cmd']) & 0xFF;

                if ($opt_key == MFUN_HCU_OPT_FHYS_TEMPSTAT_IND){
                    $data = substr($content, MFUN_HCU_MSG_HEAD_LENGTH, 2);
                    $data = hexdec($data) & 0xFF;
                    $classDbiL2snrTemp = new classDbiL2snrTemp();
                    $resp = $classDbiL2snrTemp->dbi_hcu_fhys_temp_status_update($deviceId, $statCode, $data);
                }
                elseif ($opt_key == MFUN_HCU_OPT_FHYS_TEMPDATA_IND){
                    $data = substr($content, MFUN_HCU_MSG_HEAD_LENGTH, 4);
                    //$data = hexdec($data) & 0xFFFF; //直接存成16进制的字符，高2位为整数部分，低2位为小数部分
                    $classDbiL2snrTemp = new classDbiL2snrTemp();
                    $resp = $classDbiL2snrTemp->dbi_hcu_fhys_temp_data_process($deviceId, $statCode, $data);
                }
                else
                    $resp = "ERROR HCUSTM_TEMP: Invalid Operation Command";

                break;
            case MFUN_TECH_PLTF_JDIOT:
                $resp = ""; //no response message
                break;
            default:
                $resp = "TEMPERATURE_SERVICE: PLTF invalid";
                break;
        }
        return $resp;
    }

    private function wx_temperature_req_process( $deviceId, $content)
    {
        $temperature =  hexdec(substr($content, 6, 4)) & 0xFFFF;
        $devCode = hexdec(substr($content, 10, 4)) & 0xFFFF;
        //$ntimes = hexdec(substr($content, 14, 4)) & 0xFFFF;
        $ntimes =time();
        $gps = "";

        $sDbObj = new classDbiL2snrTemp();
        $sDbObj->dbi_temperature_data_save($deviceId,$devCode,$ntimes,$temperature,$gps);

        $resp = ""; //no response message
        return $resp;
    }

    private function hcu_temperature_req_process( $deviceId,$statCode,$content)
    {
        $format = "A2Equ/A2Type/A2Format/A4Temperature/A2Flag_Lo/A8Longitude/A2Flag_La/A8Latitude/A8Altitude/A8Time";
        $data = unpack($format, $content);

        $sensorId = hexdec($data['Equ']) & 0xFF;
        $report["format"] = hexdec($data['Format']) & 0xFF;
        $report["value"] = hexdec($data['Temperature']) & 0xFFFF;
        $gps["flag_la"] = chr(hexdec($data['Flag_La']) & 0xFF);
        $gps["latitude"] = hexdec($data['Latitude']) & 0xFFFFFFFF;
        $gps["flag_lo"] = chr(hexdec($data['Flag_Lo']) & 0xFF);
        $gps["longitude"] = hexdec($data['Longitude']) & 0xFFFFFFFF;
        $gps["altitude"] = hexdec($data['Altitude']) & 0xFFFFFFFF;
        $timeStamp = hexdec($data['Time']) & 0xFFFFFFFF;

        $sDbObj = new classDbiL2snrTemp();
        $sDbObj->dbi_temperature_data_save($deviceId, $sensorId, $timeStamp, $report,$gps);
        //该函数处理需要再完善，不确定是否可用
        $sDbObj->dbi_tempData_delete_3monold($sensorId, $deviceId, MFUN_HCU_DATA_SAVE_DURATION_IN_DAYS);  //remove 90 days old data.

        //更新分钟测量报告聚合表
        $sDbObj->dbi_minreport_update_temperature($deviceId,$statCode,$timeStamp,$report);

        //更新数据精度格式表
        $format = $report["format"];
        $cDbObj = new classDbiL2snrCom();
        $cDbObj->dbi_dataformat_update_format($deviceId,"T_temperature",$format);
        //更新瞬时测量值聚合表
        $eDbObj = new classDbiL3apF3dm();
        $eDbObj->dbi_currentreport_update_value($deviceId, $statCode, $timeStamp,"T_temperature", $report);

        $resp = ""; //no response message
        return $resp;
    }

    private function hcu_temperature_req_huitp_process( $deviceId,$statCode,$timeStamp, $tempValue)
    {
        $timeStamp = hexdec($timeStamp) & 0xFFFFFFFF;

        $sDbObj = new classDbiL2snrTemp();
        $sDbObj->dbi_temperature_huitp_data_save($deviceId, $timeStamp, $tempValue);
        //该函数处理需要再完善，不确定是否可用
        $sDbObj->dbi_tempData_huitp_delete_3monold($deviceId, MFUN_HCU_DATA_SAVE_DURATION_IN_DAYS);  //remove 90 days old data.

        //更新分钟测量报告聚合表
        $sDbObj->dbi_minreport_huitp_update_temperature($deviceId,$statCode,$timeStamp,$tempValue);

        //更新瞬时测量值聚合表
        $eDbObj = new classDbiL3apF3dm();
        $eDbObj->dbi_currentreport_update_value($deviceId, $statCode, $timeStamp,"T_temperature", $tempValue);

        $resp = ""; //no response message
        return $resp;
    }

    /**************************************************************************************
     *                             任务入口函数                                           *
     *************************************************************************************/
    public function mfun_l2snr_temp_task_main_entry($parObj, $msgId, $msgName, $msg)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());

        //入口消息内容判断
        if (empty($msg) == true) {
            $result = "Received null message body";
            $log_content = "R:" . json_encode($result);
            $loggerObj->logger("MFUN_TASK_ID_L2SNR_TEMP", "mfun_l2snr_temp_task_main_entry", $log_time, $log_content);
            echo trim($result);
            return false;
        }
        if (($msgId != MSG_ID_L2SDK_HCU_TO_L2SNR_TEMP) && ($msgId != MSG_ID_L2SDK_EMCWX_TO_L2SNR_TEMP_DATA_READ_INSTANT) && ($msgId != MSG_ID_L2SDK_EMCWX_TO_L2SNR_TEMP_DATA_REPORT_TIMING)&& ($msgId != HUITP_MSGID_uni_temp_data_report)){
            $result = "Msgid or MsgName error";
            $log_content = "P:" . json_encode($result);
            $loggerObj->logger("MFUN_TASK_ID_L2SNR_TEMP", "mfun_l2snr_temp_task_main_entry", $log_time, $log_content);
            echo trim($result);
            return false;
        }

        //赋初值
        $project= "";
        $log_from = "";
        $platform ="";
        $deviceId="";
        $statCode = "";
        $content="";

        if ($msgId == MSG_ID_L2SDK_HCU_TO_L2SNR_TEMP)
        {
            //解开消息
            if (isset($msg["project"])) $project = $msg["project"];
            if (isset($msg["log_from"])) $log_from = $msg["log_from"];
            if (isset($msg["platform"])) $platform = $msg["platform"];
            if (isset($msg["deviceId"])) $deviceId = $msg["deviceId"];
            if (isset($msg["statCode"])) $statCode = $msg["statCode"];
            if (isset($msg["content"])) $content = $msg["content"];

            //具体处理函数
            $resp = $this->func_temperature_process($platform, $deviceId, $statCode, $content);
        }
        elseif ($msgId == MSG_ID_L2SDK_EMCWX_TO_L2SNR_TEMP_DATA_READ_INSTANT)
        {
            //解开消息
            if (isset($msg["project"])) $project = $msg["project"];
            if (isset($msg["log_from"])) $log_from = $msg["log_from"];
            if (isset($msg["deviceId"])) $deviceId = $msg["deviceId"];
            if (isset($msg["content"])) $content = $msg["content"];
            //具体处理函数
            $resp = $this->wx_temperature_req_process($deviceId, $content);
        }
        elseif ($msgId == MSG_ID_L2SDK_EMCWX_TO_L2SNR_TEMP_DATA_REPORT_TIMING)
        {
            //解开消息
            if (isset($msg["project"])) $project = $msg["project"];
            if (isset($msg["log_from"])) $log_from = $msg["log_from"];
            if (isset($msg["platform"])) $platform = $msg["platform"];
            if (isset($msg["deviceId"])) $deviceId = $msg["deviceId"];
            if (isset($msg["statCode"])) $statCode = $msg["statCode"];
            if (isset($msg["content"])) $content = $msg["content"];

            //具体处理函数
            $resp = $this->func_temperature_process($platform, $deviceId, $statCode, $content);
        }
        elseif ($msgId == HUITP_MSGID_uni_temp_data_report)
        {
            //解开消息
            if (isset($msg["project"])) $project = $msg["project"];
            if (isset($msg["log_from"])) $log_from = $msg["log_from"];
            if (isset($msg["platform"])) $platform = $msg["platform"];
            if (isset($msg["deviceId"])) $deviceId = $msg["deviceId"];
            if (isset($msg["statCode"])) $statCode = $msg["statCode"];
            if (isset($msg["content"])) $content = $msg["content"];

            //具体处理函数
            $resp = $this->func_temperature_huitp_process($platform, $deviceId, $statCode, $content);
        }
        else{
            $resp = ""; //啥都不ECHO
        }

        //返回ECHO
        if (!empty($resp))
        {
            $log_content = "T:" . json_encode($resp);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($resp);
        }

        //返回
        return true;
    }

}//End of class_temperature_service

?>