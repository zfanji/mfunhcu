<?php
/**
 * Created by PhpStorm.
 * User: jianlinz
 * Date: 2016/7/15
 * Time: 10:12
 */
include_once "dbi_l2snr_ihm.class.php";
class classTaskL2snrIhm
{
    //构造函数
    public function __construct()
    {

    }

    function func_ihm_cj188_ul_read_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus)
    {
        $cj188Obj = new classDbiL2snrIhm(); //初始化一个UI DB对象
        $format = "A2DI0/A2DI1/A2Ser";
        $temp = unpack($format, $msgBody);
        $DI0 = (hexdec($temp['DI0'])) & 0xFF;
        $DI1 = (hexdec($temp['DI1'])) & 0xFF;
        $DI0DI1 = ($DI0 << 8) + $DI1;

        //正式处理不同的DI0/DI1
        $resp = "";
        switch($DI0DI1){
            case MFUN_NBIOT_CJ188_READ_DI0DI1_CURRENT_COUNTER_DATA:
                if (($msgLen = 0x2E) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A2ToHp/A2ToH0/A2ToH2/A2ToH4/A2ToHu/A2CuHp/A2CuH0/A2CuH2/A2CuH4/A2CuHu/A2HPp/A2HP0/A2HP2/A2HP4/A2HPu/A2Fop/A2Fo0/A2Fo2/A2Fo4/A2Fou/A2AFp/A2AF0/A2AF2/A2AF4/A2AFu/A2SWp/A2SW0/A2SW2/A2BWp/A2BW0/A2BW2/A2AW0/A2AW2/A2AW4/A14RealTime/A4ST";
                    $temp = unpack($format, $msgBody);
                    //结算日热量
                    $ToHp = hexdec(dechex($temp['ToHp'])) & 0xFF;
                    $ToH0 = hexdec(dechex($temp['ToH0'])) & 0xFF;
                    $ToH2 = hexdec(dechex($temp['ToH2'])) & 0xFF;
                    $ToH4 = hexdec(dechex($temp['ToH4'])) & 0xFF;
                    $ToHu = $temp['ToHu'];
                    $ToH = $ToH4 * 10000 + $ToH2 * 100 + $ToH0 + $ToHp / 100;
                    //当前热量
                    $CuHp = hexdec(dechex($temp['CuHp'])) & 0xFF;
                    $CuH0 = hexdec(dechex($temp['CuH0'])) & 0xFF;
                    $CuH2 = hexdec(dechex($temp['CuH2'])) & 0xFF;
                    $CuH4 = hexdec(dechex($temp['CuH4'])) & 0xFF;
                    $CuHu = $temp['CuHu'];
                    $CuH = $CuH4 * 10000 + $CuH2 * 100 + $CuH0 + $CuHp / 100;
                    //热功率
                    $HPp = hexdec(dechex($temp['HPp'])) & 0xFF;
                    $HP0 = hexdec(dechex($temp['HP0'])) & 0xFF;
                    $HP2 = hexdec(dechex($temp['HP2'])) & 0xFF;
                    $HP4 = hexdec(dechex($temp['HP4'])) & 0xFF;
                    $HPu = $temp['HPu'];
                    $HP = $HP4 * 10000 + $HP2 * 100 + $HP0 + $HPp / 100;
                    //流量
                    $Fop = hexdec(dechex($temp['Fop'])) & 0xFF;
                    $Fo0 = hexdec(dechex($temp['Fo0'])) & 0xFF;
                    $Fo2 = hexdec(dechex($temp['Fo2'])) & 0xFF;
                    $Fo4 = hexdec(dechex($temp['Fo4'])) & 0xFF;
                    $Fou = $temp['Fou'];
                    $Fo = $Fo4 * 10000 + $Fo2 * 100 + $Fo0 + $Fop / 100;
                    //累计流量
                    $AFp = hexdec(dechex($temp['AFp'])) & 0xFF;
                    $AF0 = hexdec(dechex($temp['AF0'])) & 0xFF;
                    $AF2 = hexdec(dechex($temp['AF2'])) & 0xFF;
                    $AF4 = hexdec(dechex($temp['AF4'])) & 0xFF;
                    $AFu = $temp['AFu'];
                    $AF = $AF4 * 10000 + $AF2 * 100 + $AF0 + $AFp / 100;
                    //供水温度
                    $SWp = hexdec(dechex($temp['SWp'])) & 0xFF;
                    $SW0 = hexdec(dechex($temp['SW0'])) & 0xFF;
                    $SW2 = hexdec(dechex($temp['SW2'])) & 0xFF;
                    $SW = $SW2 * 100 + $SW0 + $SWp / 100;
                    //回水温度
                    $BWp = hexdec(dechex($temp['BWp'])) & 0xFF;
                    $BW0 = hexdec(dechex($temp['BW0'])) & 0xFF;
                    $BW2 = hexdec(dechex($temp['BW2'])) & 0xFF;
                    $BW = $BW2 * 100 + $BW0 + $BWp / 100;
                    //累计工作时间
                    $AW0 = hexdec(dechex($temp['AW0'])) & 0xFF;
                    $AW2 = hexdec(dechex($temp['AW2'])) & 0xFF;
                    $AW4 = hexdec(dechex($temp['AW4'])) & 0xFF;
                    $AW = $AW4 * 10000 + $AW2 * 100 + $AW0;
                    $realtime = $temp['RealTime'];
                    $st = $temp['ST'];
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save($msgAddr, $msgType, $ToH, $ToHu, $CuH, $CuHu, $HP, $HPu,$Fo, $Fou, $AF, $AFu, $SW, $BW, $AW, $realtime, $st);
                }
                else{
                    $resp = "";
                }
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA1:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 1);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA2:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 2);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA3:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 3);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA4:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 4);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA5:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 5);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA6:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 6);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA7:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 7);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA8:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 8);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA9:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 9);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA10:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 10);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA11:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 11);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_HISTORY_COUNTER_DATA12:
                $resp = $this->func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, 12);
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_PRICE_TABLE:
                if (($msgLen == 0x12) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A2P1p/A2P10/A2P12/A2V10/A2V12/A2V14/A2P2p/A2P20/A2P22/A2V20/A2V22/A2V24/A2P3p/A2P30/A2P32";
                    $temp = unpack($format, $msgBody);
                    //当前价格1
                    $P1p = hexdec(dechex($temp['P1p'])) & 0xFF;
                    $P10 = hexdec(dechex($temp['P10'])) & 0xFF;
                    $P12 = hexdec(dechex($temp['P12'])) & 0xFF;
                    $P1 = $P12 * 100 + $P10 + $P1p / 100;
                    //当前流量1
                    $V10 = hexdec(dechex($temp['V10'])) & 0xFF;
                    $V12 = hexdec(dechex($temp['V12'])) & 0xFF;
                    $V14 = hexdec(dechex($temp['V14'])) & 0xFF;
                    $V1 = $V14 * 10000 + $V12 * 100 + $V10;
                    //当前价格2
                    $P2p = hexdec(dechex($temp['P2p'])) & 0xFF;
                    $P20 = hexdec(dechex($temp['P20'])) & 0xFF;
                    $P22 = hexdec(dechex($temp['P22'])) & 0xFF;
                    $P2 = $P22 * 100 + $P20 + $P2p / 100;
                    //当前流量2
                    $V20 = hexdec(dechex($temp['V20'])) & 0xFF;
                    $V22 = hexdec(dechex($temp['V22'])) & 0xFF;
                    $V24 = hexdec(dechex($temp['V24'])) & 0xFF;
                    $V2 = $V24 * 10000 + $V22 * 100 + $V20;
                    //当前价格3
                    $P3p = hexdec(dechex($temp['P3p'])) & 0xFF;
                    $P30 = hexdec(dechex($temp['P30'])) & 0xFF;
                    $P32 = hexdec(dechex($temp['P32'])) & 0xFF;
                    $P3 = $P32 * 100 + $P30 + $P3p / 100;

                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_price($msgAddr, $msgType, $P1, $V1, $P2, $V2, $P3);
                }
                else $resp = "";
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_BILL_DATE:
                if (($msgLen == 0x04) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A2BillDate";
                    $temp = unpack($format, $msgBody);
                    //当前结算日
                    $BillDate = hexdec(dechex($temp['BillDate'])) & 0xFF;
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_bill_date($msgAddr, $msgType, $BillDate);
                }
                else $resp = "";
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_ACCOUNT_DATE:
                if (($msgLen == 0x04) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A2ReadDate";
                    $temp = unpack($format, $msgBody);
                    //当前抄表日
                    $ReadDate = hexdec(dechex($temp['ReadDate'])) & 0xFF;
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_read_date($msgAddr, $msgType, $ReadDate);
                }
                else $resp = "";
                break;
            case MFUN_NBIOT_CJ188_READ_DI0DI1_BUY_AMOUNT:
                if (($msgLen == 0x12) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A2BC/A2TAp/A2TA0/A2TA2/A2TA4/A2AAp/A2AA0/A2AA2/A2AA4/A2RAp/A2RA0/A2RA2/A2RA4/A4ST";
                    $temp = unpack($format, $msgBody);
                    //购买序号
                    $BC = hexdec($temp['BC']) & 0xFF;
                    //本次金额
                    $TAp = hexdec(dechex($temp['TAp'])) & 0xFF;
                    $TA0 = hexdec(dechex($temp['TA0'])) & 0xFF;
                    $TA2 = hexdec(dechex($temp['TA2'])) & 0xFF;
                    $TA4 = hexdec(dechex($temp['TA4'])) & 0xFF;
                    $TA = $TA4 * 10000 + $TA2 * 100 + $TA0 + $TAp / 100;
                    //累计金额
                    $AAp = hexdec(dechex($temp['AAp'])) & 0xFF;
                    $AA0 = hexdec(dechex($temp['AA0'])) & 0xFF;
                    $AA2 = hexdec(dechex($temp['AA2'])) & 0xFF;
                    $AA4 = hexdec(dechex($temp['AA4'])) & 0xFF;
                    $AA = $AA4 * 10000 + $AA2 * 100 + $AA0 + $AAp / 100;
                    //剩余金额
                    $RAp = hexdec(dechex($temp['RAp'])) & 0xFF;
                    $RA0 = hexdec(dechex($temp['RA0'])) & 0xFF;
                    $RA2 = hexdec(dechex($temp['RA2'])) & 0xFF;
                    $RA4 = hexdec(dechex($temp['RA4'])) & 0xFF;
                    $RA = $RA4 * 10000 + $RA2 * 100 + $RA0 + $RAp / 100;
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_buy_amount($msgAddr, $msgType, $BC, $TA, $AA, $RA);
                }
                else $resp = "";
                break;
            default:
                $resp = "";
                break;
        }

        return $resp;
    }

    function func_ihm_cj188_history_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus, $cj188Obj, $months)
    {
        if (($msgLen = 0x08) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
        {
            $format = "A2DI0/A2DI1/A2Ser/A2CuAVp/A2CuAV0/A2CuAV2/A2CuAVu";
            $temp = unpack($format, $msgBody);
            //当前累计流量
            $CuAVp = hexdec(dechex($temp['CuAVp'])) & 0xFF;
            $CuAV0 = hexdec(dechex($temp['CuAV0'])) & 0xFF;
            $CuAV2 = hexdec(dechex($temp['CuAV2'])) & 0xFF;
            $CuAVu = $temp['CuAVu'];
            $CuAV = $CuAV2 * 100 + $CuAV0 + $CuAVp / 100;
            $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_last_month($msgAddr, $msgType, $CuAV, $CuAVu, $months);
        }
        else $resp = "";
        return $resp;
    }

    function func_ihm_cj188_ul_read_key_ver_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus)
    {
        $cj188Obj = new classDbiL2snrIhm(); //初始化一个UI DB对象
        $format = "A2DI0/A2DI1/A2Ser";
        $temp = unpack($format, $msgBody);
        $DI0 = (hexdec($temp['DI0'])) & 0xFF;
        $DI1 = (hexdec($temp['DI1'])) & 0xFF;
        $DI0DI1 = ($DI0 << 8) + $DI1;

        //正式处理不同的DI0/DI1
        $resp = "";
        switch($DI0DI1){
            case MFUN_NBIOT_CJ188_READ_DI0DI1_KEY_VER:
                if (($msgLen == 0x04) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A2KeyVer";
                    $temp = unpack($format, $msgBody);
                    //当前版本
                    $KeyVer = hexdec($temp['KeyVer']) & 0xFF;
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_key_ver($msgAddr, $msgType, $KeyVer);
                }
                else $resp = "";
                break;
            default:
                $resp = "";
                break;
        }

        return $resp;
    }

    function func_ihm_cj188_ul_read_address_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus)
    {
        $cj188Obj = new classDbiL2snrIhm(); //初始化一个UI DB对象
        $format = "A2DI0/A2DI1/A2Ser";
        $temp = unpack($format, $msgBody);
        $DI0 = (hexdec($temp['DI0'])) & 0xFF;
        $DI1 = (hexdec($temp['DI1'])) & 0xFF;
        $DI0DI1 = ($DI0 << 8) + $DI1;

        //正式处理不同的DI0/DI1
        $resp = "";
        switch($DI0DI1){
            case MFUN_NBIOT_CJ188_READ_DI0DI1_ADDRESS:
                if (($msgLen == 0x03) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_address($msgAddr, $msgType);
                }
                else $resp = "";
                break;
            default:
                $resp = "";
                break;
        }

        return $resp;
    }

    function func_ihm_cj188_ul_write_data_confirm_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus)
    {
        $cj188Obj = new classDbiL2snrIhm(); //初始化一个UI DB对象
        $format = "A2DI0/A2DI1/A2Ser";
        $temp = unpack($format, $msgBody);
        $DI0 = (hexdec($temp['DI0'])) & 0xFF;
        $DI1 = (hexdec($temp['DI1'])) & 0xFF;
        $DI0DI1 = ($DI0 << 8)  + $DI1;

        //正式处理不同的DI0/DI1
        $resp = "";
        switch($DI0DI1){
            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_PRICE_TABLE:
                if (($msgLen == 0x5) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A4ST";
                    $temp = unpack($format, $msgBody);
                    //当前状态
                    $st = $temp['ST'];
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_write_st($msgAddr, $msgType, $st);
                }
                else{
                    $resp = "";
                }
                break;

            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_BILL_DATE:
                if (($msgLen == 0x3) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser";
                    $temp = unpack($format, $msgBody);
                    $resp = "";  // Do nothing
                }
                else{
                    $resp = "";
                }
                break;

            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_ACCOUNT_DATE:
                if (($msgLen == 0x3) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser";
                    $temp = unpack($format, $msgBody);
                    $resp = "";  // Do nothing
                }
                else{
                    $resp = "";
                }
                break;

            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_BUY_AMOUNT:
                if (($msgLen == 0x8) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A2BC/A2AAp/A2AA0/A2AA2/A2AA4";
                    $temp = unpack($format, $msgBody);
                    //购买金额
                    $bc = hexdec($temp['BC']);
                    $AAp = hexdec(dechex($temp['AAp'])) & 0xFF;
                    $AA0 = hexdec(dechex($temp['AA0'])) & 0xFF;
                    $AA2 = hexdec(dechex($temp['AA2'])) & 0xFF;
                    $AA4 = hexdec(dechex($temp['AA4'])) & 0xFF;
                    $AA = $AA4 * 10000 + $AA2 * 100 + $AA0 + $AAp / 100;
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_write_buy_amount($msgAddr, $msgType, $bc, $AA);
                }
                else{
                    $resp = "";
                }
                break;

            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_NEW_KEY:
                if (($msgLen == 0x4) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A2Keyver";
                    $temp = unpack($format, $msgBody);
                    //购买金额
                    $keyver = hexdec($temp['Keyver']);
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_key_ver($msgAddr, $msgType, $keyver);
                }
                else{
                    $resp = "";
                }
                break;

            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_STD_TIME:
                if (($msgLen == 0x3) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser";
                    $temp = unpack($format, $msgBody);
                    //Do nothing
                }
                else{
                    $resp = "";
                }
                break;

            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_SWITCH_CTRL:
                if (($msgLen == 0x5) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A4ST";
                    $temp = unpack($format, $msgBody);
                    //当前状态
                    $st = $temp['ST'];
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_write_st($msgAddr, $msgType, $st);
                }
                else{
                    $resp = "";
                }
                break;

            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_OFF_FACTORY_START:
                if (($msgLen == 0x3) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser";
                    $temp = unpack($format, $msgBody);
                    //Do nothing
                }
                else{
                    $resp = "";
                }
                break;

            default:
                $resp = "";
                break;
        }

        return $resp;
    }

    function func_ihm_cj188_ul_write_addr_confirm_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus)
    {
        $cj188Obj = new classDbiL2snrIhm(); //初始化一个UI DB对象
        $format = "A2DI0/A2DI1/A2Ser";
        $temp = unpack($format, $msgBody);
        $DI0 = (hexdec($temp['DI0'])) & 0xFF;
        $DI1 = (hexdec($temp['DI1'])) & 0xFF;
        $DI0DI1 = ($DI0 << 8) + $DI1;

        //正式处理不同的DI0/DI1
        $resp = "";
        switch($DI0DI1){
            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_ADDRESS:
                if (($msgLen == 0x03) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser";
                    $temp = unpack($format, $msgBody);
                    //Do nothing
                }
                else $resp = "";
                break;
            default:
                $resp = "";
                break;
        }

        return $resp;
    }

    function func_ihm_cj188_ul_write_device_syn_confirm_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus)
    {
        $cj188Obj = new classDbiL2snrIhm(); //初始化一个UI DB对象
        $format = "A2DI0/A2DI1/A2Ser";
        $temp = unpack($format, $msgBody);
        $DI0 = (hexdec($temp['DI0'])) & 0xFF;
        $DI1 = (hexdec($temp['DI1'])) & 0xFF;
        $DI0DI1 = ($DI0 << 8) + $DI1;

        //正式处理不同的DI0/DI1
        $resp = "";
        switch($DI0DI1){
            case MFUN_NBIOT_CJ188_WRITE_DI0DI1_DEVICE_SYN_DATA:
                if (($msgLen == 0x05) && (($msgType == MFUN_NBIOT_CJ188_T_TYPE_HEAT_ENERGY_METER) || ($msgType == MFUN_NBIOT_CJ188_T_TYPE_COLD_ENERGY_METER)))
                {
                    $format = "A2DI0/A2DI1/A2Ser/A4ST";
                    $temp = unpack($format, $msgBody);
                    //当前状态
                    $st = $temp['ST'];
                    $resp = $cj188Obj->dbi_ihm_std_cj188_data_save_write_st($msgAddr, $msgType, $st);
                }
                else $resp = "";
                break;
            default:
                $resp = "";
                break;
        }

        return $resp;
    }


    /**************************************************************************************
     *                             任务入口函数                                           *
     *************************************************************************************/
    public function mfun_l2snr_ihm_task_main_entry($parObj, $msgId, $msgName, $msg)
    {
        //定义本入口函数的logger处理对象及函数
        $loggerObj = new classApiL1vmFuncCom();
        $log_time = date("Y-m-d H:i:s", time());
        $project = "";

        //入口消息内容判断
        if (empty($msg) == true) {
            $result = "Received null message body";
            $log_content = "R:" . json_encode($result);
            $loggerObj->logger("MFUN_TASK_ID_L2SNR_IHM", "mfun_l2snr_ihm_task_main_entry", $log_time, $log_content);
            echo trim($result);
            return false;
        }
        //多条消息发送到L2SNR_IHM，这里潜在的消息太多，没法一个一个的判断，故而只检查上下界
        if (($msgId <= MSG_ID_MFUN_MIN) || ($msgId >= MSG_ID_MFUN_MAX)){
            $result = "Msgid or MsgName error";
            $log_content = "P:" . json_encode($result);
            $loggerObj->logger("MFUN_TASK_ID_L2SNR_IHM", "mfun_l2snr_ihm_task_main_entry", $log_time, $log_content);
            echo trim($result);
            return false;
        }

        //CJ188规范中上报READ DATA
        if ($msgId == MSG_ID_L2SDK_NBIOT_STD_CJ188_TO_L2SNR_IHM_READ_DATA)
        {
            //解开消息
            if (isset($msg["msgAddr"])) $msgAddr = $msg["msgAddr"]; else  $msgAddr = "";
            if (isset($msg["msgType"])) $msgType = $msg["msgType"]; else  $msgType = "";
            if (isset($msg["msgBody"])) $msgBody = $msg["msgBody"]; else  $msgBody = "";
            if (isset($msg["msgLen"])) $msgLen = $msg["msgLen"]; else  $msgLen = "";
            if (isset($msg["msgCtrlDir"])) $msgCtrlDir = $msg["msgCtrlDir"]; else  $msgCtrlDir = "";
            if (isset($msg["msgCtrlStatus"])) $msgCtrlStatus = $msg["msgCtrlStatus"]; else  $msgCtrlStatus = "";

            //具体处理函数
            $resp = $this->func_ihm_cj188_ul_read_data_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus);
            $project = MFUN_PRJ_NB_IOT_IHM188;
        }

        //CJ188规范中上报READ KEY VER
        elseif ($msgId == MSG_ID_L2SDK_NBIOT_STD_CJ188_TO_L2SNR_IHM_READ_KEY_VER)
        {
            //解开消息
            if (isset($msg["msgAddr"])) $msgAddr = $msg["msgAddr"]; else  $msgAddr = "";
            if (isset($msg["msgType"])) $msgType = $msg["msgType"]; else  $msgType = "";
            if (isset($msg["msgBody"])) $msgBody = $msg["msgBody"]; else  $msgBody = "";
            if (isset($msg["msgLen"])) $msgLen = $msg["msgLen"]; else  $msgLen = "";
            if (isset($msg["msgCtrlDir"])) $msgCtrlDir = $msg["msgCtrlDir"]; else  $msgCtrlDir = "";
            if (isset($msg["msgCtrlStatus"])) $msgCtrlStatus = $msg["msgCtrlStatus"]; else  $msgCtrlStatus = "";
            //具体处理函数
            $resp = $this->func_ihm_cj188_ul_read_key_ver_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus);
            $project = MFUN_PRJ_NB_IOT_IHM188;
        }

        //CJ188规范中上报READ ADDRESS
        elseif ($msgId == MSG_ID_L2SDK_NBIOT_STD_CJ188_TO_L2SNR_IHM_READ_ADDR)
        {
            //解开消息
            if (isset($msg["msgAddr"])) $msgAddr = $msg["msgAddr"]; else  $msgAddr = "";
            if (isset($msg["msgType"])) $msgType = $msg["msgType"]; else  $msgType = "";
            if (isset($msg["msgBody"])) $msgBody = $msg["msgBody"]; else  $msgBody = "";
            if (isset($msg["msgLen"])) $msgLen = $msg["msgLen"]; else  $msgLen = "";
            if (isset($msg["msgCtrlDir"])) $msgCtrlDir = $msg["msgCtrlDir"]; else  $msgCtrlDir = "";
            if (isset($msg["msgCtrlStatus"])) $msgCtrlStatus = $msg["msgCtrlStatus"]; else  $msgCtrlStatus = "";
            //具体处理函数
            $resp = $this->func_ihm_cj188_ul_read_address_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus);
            $project = MFUN_PRJ_NB_IOT_IHM188;
        }

        //CJ188规范中WRITE DATA的证实过程
        elseif ($msgId == MSG_ID_L2SDK_NBIOT_STD_CJ188_TO_L2SNR_IHM_WRITE_DATA)
        {
            //解开消息
            if (isset($msg["msgAddr"])) $msgAddr = $msg["msgAddr"]; else  $msgAddr = "";
            if (isset($msg["msgType"])) $msgType = $msg["msgType"]; else  $msgType = "";
            if (isset($msg["msgBody"])) $msgBody = $msg["msgBody"]; else  $msgBody = "";
            if (isset($msg["msgLen"])) $msgLen = $msg["msgLen"]; else  $msgLen = "";
            if (isset($msg["msgCtrlDir"])) $msgCtrlDir = $msg["msgCtrlDir"]; else  $msgCtrlDir = "";
            if (isset($msg["msgCtrlStatus"])) $msgCtrlStatus = $msg["msgCtrlStatus"]; else  $msgCtrlStatus = "";
            //具体处理函数
            $resp = $this->func_ihm_cj188_ul_write_data_confirm_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus);
            $project = MFUN_PRJ_NB_IOT_IHM188;
        }

        //CJ188规范中WRITE ADDR的证实过程
        elseif ($msgId == MSG_ID_L2SDK_NBIOT_STD_CJ188_TO_L2SNR_IHM_WRITE_ADDR)
        {
            //解开消息
            if (isset($msg["msgAddr"])) $msgAddr = $msg["msgAddr"]; else  $msgAddr = "";
            if (isset($msg["msgType"])) $msgType = $msg["msgType"]; else  $msgType = "";
            if (isset($msg["msgBody"])) $msgBody = $msg["msgBody"]; else  $msgBody = "";
            if (isset($msg["msgLen"])) $msgLen = $msg["msgLen"]; else  $msgLen = "";
            if (isset($msg["msgCtrlDir"])) $msgCtrlDir = $msg["msgCtrlDir"]; else  $msgCtrlDir = "";
            if (isset($msg["msgCtrlStatus"])) $msgCtrlStatus = $msg["msgCtrlStatus"]; else  $msgCtrlStatus = "";
            //具体处理函数
            $resp = $this->func_ihm_cj188_ul_write_addr_confirm_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus);
            $project = MFUN_PRJ_NB_IOT_IHM188;
        }

        //CJ188规范中WRITE DEVICE SYN的证实过程
        elseif ($msgId == MSG_ID_L2SDK_NBIOT_STD_CJ188_TO_L2SNR_IHM_WRITE_DEVICE_SYN)
        {
            //解开消息
            if (isset($msg["msgAddr"])) $msgAddr = $msg["msgAddr"]; else  $msgAddr = "";
            if (isset($msg["msgType"])) $msgType = $msg["msgType"]; else  $msgType = "";
            if (isset($msg["msgBody"])) $msgBody = $msg["msgBody"]; else  $msgBody = "";
            if (isset($msg["msgLen"])) $msgLen = $msg["msgLen"]; else  $msgLen = "";
            if (isset($msg["msgCtrlDir"])) $msgCtrlDir = $msg["msgCtrlDir"]; else  $msgCtrlDir = "";
            if (isset($msg["msgCtrlStatus"])) $msgCtrlStatus = $msg["msgCtrlStatus"]; else  $msgCtrlStatus = "";
            //具体处理函数
            $resp = $this->func_ihm_cj188_ul_write_device_syn_confirm_process($parObj, $msgAddr, $msgType, $msgBody, $msgLen, $msgCtrlDir, $msgCtrlStatus);
            $project = MFUN_PRJ_NB_IOT_IHM188;
        }

        else{
            $resp = ""; //啥都不ECHO
        }

        //返回ECHO
        if (!empty($resp))
        {
            $log_content = "T:" . json_encode($resp);
            $loggerObj->logger($project, "MFUN_TASK_ID_L2SNR_IHM", $log_time, $log_content);
            echo trim($resp);
        }

        //返回
        return true;
    }

}

?>