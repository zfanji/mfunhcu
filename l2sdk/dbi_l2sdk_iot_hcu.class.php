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
-- 表的结构 `t_l2sdk_iothcu_inventory`
--

CREATE TABLE IF NOT EXISTS `t_l2sdk_iothcu_inventory` (
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
-- 转存表中的数据 `t_l2sdk_iothcu_inventory`
--

INSERT INTO `t_l2sdk_iothcu_inventory` (`devcode`, `statcode`, `macaddr`, `ipaddr`, `switch`, `videourl`, `sensorlist`) VALUES
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

    //验证设备的合法性，输入的设备编号是否在HCU设备信息表（t_l2sdk_iothcu_inventory）中有记录
    public function dbi_hcuDevice_valid_device($devcode)
    {
        $mysqli=new mysqli(MFUN_CLOUD_DBHOST, MFUN_CLOUD_DBUSER, MFUN_CLOUD_DBPSW, MFUN_CLOUD_DBNAME_L1L2L3, MFUN_CLOUD_DBPORT);
        if (!$mysqli)
        {
            die('Could not connect: ' . mysqli_error($mysqli));
        }

        $result = $mysqli->query("SELECT `statcode` FROM `t_l2sdk_iothcu_inventory` WHERE (`devcode` = '$devcode')");

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
    public function dbi_hcuDevice_valid_mac($devcode, $mac)
    {
        //建立连接
        $mysqli=new mysqli(MFUN_CLOUD_DBHOST, MFUN_CLOUD_DBUSER, MFUN_CLOUD_DBPSW, MFUN_CLOUD_DBNAME_L1L2L3, MFUN_CLOUD_DBPORT);
        if (!$mysqli)
        {
            die('Could not connect: ' . mysqli_error($mysqli));
        }
        $result = $mysqli->query("SELECT * FROM `t_l2sdk_iothcu_inventory` WHERE (`devcode` = '$devcode'AND `macaddr` = '$mac') ");
        if ($result->num_rows>0)
            $result = true;
        else
            $result = false;

        $mysqli->close();
        return $result;
    }

    public function dbi_hcuDevice_update_status($devcode, $statcode, $status)
    {
        //建立连接
        $mysqli=new mysqli(MFUN_CLOUD_DBHOST, MFUN_CLOUD_DBUSER, MFUN_CLOUD_DBPSW, MFUN_CLOUD_DBNAME_L1L2L3, MFUN_CLOUD_DBPORT);
        if (!$mysqli)
        {
            die('Could not connect: ' . mysqli_error($mysqli));
        }

        //因为devcode和statcode已经检查存在,所以直接更新状态
        $result = $mysqli->query("UPDATE `t_l2sdk_iothcu_inventory` SET `status` = '$status' WHERE `devcode` = '$devcode' AND `statcode` = '$statcode'");

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
        $result = $mysqli->query("SELECT `devcode` FROM `t_l2sdk_iothcu_inventory` WHERE 1");

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

}

?>