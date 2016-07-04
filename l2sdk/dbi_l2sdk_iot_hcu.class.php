<?php
/**
 * Created by PhpStorm.
 * User: jianlinz
 * Date: 2016/7/1
 * Time: 13:45
 */
//include_once "../../l1comvm/vmlayer.php";

/*

-- --------------------------------------------------------

--
-- 表的结构 `t_l2sdk_iothcu_hcudevice`
--

CREATE TABLE IF NOT EXISTS `t_l2sdk_iothcu_hcudevice` (
  `devcode` char(20) NOT NULL,
  `statcode` char(20) DEFAULT NULL,
  `macaddr` char(20) DEFAULT NULL,
  `ipaddr` char(15) DEFAULT NULL,
  `switch` char(3) NOT NULL DEFAULT '0',
  `videourl` text,
  `sensorlist` char(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`devcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l2sdk_iothcu_hcudevice`
--

INSERT INTO `t_l2sdk_iothcu_hcudevice` (`devcode`, `statcode`, `macaddr`, `ipaddr`, `switch`, `videourl`, `sensorlist`) VALUES
('HCU_SH_0301', '120101001', '', '', 'on', '', 'S_0001;S_0002;S_0003;S_0005;S_0006;S_0007;S_000A;'),
('HCU_SH_0302', '120101015', '', '', 'off', 'http://192.168.31.232:8000/avorion/avorion201606061346.h264', 'S_0001;S_0002;S_0003;S_0005;S_0006;S_0007;S_000A;'),
('HCU_SH_0305', '120101005', '', '', 'off', '', 'S_0002;S_0003;S_0005;S_0006;S_0007;'),
('HCU_SH_0304', '120101004', '', '', 'off', '', 'S_0005;'),
('HCU_SH_0303', '120101003', '', '', 'on', 'http://192.168.1.232:8000/avorion/avorion201606041614.h264', 'S_0001;S_0005;'),
('HCU_SH_0309', '120101009', '', '', 'off', '', 'S_0005;S_006;');

 */

class classDbiL2sdkHcu
{
    //构造函数
    public function __construct()
    {

    }

    //验证设备的合法性，输入的设备编号是否在HCU设备信息表（t_l2sdk_iothcu_hcudevice）中有记录
    public function dbi_hcuDevice_valid_device($devcode)
    {
        $mysqli=new mysqli(MFUN_CLOUD_DBHOST, MFUN_CLOUD_DBUSER, MFUN_CLOUD_DBPSW, MFUN_CLOUD_DBNAME_L1L2L3, MFUN_CLOUD_DBPORT);
        if (!$mysqli)
        {
            die('Could not connect: ' . mysqli_error($mysqli));
        }

        $result = $mysqli->query("SELECT `statcode` FROM `t_l2sdk_iothcu_hcudevice` WHERE (`devcode` = '$devcode')");

        if ($result->num_rows>0){
            $row = $result->fetch_array();
            $result = $row['statcode'];
        }
        else
            $result = "";

        $mysqli->close();
        return $result;
    }

    //验证HCU设备信息表中设备编号对应的MAC地址的合法性
    public function dbi_hcuDevice_valid_mac($deviceid, $mac)
    {
        //建立连接
        $mysqli=new mysqli(MFUN_CLOUD_DBHOST, MFUN_CLOUD_DBUSER, MFUN_CLOUD_DBPSW, MFUN_CLOUD_DBNAME_L1L2L3, MFUN_CLOUD_DBPORT);
        if (!$mysqli)
        {
            die('Could not connect: ' . mysqli_error($mysqli));
        }
        $result = $mysqli->query("SELECT * FROM `t_l2sdk_iothcu_hcudevice` WHERE (`devcode` = '$deviceid'AND `macaddr` = '$mac') ");
        if ($result->num_rows>0)
            $result = true;
        else
            $result = false;

        $mysqli->close();
        return $result;
    }

    public function dbi_hcuDevice_update_status($deviceid, $statcode, $status)
    {
        //建立连接
        $mysqli=new mysqli(MFUN_CLOUD_DBHOST, MFUN_CLOUD_DBUSER, MFUN_CLOUD_DBPSW, MFUN_CLOUD_DBNAME_L1L2L3, MFUN_CLOUD_DBPORT);
        if (!$mysqli)
        {
            die('Could not connect: ' . mysqli_error($mysqli));
        }

        //因为devcode和statcode已经检查存在,所以直接更新状态
        $result = $mysqli->query("UPDATE `t_l2sdk_iothcu_hcudevice` SET `status` = '$status' WHERE `devcode` = '$deviceid' AND `statcode` = '$statcode'");

        $mysqli->close();
        return $result;
    }

    //查询所有HCU list
    public function dbi_hcuDevice_inquiry_device()
    {
        //建立连接
        $mysqli=new mysqli(MFUN_CLOUD_DBHOST, MFUN_CLOUD_DBUSER, MFUN_CLOUD_DBPSW, MFUN_CLOUD_DBNAME_L1L2L3, MFUN_CLOUD_DBPORT);
        if (!$mysqli)
        {
            die('Could not connect: ' . mysqli_error($mysqli));
        }
        $result = $mysqli->query("SELECT `devcode` FROM `t_l2sdk_iothcu_hcudevice` WHERE 1");

        $i=0;
        while($row = $result->fetch_array())
        {
            $resp[$i]["devcode"] = $row['devcode'];
            $i++;
        }
        if ($i == 0) $resp = false;

        $mysqli->close();
        return $resp;
    }

    //查询HCU设备表中记录总数
    public function dbi_all_hcunum_inqury()
    {
        //建立连接
        $mysqli = new mysqli(MFUN_CLOUD_DBHOST, MFUN_CLOUD_DBUSER, MFUN_CLOUD_DBPSW, MFUN_CLOUD_DBNAME_L1L2L3, MFUN_CLOUD_DBPORT);
        if (!$mysqli) {
            die('Could not connect: ' . mysqli_error($mysqli));
        }

        $query_str = "SELECT * FROM `t_l2sdk_iothcu_hcudevice` WHERE 1";
        $result = $mysqli->query($query_str);
        $total = $result->num_rows;

        $mysqli->close();
        return $total;
    }

    //UI DevNew & DevMod request,添加HCU设备信息或者修改HCU设备信息
    public function dbi_devinfo_update($devinfo)
    {
        //建立连接
        $mysqli = new mysqli(MFUN_CLOUD_DBHOST, MFUN_CLOUD_DBUSER, MFUN_CLOUD_DBPSW, MFUN_CLOUD_DBNAME_L1L2L3, MFUN_CLOUD_DBPORT);
        if (!$mysqli) {
            die('Could not connect: ' . mysqli_error($mysqli));
        }
        $mysqli->query("set character_set_results = utf8");
        $mysqli->query("SET NAMES utf8");

        $devcode = $devinfo["DevCode"];
        $statcode = $devinfo["StatCode"];
        $starttime = $devinfo["StartTime"];
        $preendtime = $devinfo["PreEndTime"];
        $endtime = $devinfo["EndTime"];
        $devstatue = $devinfo["DevStatus"];
        $videourl = $devinfo["VideoURL"];
        $default_sensor = S_TYPE_EMC.";";

        $query_str = "SELECT * FROM `t_l2sdk_iothcu_hcudevice` WHERE `devcode` = '$devcode'";
        $result = $mysqli->query($query_str);

        if (($result->num_rows)>0) //重复，则覆盖
        {
            $query_str = "UPDATE `t_l2sdk_iothcu_hcudevice` SET `statcode` = '$statcode',`switch` = '$devstatue',`videourl` = '$videourl' WHERE (`devcode` = '$devcode' )";
            $result = $mysqli->query($query_str);
        }
        else //不存在，新增
        {
            $query_str = "INSERT INTO `t_l2sdk_iothcu_hcudevice` (devcode,statcode,switch,videourl,sensorlist) VALUES ('$devcode','$statcode','$devstatue','$videourl','$default_sensor')";
            $result = $mysqli->query($query_str);
        }

        $mysqli->close();
        return $result;
    }

}

?>