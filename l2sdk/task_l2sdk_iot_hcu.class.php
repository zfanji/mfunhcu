<?php
/**
 * Created by PhpStorm.
 * User: zehongli
 * Date: 2015/12/9
 * Time: 23:09
 */
include_once "../l1comvm/vmlayer.php";
include_once "../l2sdk/dbi_l2sdk_iot_hcu.class.php";

//HCU硬件设备级 Layer 2 SDK
//TASK_ID = MFUN_TASK_ID_L2SDK_IOT_HCU
class classTaskL2sdkIotHcu
{
    //构造函数
    public function __construct()
    {

    }

    public function dummy_data_response($fromUser)
    {
        $pHeader = "##"; //包头固定为“##”
        $pduLen = "0058";  // = 20+5+7+12+6+4+4
        $strDate = date('YmdHis',time());
        $qn = $this->str_padding($strDate,20);
        $st = "11111";
        $cn = "ZHB_HRB";
        $mn = $this->str_padding($fromUser,12);;  //HCU_SH_03010  ASSCII码484355 5F 5348 5F
        $pw = "BXBXBX";
        $pnum = "5555";
        $pno = "6666";
        $dataField = $qn . $st .$cn .$mn .$pw .$pnum . $pno;

        $crc = strtoupper(dechex($this->crc16($dataField,$crc=0xffff)));
        $cr = "0D"; //回车键CR
        $lf = "0A"; //换行键LF
        $pdu =  $pHeader .$pduLen .$dataField . $crc . $cr . $lf;
        $resp = pack("A*",$pdu);
        //var_dump($resp);

        return $resp;
    }

    public function str_padding($strInput,$lenInput)
    {
        $padding = "_"; //填充字符
        $len = strlen($strInput);
        while ($len < $lenInput)
        {
            $strInput = $strInput . $padding;
            $len++;
        }

        return $strInput;
    }

    public function crc16($string,$crc=0xffff) {

        for ( $x=0; $x<strlen( $string ); $x++ ) {

            $crc = $crc ^ ord( $string[$x] );
            for ($y = 0; $y < 8; $y++) {

                if ( ($crc & 0x0001) == 0x0001 )
                    $crc = ( ($crc >> 1 ) ^ 0xA001 );
                else
                    $crc =    $crc >> 1;
            }
        }
        return $crc;
    }

    public function crc_check($data, $crc)
    {
        $calc_crc = strtoupper(dechex($this->crc16($data, 0xffff)));

        if ($calc_crc == $crc)
            return true;
        else
            return false;
    }

    function getStrBetween($kw1,$mark1,$mark2)
    {
        $kw=$kw1;
        $kw='123'.$kw.'123';
        $st =stripos($kw,$mark1);
        $ed =stripos($kw,$mark2);
        if(($st==false||$ed==false)||$st>=$ed)
            return 0;
        $kw=substr($kw,($st+1),($ed-$st-1));
        return $kw;
    }

    private function receive_hcu_heart_beat_xmlmsg($parObj, $data, $project, $log_from)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());

        $toUser = trim($data->ToUserName);
        $deviceId = trim($data->FromUserName);
        $createTime = trim($data->CreateTime);  //暂时不处理，后面增加时间合法性的判断
        $content = trim($data->Content);
        $funcFlag = trim($data->FuncFlag);

        //取DB中的硬件信息，判断基本信息
        $cDbObj = new classDbiL2sdkHcu();
        $result = $cDbObj->dbi_hcuDevice_valid_device($deviceId); //FromUserName对应每个HCU硬件的设备编号
        if (empty($result)){
            $result = "HCU_IOT: invalid device ID";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }
        else{
            $statCode = $result;
        }

        //收到非本消息体该收到的消息
        if ($toUser != MFUN_CLOUD_HCU ){
            $result = "HCU_IOT: FHYS XML message invalid ToUserName";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }

        //解开key，处理CMDID
        $key = unpack('A2Key', $content);
        $ctrl_key = hexdec($key['Key'])& 0xFF;
        if($ctrl_key == MFUN_HCU_CMDID_HEART_BEAT){
            $hcuObj = new classApiL2snrCommonService();
            $resp = $hcuObj->func_heartBeat_process();
        }
        else
            $resp ="HCU_IOT: invalid command type";

        if (!empty($resp))//ECHO回去
        {
            $log_content = "T:" . json_encode($resp);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($resp);
            $DevCode = $log_from;
            $respCmd = trim($resp);
            $client = new socket_client_sync($DevCode, $respCmd);
            $client->connect();
        }
        //返回
        return true;
    }

    private function receive_hcu_command_xmlmsg($parObj, $data, $project, $log_from)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());

        $toUser = trim($data->ToUserName);
        $deviceId = trim($data->FromUserName);
        $createTime = trim($data->CreateTime);  //暂时不处理，后面增加时间合法性的判断
        $content = trim($data->Content);
        $funcFlag = trim($data->FuncFlag);

        //取DB中的硬件信息，判断基本信息
        $cDbObj = new classDbiL2sdkHcu();
        $result = $cDbObj->dbi_hcuDevice_valid_device($deviceId); //FromUserName对应每个HCU硬件的设备编号
        if (empty($result)){
            $result = "HCU_IOT: invalid device ID";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }
        else{
            $statCode = $result;
        }

        //收到非本消息体该收到的消息
        if ($toUser != MFUN_CLOUD_HCU ){
            $result = "HCU_IOT: FHYS XML message invalid ToUserName";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }

        //解开key，处理CMDID
        $key = unpack('A2Key', $content);
        $ctrl_key = hexdec($key['Key'])& 0xFF;
        switch ($ctrl_key) {
            case MFUN_HCU_CMDID_VERSION_SYNC:
                $hcuObj = new classApiL2snrCommonService();
                $resp = $hcuObj->func_version_update_process(MFUN_TECH_PLTF_HCUGX, $deviceId, $content);
                break;
            case MFUN_HCU_CMDID_TIME_SYNC:
                $hcuObj = new classApiL2snrCommonService();
                $resp = $hcuObj->func_timeSync_process(MFUN_TECH_PLTF_HCUGX, $deviceId, $data);
                break;
            case MFUN_HCU_CMDID_INVENTORY_DATA:
                $hcuObj = new classApiL2snrCommonService();
                $resp = $hcuObj->func_inventory_data_process(MFUN_TECH_PLTF_HCUGX, $deviceId, $content);
                break;
            case MFUN_HCU_CMDID_HCU_POLLING:
                $hcuObj = new classApiL2snrCommonService();
                $resp = $hcuObj->func_hcuPolling_process($deviceId);
                break;
            default:
                $resp ="HCU_IOT: invalid command type";
                break;
        }

        if (!empty($resp))//ECHO回去
        {
            $log_content = "T:" . json_encode($resp);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($resp);
            $DevCode = $log_from;
            $respCmd = trim($resp);
            $client = new socket_client_sync($DevCode, $respCmd);
            $client->connect();
        }
        //返回
        return true;
    }

    private function receive_hcu_pm_xmlmsg($parObj, $data, $project, $log_from)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());

        $toUser = trim($data->ToUserName);
        $deviceId = trim($data->FromUserName);
        $createTime = trim($data->CreateTime);  //暂时不处理，后面增加时间合法性的判断
        $content = trim($data->Content);
        $funcFlag = trim($data->FuncFlag);

        //取DB中的硬件信息，判断基本信息
        $cDbObj = new classDbiL2sdkHcu();
        $result = $cDbObj->dbi_hcuDevice_valid_device($deviceId); //FromUserName对应每个HCU硬件的设备编号
        if (empty($result)){
            $result = "HCU_IOT: invalid device ID";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }
        else{
            $statCode = $result;
        }

        //收到非本消息体该收到的消息
        if ($toUser != MFUN_CLOUD_HCU ){
            $result = "HCU_IOT: FHYS XML message invalid ToUserName";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }

        //解开key，处理CMDID
        $key = unpack('A2Key', $content);
        $ctrl_key = hexdec($key['Key'])& 0xFF;
        if($ctrl_key == MFUN_HCU_CMDID_HCU_PERFORMANCE){
            $hcuObj = new classApiL2snrCommonService();
            $resp = $hcuObj->func_hcuPerformance_process($deviceId, $statCode, $content);
        }
        else
            $resp ="HCU_IOT: invalid command type";

        if (!empty($resp))//ECHO回去
        {
            $log_content = "T:" . json_encode($resp);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($resp);
            $DevCode = $log_from;
            $respCmd = trim($resp);
            $client = new socket_client_sync($DevCode, $respCmd);
            $client->connect();
        }
        //返回
        return true;
    }

    private function receive_hcu_alarm_xmlmsg($parObj, $data, $project, $log_from)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());

        $toUser = trim($data->ToUserName);
        $deviceId = trim($data->FromUserName);
        $createTime = trim($data->CreateTime);  //暂时不处理，后面增加时间合法性的判断
        $content = trim($data->Content);
        $funcFlag = trim($data->FuncFlag);

        //取DB中的硬件信息，判断基本信息
        $cDbObj = new classDbiL2sdkHcu();
        $result = $cDbObj->dbi_hcuDevice_valid_device($deviceId); //FromUserName对应每个HCU硬件的设备编号
        if (empty($result)){
            $result = "HCU_IOT: invalid device ID";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }
        else{
            $statCode = $result;
        }

        //收到非本消息体该收到的消息
        if ($toUser != MFUN_CLOUD_HCU ){
            $result = "HCU_IOT: FHYS XML message invalid ToUserName";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }

        //解开key，处理CMDID
        $key = unpack('A2Key', $content);
        $ctrl_key = hexdec($key['Key'])& 0xFF;
        if($ctrl_key == MFUN_HCU_CMDID_HCU_ALARM_DATA){
            $hcuObj = new classApiL2snrCommonService();
            $resp = $hcuObj->func_hcuAlarmData_process($deviceId, $statCode, $content, $funcFlag);
        }
        else
            $resp ="HCU_IOT: invalid command type";

        if (!empty($resp))//ECHO回去
        {
            $log_content = "T:" . json_encode($resp);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($resp);
            $DevCode = $log_from;
            $respCmd = trim($resp);
            $client = new socket_client_sync($DevCode, $respCmd);
            $client->connect();
        }
        //返回
        return true;
    }

    private function receive_hcu_picdata_xmlmsg($parObj, $data, $project, $fromUser)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $timestamp = time();
        $log_time = date("Y-m-d H:i:s", $timestamp);

        //目前HCU发送的数据已经是ASCII码，不需要再进行解码
        //$content = base64_decode($data->Content);
        //$content = unpack('H*',$content);
        //$strContent = strtoupper($content["1"]); //转换成16进制格式的字符串
        $toUser = trim($data->ToUserName);
        $deviceId = trim($data->FromUserName);
        $createTime = trim($data->CreateTime);  //暂时不处理，后面增加时间合法性的判断
        $data_str = trim($data->Content);
        $content = pack("H*", $data_str);
        $funcFlag = trim($data->FuncFlag);

        //取DB中的硬件信息，判断基本信息
        $cDbObj = new classDbiL2sdkHcu();
        $result = $cDbObj->dbi_hcuDevice_valid_device($deviceId); //FromUserName对应每个HCU硬件的设备编号
        if (empty($result)){
            $result = "HCU_IOT: invalid device ID";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $fromUser, $log_time, $log_content);
            echo trim($result);
            return true;
        }
        else{
            $statCode = $result;
        }

        //收到非本消息体该收到的消息
        if ($toUser != MFUN_CLOUD_HCU ){
            $result = "HCU_IOT: FHYS XML message invalid ToUserName";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $fromUser, $log_time, $log_content);
            echo trim($result);
            return true;
        }

        $msg = array("project" => $project,
            "log_from" => $fromUser,
            "platform" => MFUN_TECH_PLTF_HCUSTM,
            "deviceId" => $deviceId,
            "statCode" => $statCode,
            "content" => $content,
            "funcFlag" => $funcFlag);
        if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                MFUN_TASK_ID_L2SENSOR_HSMMP,
                MSG_ID_L2SDK_HCU_TO_L2SNR_HSMMP,
                "MSG_ID_L2SDK_HCU_TO_L2SNR_HSMMP",
                $msg) == false) $resp = "Send to message buffer error";
        else
            $resp = "";

        return $resp;
    }

    private function receive_hcu_huitp_xmlmsg($parObj, $data, $project, $log_from)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());

        //目前HCU发送的数据已经是ASCII码，不需要再进行解码
        //$content = base64_decode($data->Content);
        //$content = unpack('H*',$content);
        //$strContent = strtoupper($content["1"]); //转换成16进制格式的字符串
        $toUser = trim($data->ToUserName);
        $fromUser = trim($data->FromUserName);
        $createTime = trim($data->CreateTime);  //暂时不处理，后面增加时间合法性的判断
        $content = trim($data->Content);
        $funcFlag = trim($data->FuncFlag);

        //取DB中的硬件信息，判断基本信息
        $l2sdkHcuDbObj = new classDbiL2sdkHcu();
        $result = $l2sdkHcuDbObj->dbi_hcuDevice_valid_device($fromUser); //FromUserName对应每个HCU硬件的设备编号
        if (empty($result)){
            $result = "HCU_IOT: invalid device ID";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            return true;
        }
        else{
            $statCode = $result;
        }

        //收到非本消息体该收到的消息
        if ($toUser != MFUN_CLOUD_HCU ){
            $result = "HCU_IOT: FHYS XML message invalid ToUserName";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }
        $msg = array("project" => $project,
            "log_from" => $log_from,
            "platform" => MFUN_TECH_PLTF_HCUSTM,
            "deviceId" => $fromUser,
            "statCode" => $statCode,
            "content" => $content,
            "funcFlag" => $funcFlag);
        if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                MFUN_TASK_ID_L2SENSOR_HUMID,
                MSG_ID_L2SDK_HCU_TO_L2SNR_HUMID,
                "MSG_ID_L2SDK_HCU_TO_L2SNR_HUMID",
                $msg) == false) $resp = "Send to message buffer error";
        else
            $resp = "";
        return $resp;
    }

    //业务消息“XML格式”的处理函数，跳转到对应的业务处理模块
    private function receive_hcu_text_xmlmsg($parObj, $data, $project, $log_from)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());

        //目前HCU发送的数据已经是ASCII码，不需要再进行解码
        //$content = base64_decode($data->Content);
        //$content = unpack('H*',$content);
        //$strContent = strtoupper($content["1"]); //转换成16进制格式的字符串
        $toUser = trim($data->ToUserName);
        $deviceId = trim($data->FromUserName);
        $createTime = trim($data->CreateTime);  //暂时不处理，后面增加时间合法性的判断
        $content = trim($data->Content);
        $funcFlag = trim($data->FuncFlag);

        //取DB中的硬件信息，判断基本信息
        $cDbObj = new classDbiL2sdkHcu();
        $result = $cDbObj->dbi_hcuDevice_valid_device($deviceId); //FromUserName对应每个HCU硬件的设备编号
        if (empty($result)){
            $result = "HCU_IOT: invalid device ID";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }
        else{
            $statCode = $result;
        }

        //收到非本消息体该收到的消息
        if ($toUser != MFUN_CLOUD_HCU ){
            $result = "HCU_IOT: FHYS XML message invalid ToUserName";
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($result);
            return true;
        }

        //解开key，处理CMDID
        $key = unpack('A2Cmd/A2Opt', $content);
        $cmd_key = hexdec($key['Cmd'])& 0xFF;
        $opt_key = hexdec($key['Opt'])& 0xFF;
        switch ($cmd_key)
        {
            case MFUN_HCU_CMDID_EMC_DATA:  //定时辐射强度处理
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUGX,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_EMC,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_EMC,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_EMC",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_PM25_DATA:
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUGX,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_PM25,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_PM25,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_PM25",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_WINDDIR_DATA:
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUGX,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_WINDDIR,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_WINDDIR,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_WINDDIR",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_WINDSPD_DATA:
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUGX,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_WINDSPD,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_WINDSPD,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_WINDSPD",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_TEMP_DATA:
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUGX,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_TEMP,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_TEMP,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_TEMP",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_HUMID_DATA:
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUGX,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_HUMID,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_HUMID,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_HUMID",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_HSMMP_DATA:
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUGX,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => array("content" =>$content, "funcFlag" => $funcFlag));
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_HSMMP,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_HSMMP,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_HSMMP",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_NOISE_DATA:
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUGX,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_NOISE,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_NOISE,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_NOISE",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_SW_UPDATE:
                $resp ="HCU_IOT: Not yet support!";
                break;

            case MFUN_HCU_CMDID_FHYS_BOXSTATUS: //光交箱状态聚合控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => array("content" =>$content, "funcFlag" => $funcFlag));
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_BOXSTATUS,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_BOXSTATUS",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_BOXOPEN: //光交箱门锁开启请求控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => array("content" =>$content, "funcFlag" => $funcFlag));
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_BOXOPEN,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_BOXOPEN",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            //**以下FHYS控制为了兼容老版本，一定时间后可以删除**
            case MFUN_HCU_CMDID_FHYS_LOCK: //智能锁控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => array("content" =>$content, "funcFlag" => $funcFlag));
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_DOORLOCK,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_DOORLOCK",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_DOOR://光交箱门控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => array("content" =>$content, "funcFlag" => $funcFlag));
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_DOORLOCK,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_DOORLOCK",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_RFID://RFID控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_RFID,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_RFID,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_RFID",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_BLE://BLE控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_BLE,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_BLE,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_BLE",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_GPRS://GPRS控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_GPRS,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_GPRS,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_GPRS",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_BATT://电池控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_BATT,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_BATT,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_BATT",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_VIBR://震动控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_VIBR,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_VIBR,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_VIBR",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_SMOK://烟雾控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_SMOK,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_SMOK,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_SMOK",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_WATER://水浸控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_WATER,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_WATER,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_WATER",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_TEMP://温度控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_TEMP,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_TEMP,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_TEMP",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_FHYS_HUMI://湿度控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_HUMID,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_HUMID,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_HUMID",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case MFUN_HCU_CMDID_BFSC_WEIGHT://波峰智能组合秤控制字
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUPI,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => $content);
                if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                        MFUN_TASK_ID_L2SENSOR_WEIGHT,
                        MSG_ID_L2SDK_HCU_TO_L2SNR_WEIGHT,
                        "MSG_ID_L2SDK_HCU_TO_L2SNR_WEIGHT",
                        $msg) == false) $resp = "Send to message buffer error";
                else $resp = "";
                break;

            case HUITP_CMDID_uni_ccl_lock:
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => array("content" =>$content, "funcFlag" => $funcFlag));
                if ($opt_key == HUITP_OPTID_uni_data_resp){
                    if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                            MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                            HUITP_MSGID_uni_ccl_lock_resp,
                            "HUITP_MSGID_uni_ccl_lock_resp",
                            $msg) == false) $resp = "Send to message buffer error";
                    else $resp = "";
                }
                elseif ($opt_key == HUITP_OPTID_uni_data_report){
                    if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                            MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                            HUITP_MSGID_uni_ccl_lock_report,
                            "HUITP_MSGID_uni_ccl_lock_report",
                            $msg) == false) $resp = "Send to message buffer error";
                    else $resp = "";
                }
                elseif ($opt_key == HUITP_OPTID_uni_auth_inq){
                    if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                            MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                            HUITP_MSGID_uni_ccl_lock_auth_inq,
                            "HUITP_MSGID_uni_ccl_lock_auth_inq",
                            $msg) == false) $resp = "Send to message buffer error";
                    else $resp = "";
                }
                elseif ($opt_key == HUITP_OPTID_uni_auth_resp){
                    if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                            MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                            HUITP_MSGID_uni_ccl_lock_auth_resp,
                            "HUITP_MSGID_uni_ccl_lock_auth_resp",
                            $msg) == false) $resp = "Send to message buffer error";
                    else $resp = "";
                }
                else $resp = "";
                break;

            case HUITP_CMDID_uni_ccl_state:
                $msg = array("project" => $project,
                    "log_from" => $log_from,
                    "platform" => MFUN_TECH_PLTF_HCUSTM,
                    "deviceId" => $deviceId,
                    "statCode" => $statCode,
                    "content" => array("content" =>$content, "funcFlag" => $funcFlag));
                if ($opt_key == HUITP_OPTID_uni_data_resp){
                    if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                            MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                            HUITP_MSGID_uni_ccl_state_resp,
                            "HUITP_MSGID_uni_ccl_state_resp",
                            $msg) == false) $resp = "Send to message buffer error";
                    else $resp = "";
                }
                elseif ($opt_key == HUITP_OPTID_uni_data_report){
                    if ($parObj->mfun_l1vm_msg_send(MFUN_TASK_ID_L2SDK_IOT_HCU,
                            MFUN_TASK_ID_L2SENSOR_DOORLOCK,
                            HUITP_MSGID_uni_ccl_state_report,
                            "HUITP_MSGID_uni_ccl_state_report",
                            $msg) == false) $resp = "Send to message buffer error";
                    else $resp = "";
                }
                else $resp = "";
                break;

            default:
                $resp ="HCU_IOT: invalid command type";
                break;
        }
        //ECHO回去
        if (!empty($resp))
        {
            $log_content = "T:" . json_encode($resp);
            $loggerObj->logger($project, $log_from, $log_time, $log_content);
            echo trim($resp);
            $DevCode = $log_from;
            $respCmd = trim($resp);
            $client = new socket_client_sync($DevCode, $respCmd);

            $client->connect();
        }

        //返回
        return true;
    } //receive_hcu_xmlMsg处理结束


    //处理环保局要求格式的消息
    public function receive_hcu_zhbMessage($parObj, $project, $log_from, $pdu)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());

        $pdu_format = "A2Header/A4Len";
        $temp = unpack($pdu_format, $pdu);

        $header = $temp['Header'];  //通信包包头
        //$pduLen = hexdec($temp['Len'])& 0xFFFF;//数据段长度
        $pduLen = $temp['Len']& 0xFFFF;//数据段长度

        $sdu_body = substr($pdu, 6, $pduLen); //数据段,变长，0～1024
        $crc = substr($pdu, 6+$pduLen, 4);  //CRC
        //$tail = substr($pdu, 6+$pduLen+4, 2);  //包尾

        //先进行CRC校验，如果失败直接返回
        $result = $this->crc_check($sdu_body,$crc);  //数据段CRC校验
        if ($result == false)
            return "HCU_IOT: ZHB message CRC error";  //CRC校验失败直接返回

        //数据段解码
        $sdu_format = "A20QN/A5ST/A7CN/A12MN/A6PW";
        $fix_len = 20+5+7+12+6;

        $temp = unpack($sdu_format, $sdu_body);


        $qn = trim($temp['QN'], '_');  //请求编号
        $st = trim($temp['ST'], '_');  //系统编号
        $cn = trim($temp['CN'], '_');  //命令编号
        $mn = trim($temp['MN'], '_');  //设备编号
        $pw = trim($temp['PW'], '_');   //访问密码

        switch($cn)
        {
            case MFUN_L2SDK_IOTHCU_ZHB_NOM_FRAME:
                $sdu_format = "A20QN/A5ST/A7CN/A12MN/A6PW/A4PNUM/A4PNO";
                $temp = unpack($sdu_format, $sdu_body);
                $pnum = $temp['PNUM']; //总包号
                $pno = $temp['PNO']; //包号
                $fix_len = $fix_len + 4 + 4; //=20+5+7+12+6+4+4
                $dataLen =$pduLen - $fix_len;
                $data = substr($sdu_body, $fix_len, $dataLen);  //数据区的处理等规范业务逻辑明确后再处理
                $resp = $this->dummy_data_response($mn);
                break;
            case MFUN_L2SDK_IOTHCU_ZHB_HRB_FRAME:
                $sdu_format = "A20QN/A5ST/A7CN/A12MN/A6PW/A3FLAG";
                $temp = unpack($sdu_format, $sdu_body);
                $flag = $temp['FLAG']; //数据是否拆分及应答标志
                $fix_len = $fix_len + 4 ; //=20+5+7+12+6+3
                $cp_len = $pduLen - $fix_len;
                $cp = substr($sdu_body, $fix_len, $cp_len);

                $resp = $this->dummy_data_response($mn);
                break;
            default:
                $resp ="HCU_IOT: invalid frame type";
                break;
        }

        //ECHO回去，即使是空的，也一并记录下来，说明处理有问题，或者本来就应该返回空内容
        $log_content = "T:" . json_encode($resp);
        $loggerObj->logger($project, $log_from, $log_time, $log_content);
        echo trim($resp);

        //返回
        return true;
    }//receive_hcu_ZhbMsg处理结束

    public function receive_hcu_appleMessage($parObj, $project, $log_from, $msg)
    {

    }

    public function receive_hcu_jdMessage($parObj, $project, $log_from, $msg)
    {

    }

    /**************************************************************************************
     *                             任务入口函数                                           *
     *************************************************************************************/
    //错误的地方，是否需要采用exit过程，待定
    public function mfun_l2sdk_iot_hcu_task_main_entry($parObj, $msgId, $msgName, $msg)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());

        //入口消息内容判断
        if (empty($msg) == true) {
            $loggerObj->logger("MFUN_TASK_ID_L2SDK_IOT_HCU", "mfun_l2sdk_iot_hcu_task_main_entry", $log_time, "R: Received null message body.");
            echo "";
            return false;
        }
        if (($msgId != MSG_ID_L1VM_TO_L2SDK_IOT_HCU_INCOMING) || ($msgName != "MSG_ID_L1VM_TO_L2SDK_IOT_HCU_INCOMING")){
            $result = "Msgid or MsgName error";
            $log_content = "P:" . json_encode($result);
            $loggerObj->logger("MFUN_TASK_ID_L2SDK_IOT_HCU", "mfun_l2sdk_iot_hcu_task_main_entry", $log_time, $log_content);
            echo trim($result);
            return false;
        }

        //正式处理消息格式和消息内容的过程
        $format = substr(trim($msg), 0, 2);
        switch ($format) {
            case MFUN_L2_FRAME_FORMAT_PREFIX_XML:
                $log_content = "R:" . trim($msg);
                //FHYS测试时发现有多条xml消息粘连在一起的情况，此处加保护保证只取第一条完整xml消息
                $msg = $this->getStrBetween($msg,"<xml>","</xml>");
                $msg = "<" . $msg . "</xml>";
                libxml_disable_entity_loader(true);  //prevent XML entity injection
                $postObj = simplexml_load_string($msg, 'SimpleXMLElement');  //防止破坏CDATA的内容，进而影响智能硬件L3消息体
                //$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
                $textTpl = "<xml>
                        <ToUserName><![CDATA[%s]]></ToUserName>
                        <FromUserName><![CDATA[%s]]></FromUserName>
                        <CreateTime>%s</CreateTime>
                        <MsgType><![CDATA[%s]]></MsgType>
                        <Content><![CDATA[%s]]></Content>
                        <FuncFlag>0</FuncFlag></xml>";

                //XML消息解码
                $toUser = trim($postObj->ToUserName);
                $fromUser = trim($postObj->FromUserName);
                $createTime = trim($postObj->CreateTime);
                $msgType = trim($postObj->MsgType);
                $content = trim($postObj->Content);
                $funcFlag = trim($postObj->FuncFlag);

                $log_time = date("Y-m-d H:i:s",$createTime);
                //定义本入口函数的logger处理对象及函数
                $loggerObj = new classApiL1vmFuncCom();

                //消息或者说帧类型分离，l2SDK只进行协议类型解码，不对消息的content进行处理，判断协议类型后发送给专门的l2codec任务处理
                switch ($msgType)
                {
                    case "huitp_text"://HUITP消息处理
                        $project = MFUN_PRJ_HCU_XML;
                        $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                        $result = $this->receive_hcu_huitp_xmlmsg($parObj, $postObj, $project, $fromUser);
                        break;
                    //以下是基于老的消息的函数处理，为了保持现有业务的平稳运行，暂时保持不动。等HUITP编解码模块测试完整后再进行改造
                    case "hcu_text":
                        $project = MFUN_PRJ_HCU_XML;
                        $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                        $this->receive_hcu_text_xmlmsg($parObj, $postObj, $project, $fromUser);
                        break;
                    case "hcu_pic":
                        $project = MFUN_PRJ_HCU_XML;
                        $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                        $this->receive_hcu_picdata_xmlmsg($parObj, $postObj, $project, $fromUser);
                        break;
                    case "hcu_heart_beat":
                        $project = MFUN_PRJ_HCU_XML;
                        $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                        $this->receive_hcu_heart_beat_xmlmsg($parObj, $postObj, $project, $fromUser);
                        break;
                    case "hcu_command":
                        $project = MFUN_PRJ_HCU_XML;
                        $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                        $this->receive_hcu_command_xmlmsg($parObj, $postObj, $project, $fromUser);
                        break;
                    case "hcu_polling":
                        $project = MFUN_PRJ_HCU_XML;
                        $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                        $this->receive_hcu_command_xmlmsg($parObj, $postObj, $project, $fromUser);
                        break;
                    case "hcu_pm":
                        $project = MFUN_PRJ_HCU_XML;
                        $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                        $this->receive_hcu_pm_xmlmsg($parObj, $postObj, $project, $fromUser);
                        break;
                    case "hcu_alarm":
                        $project = MFUN_PRJ_HCU_XML;
                        $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                        $this->receive_hcu_alarm_xmlmsg($parObj, $postObj, $project, $fromUser);
                        break;
                    default:
                        //收内容存储
                        $project = "NULL";
                        $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                        $log_from = "CLOUD_NONE";
                        $result = "[XML_FORMAT]unknown message type: " . $msgType;
                        //差错返回
                        $log_content = "T:" . json_encode($result);
                        $loggerObj->logger($project, $log_from, $log_time, $log_content);
                        echo trim($result);
                        break;
                }
                break;
            case MFUN_L2_FRAME_FORMAT_PREFIX_ZHB:
                $project = MFUN_PRJ_HCU_ZHB;
                $fromUser = "ZHBMSG_TO_UNPACK";
                $log_content = "R:" . trim($msg);
                $loggerObj->logger($project, $fromUser, $log_time, $log_content); //ZHB接收消息log保存
                $this->receive_hcu_zhbMessage($parObj, $project, $fromUser, $msg);
                break;
            case MFUN_L2_FRAME_FORMAT_PREFIX_APPLE:
                $project = MFUN_PRJ_HCU_APPLE;
                $fromUser = "APPLEMSG_TO_UNPACK";
                $log_content = "R:" . trim($msg);
                $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                $this->receive_hcu_appleMessage($parObj, $project, $fromUser, $msg);
                break;
            case MFUN_L2_FRAME_FORMAT_PREFIX_JD:
                $project = MFUN_PRJ_HCU_JD;
                $fromUser = "JDMSG_TO_UNPACK";
                $log_content = "R:" . trim($msg);
                $loggerObj->logger($project, $fromUser, $log_time, $log_content);
                $this->receive_hcu_jdMessage($parObj, $project, $fromUser, $msg);
                break;
            default:
                $result = "Unknown message format";
                $project = "NULL";
                $log_from = "CLOUD_NONE";
                //差错返回
                $log_content = "T:" . json_encode($result);
                $loggerObj->logger($project, $log_from, $log_time, $log_content);
                echo trim($result);
                break;
        }

        //处理结果
        //由于消息的分布发送到各个任务模块中去了，这里不再统一处理ECHO返回，而由各个任务模块单独完成
        if (!empty($result)) {
            $timestamp = time();
            $log_time = date("Y-m-d H:i:s", $timestamp);
            $log_content = "T:" . json_encode($result);
            $loggerObj->logger($project, $fromUser, $log_time, $log_content);
            echo trim($result);
        }

        //结束，返回
        return true;
    }//End of 任务入口函数

}

?>