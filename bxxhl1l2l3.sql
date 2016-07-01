-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-07-01 16:44:06
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bxxhl1l2l3`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_l1vm_cmdbuf`
--

CREATE TABLE IF NOT EXISTS `t_l1vm_cmdbuf` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `cmd` char(50) NOT NULL,
  `cmdtime` datetime NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=552 ;

-- --------------------------------------------------------

--
-- 表的结构 `t_l1vm_deviceversion`
--

CREATE TABLE IF NOT EXISTS `t_l1vm_deviceversion` (
  `deviceid` char(50) NOT NULL,
  `hw_type` int(1) DEFAULT NULL,
  `hw_ver` int(2) DEFAULT NULL,
  `sw_rel` int(1) DEFAULT NULL,
  `sw_drop` int(2) DEFAULT NULL,
  PRIMARY KEY (`deviceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l1vm_deviceversion`
--

INSERT INTO `t_l1vm_deviceversion` (`deviceid`, `hw_type`, `hw_ver`, `sw_rel`, `sw_drop`) VALUES
('HCU_SH_0304', 2, 3, 1, 90),
('HCU_SH_0302', 2, 3, 1, 92);

-- --------------------------------------------------------

--
-- 表的结构 `t_l1vm_loginfo`
--

CREATE TABLE IF NOT EXISTS `t_l1vm_loginfo` (
  `sid` int(6) NOT NULL AUTO_INCREMENT,
  `project` char(5) NOT NULL,
  `fromuser` char(50) NOT NULL,
  `createtime` char(20) NOT NULL,
  `logdata` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=581216 ;

--
-- 转存表中的数据 `t_l1vm_loginfo`
--

INSERT INTO `t_l1vm_loginfo` (`sid`, `project`, `fromuser`, `createtime`, `logdata`) VALUES
(581026, 'HCU', 'HCU_SH_0302', '2016-04-07 22:25:52', 'R:<xml><ToUserName><![CDATA[SAE_MFUNHCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0302]]></FromUserName><CreateTime>1460039152</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[201881050201124945000000004E000000000000000057066DF0]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581171, 'HCU', 'HCU_SH_0305', '2016-05-12 23:23:06', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0305]]></FromUserName><CreateTime>1463066586</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[201881050201130345000000004E000000000000000057318D70]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581172, 'HCU', 'ZHBMSG', '2016-06-30 15:02:51', 'R:##007020160619033803000___11111ZHB_NOMHCU_SH_0304_44444405556666a01000=139A,68BE'),
(581173, 'HCU', 'AQ_HCU', '2016-06-30 15:02:51', 'T:'),
(581174, 'HCU', 'HCU_SH_0302', '2016-04-07 22:25:52', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0302]]></FromUserName><CreateTime>1460039152</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[201881050201124945000000004E000000000000000057066DF0]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581175, 'HCU', 'HCU_SH_0301', '2016-03-13 20:33:24', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872404</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[252281010201000001120000011200000492000000000000000000000000000056E55E14]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581176, 'HCU', 'HCU_SH_0301', '2016-04-07 07:36:48', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1459985808</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[261881020201000045000000004E000000000000000057059D90]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581177, 'HCU', 'HCU_SH_0301', '2016-04-06 07:32:06', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1459899126</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[271881030201008D45000000004E000000000000000057044AF5]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581178, 'HCU', 'HCU_SH_0301', '2016-03-13 20:33:42', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872422</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[2818810602010223000000000000000000000000000056E55E26]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581179, 'HCU', 'HCU_SH_0301', '2016-03-13 20:35:25', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872525</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[29188106020100AC000000000000000000000000000056E55E8D]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581180, 'HCU', 'HCU_SH_0301', '2016-03-13 20:38:51', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872731</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[2B1A810A02020000028B000000000000000000000000000056E55F5B]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581181, 'HCU', 'HCU_SH_0301', '2016-03-13 20:33:29', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872409</CreateTime><MsgType><![CDATA[hcu_heart_beat]]></MsgType><Content><![CDATA[FE00]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581182, 'HCU', 'AQ_HCU', '2016-07-01 22:04:06', 'T:"FE00"'),
(581183, 'HCU', 'HCU_SH_0301', '2016-03-13 20:35:59', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872559</CreateTime><MsgType><![CDATA[hcu_command]]></MsgType><Content><![CDATA[FD00]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581184, 'HCU', 'AQ_HCU', '2016-07-01 22:04:06', 'T:"FD00"'),
(581185, 'HCU', 'HCU_SH_0305', '2016-05-12 23:23:06', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0305]]></FromUserName><CreateTime>1463066586</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[201881050201130345000000004E000000000000000057318D70]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581186, 'HCU', 'ZHBMSG', '2016-07-01 22:04:07', 'R:##007020160619033803000___11111ZHB_NOMHCU_SH_0304_44444405556666a01000=139A,68BE'),
(581187, 'HCU', 'AQ_HCU', '2016-07-01 22:04:07', 'T:'),
(581188, 'HCU', 'HCU_SH_0302', '2016-04-07 22:25:52', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0302]]></FromUserName><CreateTime>1460039152</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[201881050201124945000000004E000000000000000057066DF0]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581189, 'HCU', 'HCU_SH_0301', '2016-03-13 20:33:24', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872404</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[252281010201000001120000011200000492000000000000000000000000000056E55E14]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581190, 'HCU', 'HCU_SH_0301', '2016-04-07 07:36:48', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1459985808</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[261881020201000045000000004E000000000000000057059D90]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581191, 'HCU', 'HCU_SH_0301', '2016-04-06 07:32:06', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1459899126</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[271881030201008D45000000004E000000000000000057044AF5]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581192, 'HCU', 'HCU_SH_0301', '2016-03-13 20:33:42', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872422</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[2818810602010223000000000000000000000000000056E55E26]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581193, 'HCU', 'HCU_SH_0301', '2016-03-13 20:35:25', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872525</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[29188106020100AC000000000000000000000000000056E55E8D]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581194, 'HCU', 'HCU_SH_0301', '2016-03-13 20:38:51', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872731</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[2B1A810A02020000028B000000000000000000000000000056E55F5B]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581195, 'HCU', 'HCU_SH_0301', '2016-03-13 20:33:29', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872409</CreateTime><MsgType><![CDATA[hcu_heart_beat]]></MsgType><Content><![CDATA[FE00]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581196, 'HCU', 'AQ_HCU', '2016-07-01 22:36:51', 'T:"FE00"'),
(581197, 'HCU', 'HCU_SH_0301', '2016-03-13 20:35:59', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872559</CreateTime><MsgType><![CDATA[hcu_command]]></MsgType><Content><![CDATA[FD00]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581198, 'HCU', 'AQ_HCU', '2016-07-01 22:36:51', 'T:"FD00"'),
(581199, 'HCU', 'HCU_SH_0305', '2016-05-12 23:23:06', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0305]]></FromUserName><CreateTime>1463066586</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[201881050201130345000000004E000000000000000057318D70]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581200, 'HCU', 'ZHBMSG', '2016-07-01 22:36:51', 'R:##007020160619033803000___11111ZHB_NOMHCU_SH_0304_44444405556666a01000=139A,68BE'),
(581201, 'HCU', 'AQ_HCU', '2016-07-01 22:36:52', 'T:'),
(581202, 'HCU', 'HCU_SH_0302', '2016-04-07 22:25:52', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0302]]></FromUserName><CreateTime>1460039152</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[201881050201124945000000004E000000000000000057066DF0]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581203, 'HCU', 'HCU_SH_0301', '2016-03-13 20:33:24', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872404</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[252281010201000001120000011200000492000000000000000000000000000056E55E14]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581204, 'HCU', 'HCU_SH_0301', '2016-04-07 07:36:48', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1459985808</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[261881020201000045000000004E000000000000000057059D90]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581205, 'HCU', 'HCU_SH_0301', '2016-04-06 07:32:06', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1459899126</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[271881030201008D45000000004E000000000000000057044AF5]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581206, 'HCU', 'HCU_SH_0301', '2016-03-13 20:33:42', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872422</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[2818810602010223000000000000000000000000000056E55E26]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581207, 'HCU', 'HCU_SH_0301', '2016-03-13 20:35:25', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872525</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[29188106020100AC000000000000000000000000000056E55E8D]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581208, 'HCU', 'HCU_SH_0301', '2016-03-13 20:38:51', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872731</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[2B1A810A02020000028B000000000000000000000000000056E55F5B]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581209, 'HCU', 'HCU_SH_0301', '2016-03-13 20:33:29', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872409</CreateTime><MsgType><![CDATA[hcu_heart_beat]]></MsgType><Content><![CDATA[FE00]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581210, 'HCU', 'AQ_HCU', '2016-07-01 22:43:50', 'T:"FE00"'),
(581211, 'HCU', 'HCU_SH_0301', '2016-03-13 20:35:59', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0301]]></FromUserName><CreateTime>1457872559</CreateTime><MsgType><![CDATA[hcu_command]]></MsgType><Content><![CDATA[FD00]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581212, 'HCU', 'AQ_HCU', '2016-07-01 22:43:50', 'T:"FD00"'),
(581213, 'HCU', 'HCU_SH_0305', '2016-05-12 23:23:06', 'R:<xml><ToUserName><![CDATA[AQ_HCU]]></ToUserName><FromUserName><![CDATA[HCU_SH_0305]]></FromUserName><CreateTime>1463066586</CreateTime><MsgType><![CDATA[hcu_text]]></MsgType><Content><![CDATA[201881050201130345000000004E000000000000000057318D70]]></Content><FuncFlag>0</FuncFlag></xml>'),
(581214, 'HCU', 'ZHBMSG', '2016-07-01 22:43:50', 'R:##007020160619033803000___11111ZHB_NOMHCU_SH_0304_44444405556666a01000=139A,68BE'),
(581215, 'HCU', 'AQ_HCU', '2016-07-01 22:43:50', 'T:');

-- --------------------------------------------------------

--
-- 表的结构 `t_l1vm_logswitch`
--

CREATE TABLE IF NOT EXISTS `t_l1vm_logswitch` (
  `user` char(50) NOT NULL,
  `switch` char(1) NOT NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l1vm_logswitch`
--

INSERT INTO `t_l1vm_logswitch` (`user`, `switch`) VALUES
('oS0Chv3Uum1TZqHaCEb06AoBfCvY', '1'),
('oS0Chv-avCH7W4ubqOQAFXojYODY', '1');

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

-- --------------------------------------------------------

--
-- 表的结构 `t_l2sdk_wechat_accesstoken`
--

CREATE TABLE IF NOT EXISTS `t_l2sdk_wechat_accesstoken` (
  `appid` char(20) NOT NULL,
  `appsecret` char(50) NOT NULL,
  `lasttime` int(6) NOT NULL,
  `access_token` text NOT NULL,
  `js_ticket` text NOT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l2sdk_wechat_accesstoken`
--

INSERT INTO `t_l2sdk_wechat_accesstoken` (`appid`, `appsecret`, `lasttime`, `access_token`, `js_ticket`) VALUES
('wx1183be5c8f6a24b4', 'd52a63064ed543c5eecae6c3df35be55', 1463366782, 'Lsj037a0ESUaboFyI2zfs4RreFVPcdzhK6bfl3e88c8hRWudxRmVnxGazA8tl7irqB6amZocY3-HzG9q3Or8QAlkzSmA7IM3GkIDaD4KdgxPje9NqJpEQPqRIMV8KrswHKEgAGADGA', 'kgt8ON7yVITDhtdwci0qebz_ZoAuborwySZXCjkJSWTLLNSUoMqZWGAntmgJ8dWryV6YAK_F6sAkPJCjrFpBiA');

-- --------------------------------------------------------

--
-- 表的结构 `t_l2sdk_wechat_blebound`
--

CREATE TABLE IF NOT EXISTS `t_l2sdk_wechat_blebound` (
  `sid` int(6) NOT NULL AUTO_INCREMENT,
  `fromuser` char(50) NOT NULL,
  `deviceid` char(50) NOT NULL,
  `openid` char(50) NOT NULL,
  `devicetype` char(30) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `t_l2sdk_wechat_blebound`
--

INSERT INTO `t_l2sdk_wechat_blebound` (`sid`, `fromuser`, `deviceid`, `openid`, `devicetype`) VALUES
(6, 'oS0Chv3Uum1TZqHaCEb06AoBfCvY', 'gh_70c714952b02_8cd47e1f6141e49a4e45f4b807cf41fe', 'oS0Chv3Uum1TZqHaCEb06AoBfCvY', 'gh_70c714952b02'),
(7, 'oS0Chv-avCH7W4ubqOQAFXojYODY', 'gh_70c714952b02_8248307502397542f48a3775bcb234d4', 'oS0Chv-avCH7W4ubqOQAFXojYODY', 'gh_70c714952b02');

-- --------------------------------------------------------

--
-- 表的结构 `t_l2sdk_wechat_deviceqrcode`
--

CREATE TABLE IF NOT EXISTS `t_l2sdk_wechat_deviceqrcode` (
  `deviceid` char(50) NOT NULL,
  `qrcode` char(100) NOT NULL,
  `devicetype` char(30) NOT NULL,
  `macaddr` char(20) NOT NULL,
  PRIMARY KEY (`deviceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l2sdk_wechat_deviceqrcode`
--

INSERT INTO `t_l2sdk_wechat_deviceqrcode` (`deviceid`, `qrcode`, `devicetype`, `macaddr`) VALUES
('gh_70c714952b02_8cd47e1f6141e49a4e45f4b807cf41fe', 'http://we.qq.com/d/AQBLQKG-27gIDCKf03DmiwAXh27qptK_scSJJRAn', 'gh_70c714952b02', 'D03972A5EF28'),
('gh_70c714952b02_8248307502397542f48a3775bcb234d4', 'http://we.qq.com/d/AQBLQKG-cFODzg6aCE5C92D1SKGHOirRJtBGwCmd', 'gh_70c714952b02', 'D03972A5EF27');

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_airprsdata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_airprsdata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `airprs` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_airprsdata`
--

INSERT INTO `t_l2snr_airprsdata` (`sid`, `deviceid`, `sensorid`, `airprs`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_alcoholdata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_alcoholdata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `alcohol` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_alcoholdata`
--

INSERT INTO `t_l2snr_alcoholdata` (`sid`, `deviceid`, `sensorid`, `alcohol`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_co1data`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_co1data` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `co1` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_co1data`
--

INSERT INTO `t_l2snr_co1data` (`sid`, `deviceid`, `sensorid`, `co1`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_dataformat`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_dataformat` (
  `deviceid` char(50) NOT NULL,
  `f_airpressure` int(1) DEFAULT NULL,
  `f_emcdata` int(1) DEFAULT NULL,
  `f_humidity` int(1) DEFAULT NULL,
  `f_noise` int(1) DEFAULT NULL,
  `f_pmdata` int(1) DEFAULT NULL,
  `f_rain` int(1) DEFAULT NULL,
  `f_temperature` int(1) DEFAULT NULL,
  `f_winddirection` int(1) DEFAULT NULL,
  `f_windspeed` int(1) DEFAULT NULL,
  PRIMARY KEY (`deviceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l2snr_dataformat`
--

INSERT INTO `t_l2snr_dataformat` (`deviceid`, `f_airpressure`, `f_emcdata`, `f_humidity`, `f_noise`, `f_pmdata`, `f_rain`, `f_temperature`, `f_winddirection`, `f_windspeed`) VALUES
('HCU_SH_0301', 0, 1, 1, 2, 1, 0, 1, 1, 1),
('HCU_SH_0303', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL),
('HCU_SH_0302', NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL),
('HCU_SH_0305', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('HCU_SH_0304', NULL, 1, 1, NULL, NULL, NULL, 1, NULL, NULL),
('HCU_SH_0309', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_emcaccumulation`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_emcaccumulation` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `lastupdatedate` date NOT NULL,
  `avg30days` char(192) NOT NULL,
  `avg3month` char(192) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `t_l2snr_emcaccumulation`
--

INSERT INTO `t_l2snr_emcaccumulation` (`sid`, `deviceid`, `lastupdatedate`, `avg30days`, `avg3month`) VALUES
(1, 'HCU_SH_0301', '2016-04-27', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0'),
(2, 'gh_70c714952b02_8248307502397542f48a3775bcb234d4', '2016-04-23', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0'),
(3, 'HCU_SH_0302', '2016-07-01', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0'),
(4, 'HCU_SH_0303', '2016-06-12', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0'),
(5, 'HCU_SH_0305', '2016-07-01', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0'),
(6, 'HCU_SH_0304', '2016-06-16', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0'),
(7, 'HCU_SH_0309', '2016-06-18', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0', '0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0');

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_emcdata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_emcdata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `emcvalue` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63697 ;

--
-- 转存表中的数据 `t_l2snr_emcdata`
--

INSERT INTO `t_l2snr_emcdata` (`sid`, `deviceid`, `sensorid`, `emcvalue`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(63695, 'HCU_SH_0305', 5, 4867, 'N', '2016-05-10', 927, 0, 'N', 0, 'E', 0),
(63696, 'HCU_SH_0302', 5, 4681, 'N', '2016-04-07', 1345, 0, 'N', 0, 'E', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_hchodata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_hchodata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `hcho` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_hchodata`
--

INSERT INTO `t_l2snr_hchodata` (`sid`, `deviceid`, `sensorid`, `hcho`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_hourreport`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_hourreport` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `devcode` char(20) NOT NULL,
  `statcode` char(20) DEFAULT NULL,
  `reportdate` date NOT NULL,
  `hourindex` int(1) NOT NULL,
  `emcvalue` int(4) DEFAULT NULL,
  `pm01` int(4) DEFAULT NULL,
  `pm25` int(4) DEFAULT NULL,
  `pm10` int(4) DEFAULT NULL,
  `noise` int(4) DEFAULT NULL,
  `windspeed` int(4) DEFAULT NULL,
  `winddirection` int(4) DEFAULT NULL,
  `rain` int(4) DEFAULT NULL,
  `temperature` int(4) DEFAULT NULL,
  `humidity` int(4) DEFAULT NULL,
  `airpressure` int(4) DEFAULT NULL,
  `datastatus` char(10) DEFAULT NULL,
  `validdatanum` int(1) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `t_l2snr_hourreport`
--

INSERT INTO `t_l2snr_hourreport` (`sid`, `devcode`, `statcode`, `reportdate`, `hourindex`, `emcvalue`, `pm01`, `pm25`, `pm10`, `noise`, `windspeed`, `winddirection`, `rain`, `temperature`, `humidity`, `airpressure`, `datastatus`, `validdatanum`) VALUES
(1, '', NULL, '0000-00-00', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '', NULL, '0000-00-00', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '', NULL, '0000-00-00', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '', NULL, '0000-00-00', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '', NULL, '0000-00-00', 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '', NULL, '0000-00-00', 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '', NULL, '0000-00-00', 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '', NULL, '0000-00-00', 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '', NULL, '0000-00-00', 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '', NULL, '0000-00-00', 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '', NULL, '0000-00-00', 0, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '', NULL, '0000-00-00', 0, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '', NULL, '0000-00-00', 0, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '', NULL, '0000-00-00', 0, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '', NULL, '0000-00-00', 0, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '', NULL, '0000-00-00', 0, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '', NULL, '0000-00-00', 0, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '', NULL, '0000-00-00', 0, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '', NULL, '0000-00-00', 0, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '', NULL, '0000-00-00', 0, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '', NULL, '0000-00-00', 0, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_hsmmpdata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_hsmmpdata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `videourl` text NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28070 ;

--
-- 转存表中的数据 `t_l2snr_hsmmpdata`
--

INSERT INTO `t_l2snr_hsmmpdata` (`sid`, `deviceid`, `sensorid`, `videourl`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, '172', 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_humiddata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_humiddata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `humidity` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_humiddata`
--

INSERT INTO `t_l2snr_humiddata` (`sid`, `deviceid`, `sensorid`, `humidity`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_lightstrdata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_lightstrdata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `lightstr` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_lightstrdata`
--

INSERT INTO `t_l2snr_lightstrdata` (`sid`, `deviceid`, `sensorid`, `lightstr`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_minreport`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_minreport` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `devcode` char(20) NOT NULL,
  `statcode` char(20) NOT NULL,
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `emcvalue` int(4) DEFAULT NULL,
  `pm01` int(4) DEFAULT NULL,
  `pm25` int(4) DEFAULT NULL,
  `pm10` int(4) DEFAULT NULL,
  `noise` int(4) DEFAULT NULL,
  `windspeed` int(4) DEFAULT NULL,
  `winddirection` int(4) DEFAULT NULL,
  `rain` int(4) DEFAULT NULL,
  `temperature` int(4) DEFAULT NULL,
  `humidity` int(4) DEFAULT NULL,
  `airpressure` int(4) DEFAULT NULL,
  `pmdataflag` char(10) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55779 ;

--
-- 转存表中的数据 `t_l2snr_minreport`
--

INSERT INTO `t_l2snr_minreport` (`sid`, `devcode`, `statcode`, `reportdate`, `hourminindex`, `emcvalue`, `pm01`, `pm25`, `pm10`, `noise`, `windspeed`, `winddirection`, `rain`, `temperature`, `humidity`, `airpressure`, `pmdataflag`) VALUES
(614, 'HCU_SH_0302', '120101002', '2016-04-21', 1387, 5655, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, 228, NULL, NULL),
(615, 'HCU_SH_0302', '120101002', '2016-04-21', 1388, 4795, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, 228, NULL, NULL),
(616, 'HCU_SH_0302', '120101002', '2016-04-21', 1389, 5247, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 702, 228, NULL, NULL),
(617, 'HCU_SH_0302', '120101002', '2016-04-21', 1390, 4706, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 702, 228, NULL, NULL),
(618, 'HCU_SH_0302', '120101002', '2016-04-21', 1391, 5166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 702, 228, NULL, NULL),
(619, 'HCU_SH_0302', '120101002', '2016-04-21', 1392, 5461, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 702, 228, NULL, NULL),
(620, 'HCU_SH_0302', '120101002', '2016-04-21', 1393, 5593, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, NULL, NULL, NULL),
(621, 'HCU_SH_0302', '120101002', '2016-04-21', 1394, 5328, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, 228, NULL, NULL),
(622, 'HCU_SH_0302', '120101002', '2016-04-21', 1395, 5034, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, 228, NULL, NULL),
(623, 'HCU_SH_0302', '120101002', '2016-04-21', 1396, 5348, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, 228, NULL, NULL),
(624, 'HCU_SH_0302', '120101002', '2016-04-21', 1397, 5623, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, 227, NULL, NULL),
(625, 'HCU_SH_0302', '120101002', '2016-04-21', 1398, 5239, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, 227, NULL, NULL),
(626, 'HCU_SH_0302', '120101002', '2016-04-21', 1399, 5251, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, 227, NULL, NULL),
(627, 'HCU_SH_0302', '120101002', '2016-04-21', 1400, 5201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 700, 227, NULL, NULL),
(628, 'HCU_SH_0302', '120101002', '2016-04-21', 1401, 5542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 699, 227, NULL, NULL),
(629, 'HCU_SH_0302', '120101002', '2016-04-21', 1402, 4939, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 699, 227, NULL, NULL),
(630, 'HCU_SH_0302', '120101002', '2016-04-21', 1403, 5280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 698, 227, NULL, NULL),
(631, 'HCU_SH_0302', '120101002', '2016-04-21', 1404, 5481, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 698, 227, NULL, NULL),
(632, 'HCU_SH_0302', '120101002', '2016-04-21', 1405, 4966, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 698, 227, NULL, NULL),
(633, 'HCU_SH_0302', '120101002', '2016-04-21', 1406, 5447, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 697, 227, NULL, NULL),
(634, 'HCU_SH_0302', '120101002', '2016-04-21', 1407, 5469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 696, 227, NULL, NULL),
(635, 'HCU_SH_0302', '120101002', '2016-04-21', 1408, 4858, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 696, 227, NULL, NULL),
(636, 'HCU_SH_0302', '120101002', '2016-04-21', 1409, 5177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 227, NULL, NULL),
(637, 'HCU_SH_0302', '120101002', '2016-04-21', 1410, 4908, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 696, 227, NULL, NULL),
(55777, 'HCU_SH_0301', '120101001', '2016-03-13', 1233, NULL, 274, 274, 1170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55778, 'HCU_SH_0301', '120101001', '2016-03-13', 1235, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 172, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_noisedata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_noisedata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `noise` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_noisedata`
--

INSERT INTO `t_l2snr_noisedata` (`sid`, `deviceid`, `sensorid`, `noise`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_picturedata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_picturedata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `filedescription` char(50) NOT NULL,
  `filename` char(50) NOT NULL,
  `filesize` char(50) NOT NULL,
  `filetype` char(50) NOT NULL,
  `bindata` mediumblob NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28071 ;

--
-- 转存表中的数据 `t_l2snr_picturedata`
--

INSERT INTO `t_l2snr_picturedata` (`sid`, `deviceid`, `sensorid`, `filedescription`, `filename`, `filesize`, `filetype`, `bindata`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(28070, '1', 1, '', '', '', '', 0x89504e470d0a1a0a0000000d494844520000012c0000012c0806000000797d8e750000200049444154789ced9d7b9414d5b5fffbdd5d55dd3d33f474cffb3d0ccc380c0ace0c6fe4211a35a8096a0079232f1f441490c19f1118445e0e3e0821518906e41a518c624822574c164a6ea24ecce29118846bd480f76244844b546ad7ef0f1b420d73f63e3d55d3f4c0feae75d6a2ad9a5dfbec73ead3a7da7d76390c168bc5ea20729c6b07582c164b560c2c168bd561c4c062b1581d460c2c168bd561c4c062b1581d460c2c168bd561c4c062b1581d460c2c168bd561240dacfbefbfdfd456ac5861fabc6ad5aab3ce39b32d5cb8103d2e63a3b1b1d1b28dc58b179336de79e71d3416478e1c39eb6f962c5962fadcd4d4845e63e9d2a5a41f7bf6ec41fd3874e8d0597fb368d122d3e7f7de7b0fb5f1d1471f9d6563c18205a6cffbf7ef979d26423df9e493e838ad5cb9928cc73ffef10fcb7e50dab56b17395f1e7cf041d44f6aecefbfff7ee3e8d1a3a81f6fbdf516395fa8b94cdd0badcd97b6d868395fda62435652c0bafffefbc1e1701848d31d0e07754e47b101aaaa02168f9123475af6c3e572917ee4e6e6a27ed4d6d692368a8b8b511bddbb77276d545454a036286ddbb60d1445b13c2e3d7af4b0e4878cb2b3b3c9b195193beaf8983163d0be0402818e72bfc8d8a01adc77df7d52639b08b030a7643bde116c4028144283376edc38cb7e78bd5ed20f0a367dfbf6256d50b089430fb5515d5d6d1958e9e9e9683c9c4e27e9477d7d7dbb03aba0a0801cdbf8d8599a6313274e44fba2695a47b95f1858e7d80603ab850d0696796c195809dba01a03cbca646260996d30b0cc63cbc04ad806d5ec05d6f2e5cbf5b863569ca66c9c4c111b24b066cd9a45fa11bf01857ef87c3ed20f0a58575f7d35503628600d1b368cb4611558afbffeba1e8bc5d078b85c2e321ec900565d5d1d158f93f1b1a36e72b42f14b00a0b0b493f88e3327e5031b7d3067a9c57586db7c12bac16367885651e5b5e61256c836a0c2c2b93898165b6c1c0328f2d032b611b54636059994c9aa6b53bb03c1e0f03eb8c2603acbaba3a3879f2a4216abaae0b8fc99e939f9f9f12c05255b5a3dc2fa907ac55ab5691cfa84ea7139c4ea7216af1dc15e1390ec737f94f988d5337b9151bf1df4ad0bea4a7a7eb583cc68c1943d990fd4d0ff5a3b0b010f563debc79683c9c4ea7317efc78eaf738d2c6d4a9532d01ebc08103909d9d6d755c748fc763b85c2e615314458fdb6ab5391c0e5d5114d4461c143a36c7028100da9753b0c1ce79eaa9a7d098a6a5a5912071b95c423f65fc70381ce076bb2df545e6dea77ecf75381cf0d0430fa173fd94ec5a6181d3e96cf7e5ba1d9a3a75ea79f348783ea9b2b2928ca9dbedb6ba4ad3e35f7a421b8aa2c0debd7bcf79dc251e0961c68c19e7dc4f1911b0321ce7e0919081c5c0b2240696590c2c812d999318586631b0ec1703cb2c0696c096cc492b57ae2473643a0ab01a1a1a2ce761dd7df7dd327958e86f325eaf97caa3b9a0803568d02032a61e8f078da9442ed749afd78bda48156015171793f3b4a3002b272787fcbd96575802f10a2b35c52b2cb3788525b025731203cb2c0696fd626099c5c012d892398981651603cb7e31b0cc6260096cc99cb460c102f206743a9d681ec589132760ce9c39c63df7dc73ba3536369a3e2f5cb8503ff3732b4dbffbeebb013be7b7bffd2ddaf1f1e3c7937d511405edcb4d37dd44d900079d6745d9d0c3e1301a8fa6a626d0755dd85f0080279e78c214af65cb96996c3cfae8a3a80d3ba4eb3aac5ebd1af5232b2b8bfccd86aa4325032c89797c72f2e4c9c239367bf66c7dfefcf9e81c5cb870a13e67ce1ce13973e6cc814f3ffd94aa8745feee3379f264749e6edfbedde4c3a2458bceeacbdcb973c9be60c7e7cc99035f7ef925da17897b01eebffffee4e661391c0ed4e9d9b367db91314bfae1f7fb513fc68e1d4bda080402a88d112346903682c1202c59b2c410b5929212cbf1080683b079f366a1af6fbdf5165085e0344d83ad5bb7b62bb0b66ddb06f10444a11f7ebf1fa64d9b86c6ece1871f161e5bb26489f1e8a38fa2c7478d1a053e9fcfea1c932de087ce0faa809fdfef276d4c9a3409b521b18ab7e59e6b6868a08045b5d47b249c3b776e5282a7280aea47921e09c96aa183060d22e34165084722111258c16010b5919191911460515b7342a110ecdcb9b35dfdd8b469136466665a06568aec25241f0925a0c7c01289816516038b8185f9cac012d8923989816516032b3131b01858d4356c05d6b265cb2c278e36363626a5f81e05acb973e75a4e1cfdfef7bf4fdaa080357cf870ea87f993d46f2514b0de79e71dbd53a74ee71c58afbffeba1e8d46cf39b05e7cf1459d7ac944fc4b822ae067d50609ac78d5084b89a3393939940d3b0af891c092f992e0159640bcc24a3eb078859538b0788525b025731203cb2c065662626031b0a86b241d580e079ed6902c6051690d53a64c216d5005fc645223b2b2b2e0d8b16386a80d1830c0723c3232322c032b2d2d0d366fde8cfaaaeb788a8caeebc2bf3d76ec98f1f2cb2f43381c46fd08068324b04e9c3861b27bfcf871f473cbb67efd7aa01e9125e618997c2a334f274c9880f655a2801f09acf8a3eb85072c99027ed4cb47e3c9a7980deab8cc39100e87513fa64f9f9e94027e6eb71b7c3e9f216aaaaa82dbedd6bd5eafd15a73bbdde40acbe974c22bafbc22f4f5d0a14350525202a26b78bd5e435555f0783c423fbd5e2f504500274d9a045eaf5768c3e3f180aaaac2be7abd5ea3b8b8d8f8c73ffe21bcce9e3d7b202b2bcb64b7acacccf45951141deb8bc7e3014551503fdc6e37393fb071f37abd463018048fc7238cbbc7e3319e79e61934a63205fceeb8e30e749e525f5692f71ce9c7830f3e88fa21f312dd942be077813d12927d8946a3b071e346e17576edda45265b528f8432b2a34472fcedd1a88d4b2eb9c4929f5bb66c2157471299eed0bf7f7fd40f899aee3064c89076df12c38f84025b322731b0cc626099c5c0b25f0c2c812d999318586631b0cc6260d92f0696c096cc497614f05bb264894c1e16f54c4d16bda380357ffe7ccb7958b367cfb65cc08f02d69e3d7bf4482482dab00358575f7d35190f0a58575c710569c32ab07ef5ab5fe9d9d9d9560bf891c0ead3a70f692319c02a2d2db55cc0afa8a8c88e7b8ef48302566e6e6ec72be0c72bacc480c52b2cb378859538b02ed8151603cb2c0696590c2cfbc5c012d892398981651603cb2c0696fd6260096cc99cb468d122b2636eb71bcda3b8e79e7bec78b92859382f1008a07e4c983081b4a1aa2a6a63e2c489e420527d0d0683f0fcf3cf0b0769efdebd642dab6030085bb66c11da3879f2243cf6d863f0fdef7fdf38d51a1b1b8d333fc762316a0fa79e9999a99ff9372d5b2412a16c40d7ae5da5f26c447ae595576432ccc9bd7103070e446f8cf8ef64683c0a0b0bd178cc9e3d5bbffdf6db4174fcb6db6e8383070f5289a3e43c9d32650a1a53bfdf4ff6c5867b12e6cf9f8ffa21f3f2e2850b17a65601bfbbefbe3b29b4f7f97c96b7d550abb4cf3fffdc686a6a42db4f7ef213f4f8534f3d45c67dcb962da88df5ebd7a37f2f53c04f22a6b68c4bd7ae5d2dafb0e22b06a11f1e8f07eebaeb2ec06276f8f061f43af14dda683ca852cd32f1484601bf536f4a6fefb19d376f5e6aadb0f891b0634a666b4efce643c785aa1a113f7ece1f09354d83e6e6664bd7917824e4bd842d8ea7dc232103ab638a8195b818580c2cc3301858e7420cacc4c5c03a0f80b574e952cb89a30b172e4c89027e12499fe70db0640af8c5dfa68c8e0bf59b4d7cc370bb268e6eddba558fc562ed0eac4b2eb904a87824a3805f6e6e2e69830256bc58e1392fe027532183575802f10aeb2cd8f00aeb0cf10a2bf1bea4dc0a8b81d531c5c04a5c0cac0b04580e476a14f0a3de296847013f5dd78dc3870f9bdaa79f7e6afafce5975fca8416d5175f7c815ea3e5e7966ddbb66d40d5229279f9a84c5d2e2aa6d5d5d580f94af5e599679e01aa4694a22824b08e1c39825e37fe2886c623550af84d9b368d81d59a9a9a9a2c17f0fbed6f7f0b7ebf1f1445315a6b814000c2e1b0f078bc81cfe743cfb9e28a2b503f240bf8a1361e7ef861f0fbfd86aaaaa75b6666e6e97f2b8a02575d7595a56ffa83070f42515191e91a9d3b77367d5614458f17036cb5f97c3e12360e89df303c1e8f8ec53cfe3b187a0d8fc723f4f3545f5ac6f4cc26710dc3e3f1c09ffffc676102e29ffef42788c56226bbe5e5e5a6cf32498e5eaf178d47381c86402080cd75e3b9e79e43e7075552dae1a00bf85d7ef9e5a81f5eaf173dae288a110a8574ec1cbfdf6fbcf1c61b685f3a6401bf5451aad474a724b335472631900296c423a11d5b73c8644b99951e65837a24b4a9a67b87d99a932a22e26d3852f137ac5411038b81c5c04aae185816c4c0626031b092aba403eba1871eb29c87952abaf7de7b2de761cd993387b46115587bf6ecd1333333d1df53bc5e2f5580ed24f59b8cc7e3218b2252c0baf2ca2bc95c2eea372889e27ba40d0a582fbdf4924e15938b175e3ce705fccacaca2c17f04b15e5e7e777bc027ea9225e61991bafb0ceee2f150f5e61252622de0c2c4c0c2c0616032bb962605910038b81c5c04aae920eacc58b179309662e974b9f366d9a216ae3c78fd7c78e1d0ba2e353a74ed5a74f9f8eda983871a23e6edc38d4c6b469d384c7a74d9b665455559185d1344d437342468d1a45da88c562a88df7de7b0f264f9e6cf26de6cc99a7ff7de38d3782cfe793f9bd05f5c3614351c4ce9d3ba37da9acac4c8a1f940d9fcfa78f18314238fec3860d0345512cfbd1bf7f7f341e5bb76e852953a69cbeeeac59b34c7e4c9a34093ef8e0032ad39d2cbe575d5d8dcef5e9d3a7eb53a64c119e336edc387dc28409a88d69d3a6a1f7e4b871e3d07b72dab46952b96d8b162d4a6a1e961d19b3a96283dcde73c30d3790362291086aa35fbf7ea48dcccc4c58b3668d216a252525966d1416169236cacacad0be74eedc99b4919f9f8ffa91959545da282a2a426d4814df83ce9d3ba336e2d9f4a88d7efdfaa1f1884422a48db163c7a642967ab26c502de98f841d297829f1483868d020d2467171316aa36fdfbea48d8a8a0ad446aad474afacac246dd4d7d7a336cacaca481bc9a8e92e035f1bf612a6cafdc2c03ac73618582d6c30b0cc36185809dba01a03cb820d06560b1b0c2cb30d0656c236a8662fb01e7cf0412a894df6ed1bed5dc0cf96228014b06ebdf556a06c50c0bafaeaab491b14b0860d1b46daa0801507a7a5c4d1f8ef71960af8d5d7d793362860f5ecd993b44101aba6a686b441012b0e5f4b05fc248befc9c0a6bd0bf8c9da408ff30aabed367885d5c206afb0cc36788595b00daa31b02cd86060b5b0c1c032db6060256c836a0c2c0b3620180ca2c11b3b762c69232b2b0b3efae82343d4faf4e943da282a2a42fde8d5ab1769a3b4b414b5d1a3470fd246e7ce9dd1bec8c0a6b2b212b521931a515b5b8bf6a5b4b494b451575787fa2151c00f060f1e8cfa21935e317efc7806d619d7b01558efbcf30ea8aa0aa150c868ad058341484b4bd345c743a190a1aa2a040201d4467a7a3a6a43d334501405b5919191213c7eea1ccc46281432aebbee3a34789b366d024dd38436344d8360306884c361610b854210080484fd0d06830695c9dcab572ff2b783f2f2723421af478f1e32c5f700eb4bfc2514940d321e8aa2a0f158bc78311a8f3beeb80382c1a0705c4e8d3be587aaaa423f344d331e79e411d48f38f4d071993469123a2ec3870f27fb821d0f8542464646066903bbaf43a190919e9eae6336e2c5fd501b141b344d33de7efb6dfb80c54a4cfbf6ed23dfb81c8d4661e3c68d96b65624e991d08e9aeee4b69a5028043b77ee6cd7ad26325b73144581bd7bf75af2c38e474256eb6260b58318580c2c0656fb8881d50e626031b01858ed2306563b68fffefd7a2412417fd7b10358d75f7f3d99534601ebdbdffe3699db46fd46e576bbc9428254f1bd64004ba6809f1dc0eaddbb37392e0cacb68981d50ee21516afb07885d53e6260b58318580c2c0656fb8881d50e626031b01858ed2329601d397204468d1a658c1f3ffe749b356b96e9f3983163f4333fb76c63c78e8523478e581aa48f3ffef82c3f66ce9c69f261cc983180f93172e448fdc61b6f149e3376ec58d8b46993253f3ff8e003f28dcbc160d078e9a59784d7f9eaabafe081071e30f9396fde3c93aff15a56e86f25595959683ca2d128b5ff92ba8614b088e386cbe53a79e595570a7d1d3972a47ef3cd37a37d19376e9c3e7af468e13903060c20c1e972b94e0e1f3e5c6863f4e8d1b067cf1e2ad39d2c02386edc38a98275221d3d7a146eb9e516936f73e6cc317d7ef4d14741d775a1af9f7ffe394c9830c1f437b367cf6e793fe8e3c68d13c6e3861b6ed06fb8e106745c28368c1a350a3efbecb3d4cb745fb264892510dc76db6d49c974a75e552fa3dffdee77c6ba75eb84ed85175e40ff7ed7ae5d102fe286410f6ebbed36105de3befbee23577a32af99cfc9c9115e63ddba75c6860d1bd0bede7df7dd645f24c6855ce9c9d890781336198fcb2ebb0c9d1f191919a48d51a346599a638f3df618750dc3e7f3a12058b16205694326a61236a8969a5b73ac026be6cc9949015688d84b980cc9d4748f4422b079f366a1af6fbdf516048341d4861d35dd296ddbb60da857afdb51d35dc646bc0ebea5f9918cbd84946480e5f7fb1958169c666025200616030b13030b11032bf9626031b03031b0103df0c0037614f0b30cacb973e7523f0027a5805f32b47bf76e3d1c0e5b02d63befbca353a08827855a2ae047e9b5d75ed3e32f6610fa11ff7d8a4a3e9501166ac3ebf55ab54102aba2a282b46115583ffad18fc87b8e02d6c30f3f2c5b7c8f02d6f959c08f5758f2e215d6d963cb2bac7f8b5758881858c917038b8185898185c82e60dd75d75db06fdf3e43d4f6efdf2f3cb66fdf3e63fcf8f149011655c0efebafbf3ecbb7f7df7f3fa1beb43cbf65dbba752b9992909696066bd6ac11c6f4c5175f24a127914305555555683c4e9c3881f6e5e9a79f86502864193676a43550d093991f83060d42e3118bc5481b23468c40ef85fffddfff45ef49196079bdde0b13587ffef39f211a8d426e6eaed15acbc9c9819c9c1c5d743c3737d7484b4b03afd76b288ad26af3fbfdbac7e301d17145510cafd70b696969c2ebe4e4e4405e5e1eea4756561674ead409eb8b3179f26434784b972e059fcf67f22d5e10ed745fb0be2a8a62f87c3ef41cbfdf0fe9e9e9423f7373738d8c8c8cb3fc68710dc8c8c8406de4e5e5a1639b9d9d6d3cf0c003683c468c18017ebf9ff2031d97fcfc7c88c562423fd2d3d375a7d3894e7ca7d309914844789dcccc4cc8cbcb43e3919f9f0f595959c273b2b2b28ca79f7e9a2c24989d9d2db4418d9ba228467171319a68fde4934f52bf1b198aa2c09123478409aa7bf6ec81fcfc7c341eb9b9b97a4e4e8ef09c4e9d3aa1f7537c0ea1631f8d468d77df7d37b50af8c57f30b7bc3a6a6a6a3ae78f6b1235ddc9bec47ffc45bf859351d3dd0ed951d39dd2962d5ba053a74e684c354d83e6e6e6733e3f283dfef8e3e4ca46d3343878f0a0b02f763c12764431b0da200696590cacc4c4c06abb18586d1003cb2c0656626260b55d4903d6d2a54b655e824ae673a402b0eeb9e71eb22f4ea713ed8bcfe7a3fa4b02eb3bdff98ee5027e76e8aaabae22fdb00aac5ffffad77a4e4e0e1ad38e02ac0d1b3690b94b14b0d6ad5b47da60605910afb0788565e51abcc2328b5758ed2c061603cbca3518586631b0da590c2c0696956b30b0cc6260213a7cf830f4ebd7cf183c78f0e976fdf5d79b3e0f183000cefcdcb295969682a6697a341a355a6b9d3a75d21d0e0778bd5e43d45c2e17ac5ebdda52e1b3f7de7b0ffaf7ef6ff2ed9a6bae39fdefcb2ebb8c84e2cc9933211c0e83a82fe9e9e9e072b984c7a3d1a8e1f3f9405555e139191919d0a9532734a6e9e9e9badbed16c6cce572e9a15048c76c0c183040efd7af9ff03afdfaf5d32fbbec32d48f70387c12f3c3ed7643b76eddd071dbb469135c76d965a76d5e7ef9e5a66bd4d4d440381c16ce9f68346a689aa6d7d6d60a7d1d306000bcf6da6b966ee0cf3fff1c5acefd1b6fbcd1f479e0c081fac08103857e545454e82e970b9deb6eb75befdbb7afd046972e5d405114341ed168148e1e3d2aecef3ffff94f18346890c9ee881123ce9a1f83060dc2e6077cf2c9274983625233ddbff7bdefc1c68d1b8dd6da4f7ffa5390c964b6bac29a346912b91aa00af81d3b76acd53e9cd9366fde8c1e7feeb9e7d0e3cb972f079fcf67393b9c1a17191b7614bda3b2e5655e55dfb97367e1fcd9b871a3919d9d4ddae8d3a78fa5f9b37efd7a484b4b4b467638d99761c386a1f178e79d77d0bed894e90e0d0d0de727b0b0bd84c78e1d036a27bdc306604d9d3a951c808eb29730be2fce126c24f612da51d39d7c24acacac246dd4d7d7a336cacaca481bfdfbf7b70cacf8d69b730eac19336658ea0b038b81659b18580c2caa2f0c2c811858c917038b8145f5858125d0e2c58bdbbd80dff1e3c7812a58e7b0015877dc7107107d490960eddebd5ba72a1cc4dfa68c26b052b09128e02763838c2905ac1e3d7a9036286075ebd68db4611558cf3cf38c1e2f1f43dde496ef17aa2f5681b56ad52a5bc09972c0e21556f2c52bacc481c52bacc474deaeb01858c917038b8145f585812550b28025535c8d02d6c183078d5dbb769d6e7bf6ec317dbef1c61bc901505515cefc9b966df7eeddc263a7da912347d0987ef9e597a8dd175f7c917c979f1d2f30b523ad41e6dd865dba7441635a5c5c4cdaa8aeae466de4e5e5498113b3f1e1871fa2e3b67efd7aa0ead34bdce4b6006bdab4690cacd6f4d0430fe9f189d96a3b3500a2e3f173e0d1471f15260f1e3f7e5c571485b4f1e31fff5868e38b2fbe80a2a222d034cd38d53233338d333ffb7c3e8844227a7171b1d15acbcfcf87603068fa9b96cde3f1e83e9f4f785c5114f29b7cf2e4c91008044c7f170e874fffdbeff7eb582c9c4ea7e172b9d0be646767eb2e978bb4118d468536f2f2f2a0b8b81844c78b8b8b8d536fb9c6e687dbed062ca6a75671980d8fc763870d746ca3d1287cfcf1c7c2b1fbfbdfff0e353535683c8a8a8aa0a0a040784e46460639b66eb71bf2f3f3b1796afcee77bfb3048a356bd648f951585888cd0fe9e27b7628a55658561f090f1f3e4cbe22dee170c09a356b84363efae823b29cafccb74e6e6e2e3a8883060db2bcb2b1a3a67b4646066cddbad5d28493d89a634b3df664d474571405f6eedddbae37a01d5b73ec90cc0acbed76c3891327cef94f24a7c4c06a210656e2626025260656dbc5c06a210656e2626025260656db2505aca6a6265b8aef1179587a494989a5027e9f7efaa95e5e5e4edac080f5f1c71feb151515940db2f81e05ac1b6fbc5126ff09f58302567373b31e8bc5501b76004ba280dfc978ce18766358b6118f176ac3e7f3a13692012c3b0af8d9a1b56bd7927e744860f10aeb6c1b447f7985d5a22fbcc2fab77885d57631b05a888195b81858898981d57631b05a888195b81858898981d5764901eb473ffa11689a069148c468ad75ead409e22fb16cf578241231344d339e7cf24961c74f9c3801b1580cb5a1280a94959519fdfaf56bb5d5d5d5e91e8f47f7783c86a8391c0ebda4a40444366a6b6b21180cea981f6eb75b773a9dc26bb85c2ec8cdcd450bd60d18304077b95ca80d87c381fa110e87a1aaaa4a188f9a9a1added76a3f1f0f97cf09bdffcc65251c4eaea6added76a33177381c408d0b1677455174a7d369c986aaaa10cfc313c6545555bd478f1ec298f6ecd953afafaf17ce9f7efdfa19bd7af5d27bf5ea253c5e5a5a4af6c5ed76ebb5b5b5c2ebd4d7d7c35ffef21714240b162c80be7dfb9efe9babaebaaaa51fa0280a3ac7a2d1287cf9e597c2eb1c3a74085af675f8f0e167f98ac5abaeae4e1aced22592376fde8cb65ffef297e8f1975e7a89bcc6ae5dbb501bd75c738d2d2b3d6a75a4280a607e0c1c3890b4919999890e804c79e3cccc4cd40f89ed2c643c5455b5bcc2eadab5abe5d5a2dfef87a54b970afb3b7ffe7c72f5ecf3f9e0a1871e4263f6f2cb2fa3732c3333d3f24a4f628e2525d33d5e0012b571edb5d7a2f1dabd7b373af68d8d8de42a4da2d9fbaafa54d1cc9933933211a8bd841235dded7824b4a3a63b098a5479240c8542b073e74ea11fc9aae95e505040f645e6a78b64cc536a2f617c6b176a63d6ac5996e2c5c042c4c0328b81c5c0c2fac2c03ac7626099c5c06260617d61609d63dd75d75de0b05e188d7c4b3105acc99327537e90c0bafcf2cb491b14b0e2bfa5516fa06e77605d7ae9a5a41f5681f5ca2bafe85495043b80555e5e4ece3149609df3027ef1ffdbddaec05ab26409997c2ad3d7f31258bcc2328b5758f6038b5758898957588818586631b01858585f1858883efef863e3adb7de3add9a9b9b4d9fdf7efb6dd3e7d6daa14387d06bc4ebb1b7fb44505515303fbffded6f9336a2d1286a23fe1885da282c2c4407b177efde96e3a1aa2a3cf2c823a8af478f1e45c7a5aaaaca3238354d238145bd0f5051141258bb77ef46e769bc5e3bda172af954628ed9324f478c18818e9b4c5ac3e8d1a3511b1f7df4113af61d1258baae437e7e3e844221e354cbcccc34cefcecf17874afd76bfa6f67b6603008252525a8d37ffce31fa1b8b8182a2a2a8cd65a6969a9ee76bbd122804ea71332333375c40604834110f9190a850cbfdf0fd9d9d9421bc5c5c5a0aaaaf0ef4ff53727274768a3bcbcdc78e08107d0783cfdf4d3505a5a2a8c477e7ebeee76bbd1026d0e8703fc7ebfd04f5555e1eaabaf46fda8aeae260b2f6a9a26f4b3a2a2c21832648881bd56fd934f3e81be7dfba236860d1b667cfef9e7421b6fbcf10644221153ff62b1d859fd2d2a2a128e4b6161211af3f8d8e9656565c273a2d1a854e1bce2e262a11f595959e8b89d9a63656565421bb1588cb4515050005f7df59530a67ffbdbdfc878949494087d88df2fc65ffffad7e401ebe4c993407d83ca7c6378bd5e4bcbd3646ecd59b76e9dd0c6be7dfb201008a036a2d1286cdcb8b15db73cc86ccd91a8e90ed5d5d5a89f128f84644df76468d3a64d104f0c4557691d616bce638f3d46daf0fbfd807d099cb75b732831b0cc626031b03031b0da2e06560b31b018580cacf31c58baaeebc5c5c5968bde590556120bf8a1c0dabf7fbf9e999989da4806b0640af849bc8c9504964401bf9400d6cb2fbface7e5e59d1705fcd6ad5b47daa08075de16f0a3c42b2cb37885959ac0e215965917ec0a8b816516038b81858981d57631b05a8881c5c062609de7c0d2751db2b2b2202323c310b5d8d83a220000200049444154f84b060cb7dbdd6a73b95ca0699aa542729f7ffe39e4e4e4a07e04020128292931eaeaea5a6dddbb77876030a86336144581d2d252a18deaea6adde572e9a2bec6fbab97949480c846cf9e3d61f5ead59626ca5ffef217c8cccc44e3e1f3f9405555e139a15008323333857ed6d5d519c1605077b95c20eaabc3e1d043a1106ae3bbdffd2e7cf1c51796fabb76ed5ab8f4d24b4fdb8c17873bdd4ee5e961e3e276bb4f5657570b7dedd6ad9b7ec92597a07de9d1a387deb3674fe1f1c2c242dde974527ee8ddbb77175ea7b8b8180281003a4f737272d0983ef3cc33a0691a3a3f5455d5cf8c69cb565555a55f74d145c2e3757575c6cc99336d039e6d99eeefbdf79eb175eb5661bbe1861bc86f618fc763b9637bf6ec41fdb8faeaab493f144501cc467ce3b2a54c6689d7cc43414181e578bcfdf6db683c5e7df555f4f8ca952b415555b42f32a589a915b8aaaa68a6bb8c8a8a8a483f4ebd1d1a8b3b6523550af87dfbdbdf46e7e9debd7bc99851e32f314f65fa6265584d4ada5ec2b973e7b6fb23a18ca64e9d4afa61c35e427210e3fbd1503fa8bd84c9d08e1d3b201c0e5b85afe5bd84322a2b2b23fdb0635b4d47d94b6887247e326060b5a71858898981c5c0b2a12fb6f9c3c06260a1626031b06ce88b6dfe240d58f3e6cd03473b278eca68faf4e9a41f14b0264c9840d92007512661331580f5c61b6f9055124ebde10739c772013f195554545037d74906566292f8623d3f81c52b2c73e31596fdc0e21596fdba6057580c2c0616668381c5c09291b4a51d3b7698dace9d3b4d9f3ffcf043f4efe7cc99430e80cbe58296d739b3bdf1c61bc263a7dac18307513f6eb9e516d20f4551503faeb8e20acb832893b049a5351c3b768c8cd13ffff94f341e5f7cf1056a63cd9a35b6a43550f1f0fbfdb076ed5a34eec78e1d43fb52525242fa713ea5355c77dd7568bc7efffbdf93f70b754f75c8b486a79f7e1a144531d2d2d24eb768347afadfe17018f2f2f2d09bebbefbeed39d4ea7e172b95a6d8e78aece99d768d93c1e8feef3f984c7c3e130949696a27efcfef7bf872e5dba407575b5d15aebd2a50b844221d48f536f7e16f5c5e974422010d045d7a8aeae36ba76ed0ae5e5e5423faaaaaa8ce5cb97a37db9e9a69b40d334936fe9e9e9a7ff1d0c0661f0e0c1a88debafbffe2c1b67364dd320333353e8677575b5a1691a5063eb703884c7e3e79c35c75afa3162c408b42f4d4d4d50595929f4352f2f4fc77c70b95c86dbed86b2b232e1d8e5e6e692365c2e1774eedc5968233b3b1b9d3fa7e241c5d4e3f108e3159fa7100a8584c77d3e9feef57a511b9aa6416565a5b02f252525505a5a8ace8fc99327273771f4fefbef2769ef743a51a7241e096d7b6bb39580c86ecda1fca06abadb2199b747575454a07ed4d6d692366cd89a43ae4a245669505f5f6f29a6766ccd59bf7e3dc4623172b578e0c001a10d99ad391273cc8efb45ea49a0c36dcd616031b0301b0c2c0656b2c4c06a210616038b81d5c181b56ad52a32678802d6b265cb281b54813f99732c034bb2801fe9473280f5ddef7e971c170a58d75e7bade5027e575f7d3539b6f1bc33ecc620fdb00a2c3b0af86ddab449cfcfcf270be761c09229e0e7743aedb85f2cdbe890c0e21556e27ef00acb3cb6bcc2fab77885d57631b05a8881c5c0626031b01858ed2006566262605d20c05ab162059937e276bbf58b2fbed810b5dcdc5cf0fbfdba28df23140ae90e870388dc14f41cc73759c8a81f9595957a454585f078555515844221a19f69696986d7eb05bfdf2fccd50a8542909e9e0e981f175d7491deb56b57f478b76edd501bb1580c545515fa1a0c06211289a03682c1a0ee743ad1986a9a86da8846a3a0699ad08f4020805ee38c3c2cac2fc677bef31df4c679f4d147a1a6a6e6b45f757575263f4b4a4a20180ca263abaa2a3a2e454545e4fcc8cccc44ab85bef2ca2ba0691a9aebe7f826c9158d97dbed46fdb0c3466e6e2e7cf9e5979680357dfa74d3fc193a74e859f71c06f83365d70a4b8af693274f86eddbb71badb5ad5bb742aa6410abaa2af473fbf6edc6ebafbf2e3cb67dfb7663c3860d406ddfb063cb43381c86458b16097d5dbb762d5932da8ee27b9aa641535393d08f952b57927e04020158bd7a351af7a3478fa2f3b4b8b8981cdb9a9a1af41ad16894b4d1b3674fd4864ce1bc37df7c139d43f112dba81fc3870f47fd90d9fe3562c408d4c6fbefbf2f830854c4fd68381c36bfaade2e602d59b244e8d4b163c7c89b5c0236b6008bda4b4849a6a6bbcc2e780a14914804366fde2cf4d5a69aeee47696b4b434d8be7dbbd08f6ddbb6417a7a3a6a23497b09a17ffffee8350a0a0a481b43860c69f747244dd3483fa8bd847ebf9fb4316bd6ac76ef0b713f32b02cda606031b01858368ab81f1958166d30b018580c2c1b45dc8f0c2c8b3618580c2c06968d22ee470696451b0c2c061603cb4611f72303cba20d0616038b8165a388fbb1e302cb8e6a90327e5083a8280a6cdbb6cd10b5d75e7b4d786cdbb66dc6d34f3f4dc2d78ea277a15008162c5820f4f5873ffc21994e2053a04d26ad61e5ca95423f962f5f4e82d38ef7124a14f0833e7dfaa0d7c8cbcb236d5c76d965966ff21d3b769862f4dbdffed6f45936ad019b87b2690d988d7dfbf659ed6af281f5f7bfff1d2ebae822e8d1a387216addba75d3b1e3175f7cb1f1e1871f0a9dd2751da64e9d8a5ea3b2b212ba76ed2a3ca75bb76ebac7e341dfa8eb743a212f2f4fe86b757535844221f46db85eaf570f0402c2e3a79231313f1c8e6f0ab4617eaaaa8ac634168b81a669423f42a11044221134a6ddbb7747c7b6baba1a2ebef862d446666626048341a11f9aa641341a456d5c7bedb5c6d1a3472d8160f5ead5d0bd7b77e1756a6a6a8c175f7c11bdc6aa55abd0fed6d4d418bffce52f2df9b965cb96b3c62d3b3bfbacb1abaeae168e7f616121288a228c797c1e424d4d8dd04641410169232727c772e2e8adb7de8a8e7d7575b5f1c1071fd807ac8ea2c3870f932b0a87c3016bd6ac1106c7a6ad3949a9e96ec7d61c3b24b135072eb9e49294d9de71ae25b33547d334345bfeb1c71e236df8fd7ef8ecb3cf843656ac5841dae8905b733a8a18580cac8e200656dbc5c06a210656e2626025260656db755e01ebd34f3fd5cbcbcba9a26628b06c2ae077325e804d68c3e7f3597e91ea77bef31dcb05fcec9044013f06d6199229e047016bddba75a40d0a586bd7ae256d30b0da51bcc2e215564710afb0da2e06560b31b01217032b3131b0da2e06560b31b01217032b3131b0da2e2960eddbb70fcacbcb8daaaaaad36de0c081a6cf9d3b7786333fb76c5dbb7685fdfbf70b3b7ef2e4491833668cc9c6d0a1434d362ebae822f8effffe6fa18da3478f4241410184c36143d4fc7e3fe4e6e60afd2c2b2bd3dd6e3759f8cce7f3e9a26ba8aa0a1e8f87f4c3eff70bcfd1340d323232d0986a9a46be9c565555d446972e5df4b2b232e1f1f2f272bd4b972ea80d5555493f82c1206ae38a2bae8023478e58ba31962f5f0e5dbb763d6df3924b2e315da3b4b494eccb35d75c03c78e1d13faf18f7ffc03eaebeb4d7f336cd830d3e76bafbd16feeffffe4f68e3673ffb195910535114fdd0a143bac8c6134f3c41da5055553f72e488d0c6f3cf3f0f8aa2a0f3545555534c5bb6a2a222bdb8b85878bcaaaaca983061826dc0eb7099ee4d4d4d68e70f1c3860ecdcb953d8aebffe7a5bfa327ffe7cc0aef3873ffc01f5e3bffeebbfd0e31b366c80f8d60aa11f3259ea545fec28e067571140ab99ee1205fcc852cd8140802c919c919181daf0f97c964b242b8a627985e5f3f9d015966118e43cb5638e391c497e557d2aed25a4804569ead4a9b6f465ddba75edba4cdeb56b17a8aa8afa1107bc2550d8b19750665253a048d25e429dfa524c959aeec9782494911d95711d0cacb68b81c5c0c2fc606099d52181b560c1022a5f83cce77010c03a7efc38040201d2865560cd9831c396beb437b076efdead6b9a66f5e5a3643e98cbe54a8a8df839ed0aac2e5dba587ea12b05ac0d1b36e8b158ccd28b549f78e209cb7958ab57afb69c8725a378be2006249917ba5a71c1245e61b5b12fbcc232018b575809008b57586d17038b81c5c0626009c5c01288816516032b7131b018588661d807acb163c7c2962d5b8cd6daa64d9b80ba311c8e6fde6d28b2b165cb16e337bff98df0d8962d5b8c6f7deb5bb6f465e6cc9996fcd8ba752b7afc873ffc61528a00da9192e0b02191d6eff75b069644b550b22f1e8f077ef4a31f09c7f6aebbee82783550a10db7db0d4f3cf184d0c6edb7df4ec2c68eb406afd77b61026bd9b265bacbe5323c1e4fab2dfe832a888e7b3c1ec3e170e83e9fcf884422adb6f4f474cb36d2d2d27497cb05a2e39148c45055154a4b4bf55ebd7a19adb5dada5aa8adad151eefd5ab97515050009aa609af110e8775b7db8dfae1f7fb415114e1f1534500b178783c1e282f2f17fa5a5555a57b3c1ed486dbed86ce9d3b0b6df4ecd913eaeaea008b472814026c7e9cfad11ef3c3e7f3c11ffef0076192a38c4a4b4bc1ed76a37e389d4ed40f87c301a15048382ef1b7589336c2e1b0d086a66950505080ceb1193366c0d75f7f2d84cdfffccfff409f3e7dd071b9edb6dbe0e4c99396803577ee5ca8afaf175ea7a6a6066a6a6a503fec2cc39cd41556aad8c0b6e6c868dcb87196fd48959aee191919b075eb564bf190d89ad3611e0965e6980def1e80891327a6cc76978e2406561bc4c0328b81c5c04a9618586d1003cb2c0616032b599202d6aa55abc8843c09509045ef9264c332b0e6cd9b6739d952a2801f996c4901abb9b9994c72b403581205fcc8844d3b803564c810d28f78dc857ec4c70db5e1f7fbadda6060b551bcc26a8378856516afb012b6c1c06aa318586d1003cb2c0616032b596260b5410c2cb318580cac64490a582b57aed41d0e87e1743a85cdf14d913643d43c1e0f78bd5e101d5714457738be79b928760dcc8ff8719db21189448cf2f2f2565b7171b15e5a5a0aa2e3e5e5e5465a5a1ae507389d4e341e7ebf1f7c3e9f301e8140008d57301834344d839c9c1ca19f797979bacbe54263ea76bbe1d5575f15e63f7dfae9a73070e04093dda143879a3e472211080402c2fefa7c3edde974a27e78bd5ecb7958656565d4d883dbed46c7e5d46f8fc41cb33c4fd3d3d3d139565252a29796960a8f171515c18e1d3b50e8dd72cb2d50565676fa6f7af5ea65b2919393a3e7e7e70baf515e5e6e8c1c3912745db704d7d1a3479bfadaaf5f3fd3350a0b0bd1dd0567caae1516389d4e686e6e3644ed4f7ffa93f0587373b3f1e69b6f02f52d2cf3ed47ad6c9264032291081a8f77df7d178d477373b3f1e73fff193d7ef1c5175bee4b30184457583b76ec205769c160107ef2939f08fbbb76ed5a323bdc8e57d517151591e372f1c517a3e312df766369b598ac39367dfa74345e3e9fcfb21f76944826fa69381c36bfaa5e1658563a25bb97300913c196c9949b9bdbee4b7e899aeee46325f548b863c70e0887c3a88db4b434d8be7dbbd0c6b66ddb203d3d3d151e09a17ffffee83564b6f7a4c83c85193366a07d8957ac6560b576410616034b648381c5c0a2fa6a2bb0162d5a44e6955805d6f1e3c721180c5285c064f2c152c14652803568d020cbf96014b0de78e30d3dbecfb3cdc0facffffc4fbd53a74eed9e87555555458e0b05acce9d3b9331f57abd2931c7286085c361cb7ed8012c2af7cdc12bac736e83575867885758ed33c778852510038b8185d9606031b03011fd6460a5800d06d619626031b0a8be261d580e87c332b0ec48eab36122d83299d2d2d260d3a64d86a8bdf8e28bc263a7da471f7d84c6acbebede725f028100343434087d6d6c6c242b9faaaa0a0b162c10dab8efbefb9292d620f15e42e8ddbb377a8ddcdc5c32a6a992d63075ead4764f6b70381cb071e346742e03e0c346d8371c76036be9d2a568013fb7db0d8aa2589a6c0000b367cf8601030618a2969b9b4bfae1f57a511bf5f5f5505b5b2b3ca76fdfbed0b76f5f1db3919d9d8d16ac73b95cbad3e98468346a889acfe703555585c73b75ea043d7af44063faab5ffd0afaf4e923ec4bf7eeddc9027e0e8703344d13fa919e9e0ed168148d692c1683b4b434a18db4b434c8caca426ddc7cf3cde8db9265f4b39ffd0cfaf6ed2bbc4e9f3e7d8c575f7d15bdc6134f3c01fdfaf513daa8abab83debd7ba37de9dbb7af8ef9515e5e8ece638fc76378bd5ea8abab13cec3debd7b1befbdf71eda97c6c646e8dfbfbfd08fe2e262d20f87c30191484438b6c160101e7ef861d48f868606345ebd7bf7363ef9e4938ef54828a3993367927e5805a78c92b435078a8b8b2df545666b8e44095ca8aeae46fd90d89a03975c72096f4589cb8e9aee7668c58a15a41f322bbd868686a48d2d03ab0d626099c5c04a4c0cacb68b81d50631b0cc626025260656db2505aca6a6a6764f1c9551636323e947328075cf3df7c8246ca21341a2809f6560c914f08b17d643fda08075d5555791361858ffd6860d1ba8782505586bd7ae25fd88c30a1ddb940316afb0cce2159659bcc24a4cbcc26abb18586d1003cb2c0656626260b55d0cac3688816516032b3131b0da2e29606ddab4094ee50db5d6144531acde5c329a3d7b365918cde3f1e885858586a8e5e4e4e8b1584c783c3f3f9f4cc81b376e9c54013f51bc54553df5f259d4467171b1a58276fbf7ef8768342a1c3755550d9fcf878eaddfef874e9d3a0116d38c8c0cf0fbfdc2fecad8282c2cd473737385c77373732d578a95d13df7dc03f9f9f9a7af5b555565f223168be9671e6fad0d1d3a148e1d3b26f475c3860d68a141a7d369b85c2e341e393939f0faebafa3f1183b762c1414149cfe9b9e3d7b9e356e1e8f079da7a76085dd73e170188dc78811236c1b37e97748efddbb176d870f1fb6cb27a1245ef16d4b0671301844033c7af468d24666662660f1aaadad256de4e7e75b1ee80f3ffc101db7bffef5afe8f10d1b3690abb45028044f3df594b0bf4f3ef924844221cbe3525757d7eec0cacbcb23e718b523c3eff7c381030784becaacb064e26143013f983061023a4f5d2e971df79c6de3639fa52448e291d016608542216a8545daa0f6120e1a34a8dd1f09ed50b2f612c6ffaf2a1a8ffafafa768f871d7b0993052c1bf61202f51a79899f0c18582231b0922f0616038b81d546cd9d3b372985d128604d9b36cd7201bf6f7deb5bed9e876587de7cf34d3d2323a3dd0bf839255e3e9a0c605556565a2ee047016bddba7532f94f960bf8c5c70db541012b140a514092b9e7da3a1c67a943018b5758c917afb0ce9e63bcc24af89e6beb709c250616030b15038b81c5c06aa31858c917038b817541024bd77563fdfaf5a6f6f39fffdcf479cf9e3da88d64a535689a860ee24d37dd44da0887c3d0b2bf67b6aaaa2ad20695d6f0cf7ffef32cbbcf3cf38ce9335504f0f0e1c367d9d8b061c3e97fffbffff7ff40511434a6aaaa42434383b0bff7dc730f040201cbe3d2b3674f341e1f7ef8211a8bf5ebd71bcf3efbac704cd6af5f6f64666692738c2ae0e7f57a9302ac214386a0734c2629f88e3bee6060b5a6071f7c1042a19091959575bae5e5e59dfe772c1683cccc4c34781f7cf0010c1c3810860e1d6ab4d6060f1e0c43860cd145c7870e1d6a0c183000faf5eb27b43164c810e391471e21f3b0dc6eb7e1f3f95a6d1e8f47773a9d70665f5bb6f4f474e8d6ad9bd0d7c183071b1b376ea4361d437a7abac96e7676f6e97f472211b8f4d24b511b43870e858c8c0ca19f191919108d4685f11a3a74a8118bc5501ba15048773a9d208a573c66d0a3470f613c060d1a4416dfebd1a307442291566391959565689aa6fb7c3ea19ff173a057af5e423ffaf7ef0f83060d42e371db6db7c1d75f7f2df4f5a9a79ed2b1f9e3f3f90c87c3011e8f4778dce974ea5eaf17ed8bc3e100afd72bb4e176bb61f6ecd96872f292254b60c89021c2fef6e9d307faf6ed8bc663e1c285c94f1cb5aab973e792b4f77abde7fc114846766ccd8946a340018992444d77a8a8a840af2193c06ac3d61c725592a49aee64d2a7a228d2af4d6fab6c5a61d9f234413d12a69a18586d1003cb2c0656626260b55d0cac3688816516032b3131b0daaea4016be9d2a564125b4701961d05fcec00d6f5d75f4fc69402d6f0e1c39351c0ef64bc5060bb026bf0e0c1a41fd45b8893012c99027ef1f96335499ab2c1c012895758f6038b575866f10a2b611b0c2c9118580c2c06d6376260b55d0cac3688816516032b3131b0da2e2960fde94f7f824824626467679f6e3d7bf63cfdef582ca6676767c399c75b364dd3c8cd9e6eb71bb591979707bb77ef1606f85ffffa175c79e595a6bfe9ddbbb7e9732c16d333323284d788c5623061c204aa309accc6557432b95c2e78fef9e78539309f7df619f4eddbd7e45bbf7efd4c9f333232c0ebf5ea8140c068adf97c3e484f4f47631a0804c8df412a2b2bd15c9deaea6ad286cbe512fa1908048c68346aecdbb74f18f70f3ffc106a6a6a4cbef7efdfdff4d9eff75bf6435114c8cccc14c62b3333137efad39fa2f3e3b6db6e83537960d9d9d946d7ae5d4d3682c120b95958024676d8808686064b4522df7df75d88c562a6fed5d6d69a3e0f1f3e3cb9795812259293f68af8a6a62661e70f1f3e6c4b463555c0efe69b6fb6dc978c8c0c7485b56bd72e32c33c232303d6ae5d0b070e1c305a6b2fbdf412f99a7989026d50595989c6a3baba9ab451555525f4f3c08103c6a14387d039b865cb16727b8fccd8d6d6d6a27ee4e4e49036060f1e8cc6231a8da6ccfd42f5e5ce3befb40493c6c64699d5a2954b9874de018bbac96506d186bd84961f0977edda45c2261289c0e6cd9b8536cea79aee5bb66c814e9d3aa17d91d98fd8bf7f7fd40f89bd843064c810d446565656cadc2f545fac3e1232b0081b0cac7f370696b931b0129febe725b0962c5942e58dc81424a3f246a4f24a30607dfae9a77a341a6df7027eb7de7aabe5428214b076efdeada7a5a5a1362860bdf3ce3b7a7a7a3a6ac3ed765bcec3ead3a74fbbbf48f597bffc2539b632450029605d74d145a40d0a585dba744946a1495b8a555a05d6b265cb64ee7d2b9730895758ad1ce71596391ebcc232dbe015d6bf95922b2c0696590c2cb318586631b0ce6e768981d5ca710696391e0c2cb30d06d6bfc5c0226c50c08a5759b434885401bf1b6fbc91b441f5251008c02db7dc028f3ffeb8d15a5bb87021c4df2b27b4110c0661c68c19421bf7de7b2f190f999bbc4b972e683c2a2a2a481bf9f9f9423f1f7ffc7163fdfaf5c2638f3ffeb871fbedb7db32b6151515a81f7128a236060e1c88c6232323c3f2fcb0eb7ea1fcb8fcf2cbd1783cf3cc33e8b85c77dd75a907aca3478fc298316360d2a44986a84d9c3851c78e8f1a350abef7bdef096d4c983001264d9a84da9832658af1c5175f08278baeebb07af56ad4cf3163c6c0c8912385e74c9c38d1f8c52f7e814ec89123475203243b99d0e3d16814ed4b61612169232b2b8b1c376c6cc78f1f6fecd8b1038d47656525190f6a3338755cc686dbed866bafbd563887860c1902f1b7190b9bcfe783112346086d8c1b37ce78efbdf7d078c46231725cba74e9828ecba44993f4f1e3c70bcf19397224dc7cf3cda80daa94b3c39ee453d2869d3b583a544df754911d8f84f1c9847efb5135ddedd89a6387ecd89a23b1d2236d689a06cdcdcdc2fe6edab409e225908536ecd89a23f1480813274e6cf77191a8e99eac2723dbfac4c06a8318586631b0cc626031b0524a0c2cb318586631b01858292599375053bfb7c40bc9a1497d14b0aebbee3acb05fcec90c45bacc9027e1209aca40d0a582fbdf4929e9b9bdbee05fc7af7ee0dd4b8240358252525941f761401e4373fa7ba78856516afb0cce21516032ba5c4c0328b816516038b819552626099c5c0328b81758e81f5d65b6f81a2284630183cdd8a8a8a4eff5b55553d1c0ec399c75bb64020a0070201e1715555f5b4b434d486aaaa966d689a86dad0340da882634d4d4da0288af03aaaaaa2c74f9de3f7fb511bc16010b5e1f57ac9cdaf5eaf17b5919696a6b71cdb339ba2287a7a7a3a6a23140a412010d091b187787fb0eb402010109e236323180c82aaaad81c044dd3847e4adad0c3e130f6f706055687c30193264d420be75d73cd35a6bee6e6e69e15af575e79059da7a15088f4c3e3f1a0f1f0fbfda0699a30eed4ef8a0e87c35055d55291c033d5e132dd9360832ce077f2e449e3e0c183683b74e890a5e3afbffe3ab9cd48a2f89e54e553ca06f53f10c2e1303cfffcf3d09ef19039a7b8b8981cdb5ebd7aa17ee6e5e591f1a0ca2ccbcc31aaaa6d7c5b166a63c68c19a88df84e09d4c6d4a9532d8d9b44e973c3e1b880b7e624c106b997301992d94b18bf712cc146622fa11e879ad0465a5a1a6cdfbefd9cc74ca2a6bb1d7b0975890c72cb8f849aa6590696c42321ef25b43088a9628381c5c06260492a2581f5e0830fa64a013f3b6c582ee0970cedd9b3872ce017fffd80ca07b39cffe472b9501ba902ac4b2fbdd47201bfeeddbb93f1a05ec62a33c72860e5e4e490362860c562b1762fe0b762c50a2ee0778e6da404b0788595b8788565d605bbc26260255f0cacc4c5c0328b8195fab0616031b018587131b0da3e401d0a588140001dc4a3478f1a8f3df698a9ad5dbbd6f479ddba75679d7366dbb061031af35dbb76017563c8245bda11530a7a814000eeb8e30ec0fafbc4134fa0f178f2c927d1e38f3df698f1f8e38fa3c7e375a8d0b12d2f2f47fd9428e04726b0caccb1912347a2732c9ed282da9832650a6a43e20b0d060d1a84c663e7ce9de83c95051635b6b29202d6e2c58bc90d926eb71b6ebdf55643d4264f9e0c13274e44cfb9fdf6db75ecf894295360d2a449421bd3a74f873beeb803b571d1451791938dcac39a3c793265830445301884175e78017d6b0e95efe3f178e0ca2baf14f677c488115236aeb9e61aa18d2953a600352eb9b9b9643ca8559ac4a4276df8fd7eb8e9a69b84be5e79e595e4aad5e7f3c1a851a38436264f9e0cb7de7a2b1a8ff8ea08edebcd37df8cceb1575e790566cc98219ceb53a74e353ef9e41319e851f314058da228f0af7ffd4b789df8ff90436d488c2d2c5dba546aa567db0acbe9749ef34702194d9d3ad5f223e1f954d33d232303b66edd6a69ec786b8e59e7d3d61cb7db0d274e9c10fa2abbc2a28075df7df731b05a13038b81c5c0626031b018580cacb81858e718580f3df4109980d6518075efbdf75a4e1c9d33678ee5027e14b0f6ecd9a34722114bc06a6e6ed6a3d168bb036bd8b06140c583da241b4f4e3d2f0af8d5d7d753f1480ab0e27b2b2d255a53c07af8e1876512c576769100000b224944415447c9dfb078852510afb0ec0716afb0cce21556c28d812512038b81c5c0626031b018580cacb81858e718584d4d4de4332a55a4ebb5d75e039fcf67040281d32d3737f7f4bf7d3e9f1e2f0467204df77abdc2e37ebf1f860e1d8a767cfaf4e9645f323232d0be8c1d3b5666f32b7983bef0c20bc2eb1c3c78108a8a8ad078a8aa0a583cbc5e2f99f4e972b960dbb66d960aac4d9c38117c3e9fd057afd70baaaa927dc16cb8dd6edde974a213dfed76c3bbefbe2beccb4b2fbda4bb5c2eeae6d15bced3339bcfe783152b56a0732c3b3b9bba81d16b04020123140a81dfef171ef7783cbaa228a80d99dc37b7dbad6336aaababe1ebafbf16f6f791471e21f3b09c4e277a0d9fcf67c87e69266d852551e8cb962c754551503fa64c9942daa01247c78c1963b92f9148045d611986611c3f7edcf8ecb3cf842dfee3ae253fd2d3d32dafb0befefa6bd4cfcf3efbcc3872e488a5e3cf3efb2ca4a7a7a37d5155955c61c533d92dcdb12143865055129231d76db95f6ebdf556c0e27ee2c40974ec655758d4fc90d50507ac8ef2482823899aeee40acb8e47c26468cb962d246cec782494996314b0241e0953065817ec5e42061603ab3dc5c06260198624b0962e5d6a390f6bd1a245649e0d715ce61c125812395424b066ce9c69b92f7600ebaaabaeb25c7cafa3006bebd6ad7abc205d9b81f5e28b2fead9d9d9968bef51c0ead6ad9b1d733d19362c036be5ca951db2801fafb012ec0bafb01213afb0dae77e392f57580c2cb31858c917038b8165180c2c0616038b8165411d16580e8703edf8dd77df2d65c3ea0078bd5eabb0210bf88d1a35caf2640a0402968155575767d90f9fcf0793274f86152b5618a2b666cd1ae1b1152b56183ffce10fd1e332e73cfffcf3685fb76cd902549d299fcf0777de79a7b02f63c78e256dc8ccb18a8a0a345e32ef14b463aedb6163c08001685f7ef7bbdfa1e39292c08aff608e06c6ed76cbacb0301bb2df18e8710a36e3c78f276d689a86da3878f0207cfffbdf87bbeebacb68ad4d9c3891cccaf6f97cf01ffff11f961236df7fff7db8f3ce3b857e8c1e3d5af6a59fe8b850ab343b6c288a027ff8c31f84713f79f2242c5fbe5cd8d7bbeebacb90593d151717a3361a1a1a742ca6575d75952cf4d0e3ddba75d3313fe22f41a5ee17141232e342d9f0fbfd6801bfafbefa0a66cd9a85c6f417bff8856d2b787e246cc586d59aeefbf6ed834020d0ee8f849464b6e6d851d35de6edd114c043a110ecdcb9d3523ceca8e94e69fdfaf5104f0cb5344f6da8e99e94c74a6a6b4eb2c5c0626031b0121003ebdc8a81c5c06260252006d6b99514b02492c348602d59b24426114ee699db52e2e8fcf9f32d278e52dabf7fbf4efd1fad6400abb9b959a77ed791797b34051b99b74753bfa5d901acfefdfb0335b65681f5dc73cfe9797979e86f3ff1b76d5b2ae057525242f5452671d4b28d0e092c5e6125265e619d6d83575889018b5758ad8b81c5c06260252006d6b915038b81c5c04a400cac732b2960ad5ab5ca7201bf850b175a2e7ae79078660f8542a81fd3a64d236da4a7a75bca8fdabf7fbf4cfe93ee72b90c8fc7d36a73bbdde4cb36297df4d14750505000a26b783c1e43511470b95cc273e2bfc760fd301cdf7c61e9221b2e970b545545fd505515dc6e371a8fb973e7a2f1f8def7be076eb75b781db7db6dcc9933c7524c376dda44161274381ce072b984f170bbddc68f7ffc63d48f7efdfaa17d71b95ce0f3f9d0984ae4cfc914df43afe176bb61fbf6ed49031aafb05a879ee51556bc3cadb02f32af112f2a2ab23c11befaea2be3c48913c2f6af7ffd0b3dfeda6baf41281442fb120e87e1d7bffe3558b94e972e5dc878d4d7d7a3f1d0751dbdc68913270c006b215dbf7e3d506f22f2fbfdf097bffc058d07a593274f927da1621a4f3e6df77baea1a18181d5d181453d127abd5ed28fe2e2e273be14dfb1630784c361b42f69696996bf652b2b2b2d032b19927924f4fbfd70e0c08173eeab1d35dd19580c2c06562b6260d9af0b1658cb972fb79c87d5d8d8981205fce6ce9ddbee7958efbfffbe9e9e9e8ef6c5ebf5927ea402b076eedca9676666a27db10358fdfbf727e3910ac07af6d967c997b1a60ab0e27eb67b11c0940316afb01213afb01217afb0ecd705bbc2626025260656e26260d92f0616034b4a0cacc4c5c0b25f0c2ca253988d3973e62425787ebf1ff563ecd8b1a40daaa6d69123478cc6c646535bb66cd9e97fdf79e79d20f3124bca8f582c86fa71e8d0a1b3fc58b26489e9f3dffef637cc84f1f1c71f9f6563f1e2c5a7ff7dcb2db790291a7ebf1f264e9c082ded9cd99a9a9a84c71a1b1b8d482442c6a3babadaf28df1e31fffd874dd471f7dd4f4f991471e41fd1c316204998cebf17852025832a93376dc73f3e6cd4b2d602d58b0804cb6a456585f7ef925343434c0fcf9f30d517bf0c10775ecf8bdf7deabcf9b370fb5f1e69b6fa27ec42b8ea27da15669a3478fa66cd8528c302b2b0bf523fe2255d4466969296ae3e28b2f266d646767a331cfcdcd25e361431140a8a9a9b17463bcf0c20b246c64fc282b2b43e3f1dc73cf9d73581986716a158ff6a5bebe1ebde7a87bb2a1a1c1c0de0c6db792f648982a4a959aee763c124ad474878a8a0ad4466d6dade5954df7eeddc978505b73e2406bd747c264d5744f15493c125aaee99e6c31b018580c2c06568711038b81c5c06260751849016bc58a1596134753450d0d0d961347efbefb6e32218ffacdc6e7f3594e1cbde69a6b80b24101ebca2baf246d50c01a3a742865832ce0177f4375bb268efee217bfd07372722c17dfeb28c02a282820c7f6bc0416afb0cce2159659bcc24a4d5db02b2c0696590c2cb31858a929061603cb300c06564b31b05253172cb0240af8c9e4d99036144591f99da3bd6d405a5a1a5ac06fcc9831a40dea3a3293495555ec1a46bcafe86f14948df80b24d0be74e9d2058d47555595cc065ad48f782ca88deda88d8282023878f0a0f0067cf9e597a58aef517ef8fd7e997141aff1e4934fa2a018306080c9467a7afa5936a88ab5bd7bf726e798dbed46fb5253530356f3ace25f68a76d6667679fe587ec4e09bb56584929d79a241b76acb0203737d7d220efdab50be2af3c17f6251289c0e6cd9b85d7b1a944725256585489e42d5bb600f526224dd3a0b9b95968436685a5280aecddbb576823854a24c38c19332ccdb1152b5650d7b0a54432112bc3e170c07df7ddc7c06aeb64626031b044361858898b881503cbea64626031b044361858898b8895fdc092c8c3a28e1b0eba58981d05fc6c290248016bd6ac5964ae8e5560edd9b347efd4a913da170a58cdcdcd7a2412416d48bc4855260f4be645aaa81f14b07ef5ab5fe9595959a80d0a5832795814b07efef39f9305fc24ee071258858585a40dabc05abd7a3579dfda012c6adc1cbcc2b2648357582dfac22bac7f8b5758898b881503cbea64626031b044361858898b881503cbea64626031b044361858898b881503cbea645255150ddea851a3481bd168d432b0a8c2799aa691c0a22a9fca246c52c9a712d542c93cbd402040022b7e130b6df8fd7e1258940d9fcf47024bb2a6161ad33163c6a0318de772a136a64c99d2eec072b95c1d0f588661183ff8c10fd0d6d4d4841ebffffefb2ddb58b8702169e3a1871e428f3736369236de7efb6d34169f7df61969e3dd77df950dad50cf3efb2c7a8d356bd69036366cd880da58b66c19d997f7df7f1fbdc6810307481bd4757ef6b39f917d59bb762d6a63e3c68da48dd5ab57a3369e7bee39d2c6c30f3f8cdaa0e6e00f7ef003e3f3cf3f47aff1c73ffe91b471fcf871d2574a8b172f46aff1eaabaf5abec6f6eddbc9bec84a1a582c168b75aec5c062b1581d460c2c168bd561c4c062b1581d460c2c168bd561c4c062b1581d460c2c168bd561c4c062b1581d460c2c168bd561f4ff01cec31316e72154300000000049454e44ae426082, 'N', '1970-01-01', 480, 0, '', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_pm25data`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_pm25data` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `pm01` int(4) NOT NULL,
  `pm25` int(4) NOT NULL,
  `pm10` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4059 ;

--
-- 转存表中的数据 `t_l2snr_pm25data`
--

INSERT INTO `t_l2snr_pm25data` (`sid`, `deviceid`, `sensorid`, `pm01`, `pm25`, `pm10`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(4058, 'HCU_SH_0301', 1, 274, 274, 1170, 'N', '2016-03-13', 1233, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_raindata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_raindata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `rain` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_raindata`
--

INSERT INTO `t_l2snr_raindata` (`sid`, `deviceid`, `sensorid`, `rain`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_sensorinfo`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_sensorinfo` (
  `id` char(6) NOT NULL,
  `name` char(10) NOT NULL,
  `model` char(20) NOT NULL,
  `vendor` char(20) NOT NULL,
  `modbus` int(1) DEFAULT NULL COMMENT 'MODBUS地址',
  `period` int(2) DEFAULT NULL COMMENT '测量周期，单位秒',
  `samples` int(2) DEFAULT NULL COMMENT '采样间隔，单位秒',
  `times` int(2) DEFAULT NULL COMMENT '测量次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l2snr_sensorinfo`
--

INSERT INTO `t_l2snr_sensorinfo` (`id`, `name`, `model`, `vendor`, `modbus`, `period`, `samples`, `times`) VALUES
('S_0001', '细颗粒物', 'PM-100', '爱启公司', 1, 100, 500, 200),
('S_0002', '风速', 'WS-100', '爱启公司', 2, NULL, NULL, NULL),
('S_0003', '风向', 'WD-100', '爱启公司', 3, NULL, NULL, NULL),
('S_0005', '电磁辐射', 'EMC-100', '小慧智能科技', 5, NULL, NULL, NULL),
('S_0006', '温度', 'TE-100', '小慧智能科技', 6, NULL, NULL, NULL),
('S_0007', '湿度', 'TH-100', '小慧智能科技', 6, NULL, NULL, NULL),
('S_000A', '噪声', 'NO-100', '小慧智能科技', 10, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_sensortype`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_sensortype` (
  `id` char(6) NOT NULL,
  `name` char(10) NOT NULL,
  `model` char(20) NOT NULL,
  `vendor` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_tempdata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_tempdata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `temperature` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21027 ;

--
-- 转存表中的数据 `t_l2snr_tempdata`
--

INSERT INTO `t_l2snr_tempdata` (`sid`, `deviceid`, `sensorid`, `temperature`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_toxicgasdata`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_toxicgasdata` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `toxicgas` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_toxicgasdata`
--

INSERT INTO `t_l2snr_toxicgasdata` (`sid`, `deviceid`, `sensorid`, `toxicgas`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_winddir`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_winddir` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `winddirection` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_winddir`
--

INSERT INTO `t_l2snr_winddir` (`sid`, `deviceid`, `sensorid`, `winddirection`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l2snr_windspd`
--

CREATE TABLE IF NOT EXISTS `t_l2snr_windspd` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `sensorid` int(1) NOT NULL,
  `windspeed` int(4) NOT NULL,
  `dataflag` char(1) NOT NULL DEFAULT 'N',
  `reportdate` date NOT NULL,
  `hourminindex` int(2) NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19900 ;

--
-- 转存表中的数据 `t_l2snr_windspd`
--

INSERT INTO `t_l2snr_windspd` (`sid`, `deviceid`, `sensorid`, `windspeed`, `dataflag`, `reportdate`, `hourminindex`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
(19899, 'HCU_SH_0301', 6, 172, 'N', '2016-03-13', 1235, 0, '\0', 0, '\0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f1sym_account`
--

CREATE TABLE IF NOT EXISTS `t_l3f1sym_account` (
  `uid` char(10) NOT NULL,
  `user` char(20) DEFAULT NULL,
  `nick` char(20) DEFAULT NULL,
  `pwd` char(20) DEFAULT NULL,
  `attribute` char(10) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `regdate` date DEFAULT NULL,
  `city` char(10) DEFAULT NULL,
  `backup` text,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l3f1sym_account`
--

INSERT INTO `t_l3f1sym_account` (`uid`, `user`, `nick`, `pwd`, `attribute`, `phone`, `email`, `regdate`, `city`, `backup`) VALUES
('UID001', 'admin', '爱启用户', 'admin', '管理员', '13912341234', '13912341234@cmcc.com', '2016-05-28', '上海', ''),
('UID002', '李四', '老李', 'li_4', '管理员', '13912341234', '13912341234@cmcc.com', '2016-06-17', '上海', ''),
('UID003', 'user_01', '用户01', 'user01', '管理员', '13912349901', '13912349901@qq.com', '2016-04-01', '上海', NULL),
('UID004', 'user_02', '用户2', 'user02', '用户', '13912349902', '13912349902@qq.com', '2016-05-28', '上海', ''),
('UID005', 'user_03', '用户三', 'user03', '用户', '13912349903', '13912349902@qq.com', '2016-05-28', '上海', '');

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f1sym_authlist`
--

CREATE TABLE IF NOT EXISTS `t_l3f1sym_authlist` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `uid` char(10) NOT NULL,
  `auth_code` char(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- 转存表中的数据 `t_l3f1sym_authlist`
--

INSERT INTO `t_l3f1sym_authlist` (`sid`, `uid`, `auth_code`) VALUES
(1, 'UID001', 'P_0001'),
(2, 'UID001', 'P_0002'),
(3, 'UID003', 'PG_1111'),
(64, 'UID005', 'P_0002'),
(65, 'UID005', 'P_0004'),
(66, 'UID005', 'P_0012'),
(67, 'UID004', 'P_0008'),
(68, 'UID004', 'P_0009'),
(69, 'UID004', 'P_0010'),
(70, 'UID001', 'P_0003'),
(72, 'UID002', 'P_0004'),
(73, 'UID002', 'P_0010'),
(74, 'UID002', 'P_0012');

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f1sym_session`
--

CREATE TABLE IF NOT EXISTS `t_l3f1sym_session` (
  `sessionid` char(8) NOT NULL,
  `uid` char(20) NOT NULL,
  `lastupdate` int(4) NOT NULL,
  PRIMARY KEY (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l3f1sym_session`
--

INSERT INTO `t_l3f1sym_session` (`sessionid`, `uid`, `lastupdate`) VALUES
('5EN3CYEO', 'UID001', 1467384230);

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f1sym_userprofile`
--

CREATE TABLE IF NOT EXISTS `t_l3f1sym_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- 转存表中的数据 `t_l3f1sym_userprofile`
--

INSERT INTO `t_l3f1sym_userprofile` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`) VALUES
(50, 'bxxh2015', 'bxxh2015@sina.cn', '$2y$12$3vo17XiHR8tzfmAsXOK8BeDJsd38ONOSTjbv0C19qbpr2C7IfDggK', '3au2TiBE1NjaP0D0iy9-e9MzFLJ5I7ws', 1442896173, NULL, NULL, '183.193.36.164', 1442896107, 1442896173, 0),
(49, 'linqiu12611', 'linqiu126@sina.cn', '$2y$12$9zRpK4xehj5s/npanxz6O.P1njI5MUsDBB9wskUYJ12cuTWZdrcJq', 'bqjflR9mJOyioXiYhQUGfWjMDPIg-GSJ', 1442894217, NULL, NULL, '183.193.36.164', 1442894194, 1442894217, 0),
(51, 'mfuncloud', 'liuzehong@hotmail.com', '$2y$12$/zjcwitKWqk.hfa.ligqFOtmiHMwProHj.QugIuvYFvFxY7MbY7om', 'k05QvRL9FCgxSv13BcB363dcPOFF2hJA', NULL, NULL, NULL, '101.226.125.122', 1444047832, 1444047832, 0),
(52, 'zjl', 'smdzjl@sina.cn', '$2y$12$pCBD9e0/B0bvwKs6crXA2.pzy606Bn4o19Bzx1r8jdjr1t1nN/jc.', 'GPJwlaHeV0JaMswrLuai0JsW7H8aUjPh', 1444091551, NULL, NULL, '117.135.149.14', 1444091501, 1444091551, 0),
(53, 'shanchuz', 'zsc0905@sina.com', '$2y$12$mlslUwrYelb5nV6DfYot9ORgYGI9YB5.bN/HCMYru6QRn6UrfJsP6', '7VMvRAprvPsYU-Fqt6jDYeLvUzfLzdjF', 1444527288, NULL, NULL, '101.226.125.108', 1444527242, 1444527288, 0);

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f2cm_projgroup`
--

CREATE TABLE IF NOT EXISTS `t_l3f2cm_projgroup` (
  `pg_code` char(20) NOT NULL,
  `pg_name` char(50) DEFAULT NULL,
  `owner` char(20) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `department` char(50) DEFAULT NULL,
  `addr` char(100) DEFAULT NULL,
  `backup` text,
  PRIMARY KEY (`pg_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l3f2cm_projgroup`
--

INSERT INTO `t_l3f2cm_projgroup` (`pg_code`, `pg_name`, `owner`, `phone`, `department`, `addr`, `backup`) VALUES
('PG_1111', '扬尘项目组', '张三', '13912341234', '扬尘项目组单位', '扬尘项目组单位地址', '该项目组管理所有扬尘项目的用户，项目以及相关权限'),
('PG_2222', '污水处理项目组', '李四', '13912349999', '污水项目组单位', '污水项目组单位地址', '该项目组管理所有污水处理项目的用户，项目以及相关权限');

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f2cm_projinfo`
--

CREATE TABLE IF NOT EXISTS `t_l3f2cm_projinfo` (
  `p_code` char(20) NOT NULL,
  `p_name` char(50) NOT NULL,
  `chargeman` char(20) NOT NULL,
  `telephone` char(20) NOT NULL,
  `department` char(30) NOT NULL,
  `address` char(30) NOT NULL,
  `country` char(20) NOT NULL,
  `street` char(20) NOT NULL,
  `square` int(4) NOT NULL,
  `starttime` date NOT NULL,
  `pre_endtime` date NOT NULL,
  `true_endtime` date NOT NULL,
  `stage` text NOT NULL,
  PRIMARY KEY (`p_code`),
  KEY `statCode` (`p_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l3f2cm_projinfo`
--

INSERT INTO `t_l3f2cm_projinfo` (`p_code`, `p_name`, `chargeman`, `telephone`, `department`, `address`, `country`, `street`, `square`, `starttime`, `pre_endtime`, `true_endtime`, `stage`) VALUES
('P_0014', '万宝国际广场', '张三', '13912345678', '上海建筑', '延安西路500号', '长宁区', '', 10000, '2015-04-01', '2016-05-01', '2016-05-31', '项目延期1月'),
('P_0019', '港运大厦', '张三', '13912345678', '', '杨树浦路1963弄24号', '虹口区', '', 0, '2016-04-01', '0000-00-00', '0000-00-00', ''),
('P_0002', '浦东环球金融中心工程', '张三', '13912345678', '浦东建筑', '世纪大道100号', '浦东新区', '', 40000, '2015-01-01', '0000-00-00', '0000-00-00', '项目延期'),
('P_0004', '金桥创科园', '李四', '13912345678', '', '桂桥路255号', '浦东新区', '', 0, '2016-04-01', '0000-00-00', '0000-00-00', ''),
('P_0005', '江湾体育场', '李四', '13912345678', '上海建筑', '国和路346号', '杨浦区', '', 0, '2016-04-13', '0000-00-00', '0000-00-00', ''),
('P_0006', '滨海新村', '李四', '13912345678', '', '同泰北路100号', '宝山区', '', 0, '2016-02-01', '0000-00-00', '0000-00-00', ''),
('P_0007', '银都苑', '李四', '13912345678', '', '银都路3118弄', '闵行区', '', 0, '2016-02-01', '0000-00-00', '0000-00-00', ''),
('P_0008', '万科花园小城', '王五', '13912345678', '', '龙吴路5710号', '闵行区', '', 0, '2016-02-18', '0000-00-00', '0000-00-00', ''),
('P_0009', '合生国际花园', '王五', '13912345678', '', '长兴东路1290', '松江区', '', 0, '2016-02-18', '0000-00-00', '0000-00-00', ''),
('P_0010', '江南国际会议中心', '王五', '13912345678', '', '青浦区Y095(阁游路)', '青浦区', '', 0, '2016-02-18', '0000-00-00', '0000-00-00', ''),
('P_0011', '佳邸别墅', '王五', '13912345678', '', '盈港路1555弄', '青浦区', '', 0, '2016-02-18', '0000-00-00', '0000-00-00', ''),
('P_0012', '西郊河畔家园', '王五', '13912345678', '', '繁兴路469弄', '闵行区', '华漕镇', 0, '2016-02-18', '0000-00-00', '0000-00-00', ''),
('P_0013', '东视大厦', '赵六', '13912345678', '', '东方路2000号', '浦东新区', '南码头', 0, '2016-02-18', '0000-00-00', '0000-00-00', ''),
('P_0001', '曙光大厦', '赵六', '13912345678', '', '普安路189号', '黄埔区', '淮海中路街道', 0, '2016-02-29', '0000-00-00', '0000-00-00', ''),
('P_0015', '上海贝尔', '赵六', '13912345678', '', '西藏北路525号', '闸北区', '芷江西路街道', 0, '2016-03-15', '0000-00-00', '0000-00-00', ''),
('P_0016', '嘉宝大厦', '赵六', '13912345678', '', '洪德路1009号', '嘉定区', '马陆镇', 0, '2015-03-19', '0000-00-00', '0000-00-00', ''),
('P_0017', '金山豪庭', '赵六', '13912345678', '', '卫清东路2988', '金山区', '', 0, '2015-08-25', '0000-00-00', '0000-00-00', ''),
('P_0018', '临港城投大厦', '赵六', '13912345678', '', '环湖西一路333号', '浦东新区', '', 0, '2015-11-30', '0000-00-00', '0000-00-00', ''),
('P_0003', '金鹰大厦', '张三', '13912345678', '上海爱启', '含笑路80号', '浦东新区', '联洋街道', 10000, '2015-04-30', '2016-05-01', '2016-05-31', '项目进行中');

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f2cm_projmapping`
--

CREATE TABLE IF NOT EXISTS `t_l3f2cm_projmapping` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `p_code` char(20) NOT NULL,
  `pg_code` char(20) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `t_l3f2cm_projmapping`
--

INSERT INTO `t_l3f2cm_projmapping` (`sid`, `p_code`, `pg_code`) VALUES
(1, 'P_0001', 'PG_1111'),
(2, 'P_0002', 'PG_2222'),
(5, 'P_0004', 'PG_1111'),
(6, 'P_0006', 'PG_2222'),
(7, 'P_0005', 'PG_1111'),
(8, 'P_0007', 'PG_2222'),
(9, 'P_0008', 'PG_2222'),
(10, 'P_0009', 'PG_1111'),
(11, 'P_0010', 'PG_2222'),
(12, 'P_0003', 'PG_1111'),
(13, 'P_0011', 'PG_1111'),
(14, 'P_0012', 'PG_1111'),
(15, 'P_0013', 'PG_1111'),
(16, 'P_0014', 'PG_1111'),
(17, 'P_0015', 'PG_1111'),
(18, 'P_0018', 'PG_2222'),
(19, 'P_0017', 'PG_2222'),
(20, 'P_0016', 'PG_2222'),
(36, 'P_0015', 'PG_3333'),
(37, 'P_0017', 'PG_3333'),
(38, 'P_0018', 'PG_3333');

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f3dm_siteinfo`
--

CREATE TABLE IF NOT EXISTS `t_l3f3dm_siteinfo` (
  `statcode` char(20) NOT NULL,
  `name` char(50) NOT NULL,
  `devcode` char(20) NOT NULL,
  `p_code` char(20) NOT NULL,
  `starttime` date NOT NULL,
  `altitude` int(4) NOT NULL,
  `flag_la` char(1) NOT NULL,
  `latitude` int(4) NOT NULL,
  `flag_lo` char(1) NOT NULL,
  `longitude` int(4) NOT NULL,
  PRIMARY KEY (`statcode`),
  KEY `statCode` (`statcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `t_l3f3dm_siteinfo`
--

INSERT INTO `t_l3f3dm_siteinfo` (`statcode`, `name`, `devcode`, `p_code`, `starttime`, `altitude`, `flag_la`, `latitude`, `flag_lo`, `longitude`) VALUES
('120101014', '万宝国际广场西监测点', 'HCU_SH_0314', 'P_0014', '0000-00-00', 0, 'N', 31223441, 'E', 121442703),
('120101017', '港运大厦东监测点', 'HCU_SH_0317', 'P_0017', '0000-00-00', 0, 'N', 31255719, 'E', 121517700),
('120101002', '环球金融中心主监测点', 'HCU_SH_0302', 'P_0002', '0000-00-00', 0, 'N', 31240246, 'E', 121514168),
('120101004', '金桥创科园主入口监测点', 'HCU_SH_0304', 'P_0004', '0000-00-00', 0, 'N', 31248271, 'E', 121615476),
('120101005', '江湾体育场一号监测点', 'HCU_SH_0305', 'P_0005', '0000-00-00', 0, 'N', 31313004, 'E', 121525701),
('120101006', '滨海新村西监测点', 'HCU_SH_0306', 'P_0006', '0000-00-00', 0, 'N', 31382624, 'E', 121501387),
('120101008', '八号监测点', 'HCU_SH_0308', 'P_0008', '0000-00-00', 0, 'N', 31101605, 'E', 121404873),
('120101009', '九号监测点', 'HCU_SH_0309', 'P_0009', '0000-00-00', 0, 'N', 31043827, 'E', 121476450),
('120101010', '十号监测点', 'HCU_SH_0310', 'P_0010', '2016-06-08', 0, 'N', 31088973, 'E', 121295459),
('120101011', '十一号监测点', 'HCU_SH_0311', 'P_0011', '0000-00-00', 0, 'N', 31127234, 'E', 121062241),
('120101012', '十二号监测点', 'HCU_SH_0312', 'P_0012', '0000-00-00', 0, 'N', 31164430, 'E', 121102934),
('120101013', '十三号监测点', 'HCU_SH_0313', 'P_0013', '0000-00-00', 0, 'N', 31218057, 'E', 121297076),
('120101001', '曙光大厦主监测点', 'HCU_SH_0301', 'P_0001', '0000-00-00', 0, 'N', 31203650, 'E', 121526288),
('120101015', '十五号监测点', 'HCU_SH_0302', 'P_0015', '0000-00-00', 0, 'N', 31228283, 'E', 121485388),
('120101016', '十六号监测点', 'HCU_SH_0316', 'P_0016', '0000-00-00', 0, 'N', 31256691, 'E', 121475583),
('120101018', '十八号监测点', 'HCU_SH_0318', 'P_0018', '0000-00-00', 0, 'N', 31357885, 'E', 121256060),
('120101019', '十九号监测点', 'HCU_SH_0319', 'P_0019', '0000-00-00', 0, 'N', 30739094, 'E', 121360693),
('120101007', '七号监测点', 'HCU_SH_0307', 'P_0007', '0000-00-00', 0, 'N', 30900796, 'E', 121933166),
('120101003', '爱启工地主监测点', 'HCU_SH_0303', 'P_0003', '2016-06-01', 0, 'N', 31226542, 'E', 121556498);

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f3dm_sitemapping`
--

CREATE TABLE IF NOT EXISTS `t_l3f3dm_sitemapping` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `statcode` char(20) NOT NULL,
  `p_code` char(20) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `t_l3f3dm_sitemapping`
--

INSERT INTO `t_l3f3dm_sitemapping` (`sid`, `statcode`, `p_code`) VALUES
(1, '120101001', 'P_0001'),
(2, '120101002', 'P_0002'),
(3, '120101003', 'P_0003'),
(4, '120101004', 'P_0004'),
(5, '120101005', 'P_0005'),
(6, '120101006', 'P_0006'),
(7, '120101007', 'P_0007'),
(8, '120101008', 'P_0008'),
(9, '120101009', 'P_0009'),
(10, '120101010', 'P_0010'),
(11, '120101011', 'P_0011'),
(12, '120101012', 'P_0012'),
(13, '120101013', 'P_0013'),
(14, '120101014', 'P_0014'),
(15, '120101015', 'P_0015'),
(16, '120101016', 'P_0016'),
(17, '120101017', 'P_0017'),
(18, '120101018', 'P_0018'),
(19, '120101019', 'P_0019');

-- --------------------------------------------------------

--
-- 表的结构 `t_l3f3dm_sum_currentreport`
--

CREATE TABLE IF NOT EXISTS `t_l3f3dm_sum_currentreport` (
  `sid` int(4) NOT NULL AUTO_INCREMENT,
  `deviceid` char(50) NOT NULL,
  `statcode` char(20) NOT NULL,
  `createtime` char(20) NOT NULL,
  `emcvalue` int(4) DEFAULT NULL,
  `pm01` int(4) DEFAULT NULL,
  `pm25` int(4) DEFAULT NULL,
  `pm10` int(4) DEFAULT NULL,
  `noise` int(4) DEFAULT NULL,
  `windspeed` int(4) DEFAULT NULL,
  `winddirection` int(4) DEFAULT NULL,
  `temperature` int(4) DEFAULT NULL,
  `humidity` int(4) DEFAULT NULL,
  `rain` int(4) DEFAULT NULL,
  `airpressure` int(4) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `t_l3f3dm_sum_currentreport`
--

INSERT INTO `t_l3f3dm_sum_currentreport` (`sid`, `deviceid`, `statcode`, `createtime`, `emcvalue`, `pm01`, `pm25`, `pm10`, `noise`, `windspeed`, `winddirection`, `temperature`, `humidity`, `rain`, `airpressure`) VALUES
(2, 'HCU_SH_0301', '120101001', '2016-03-13 20:35:25', 5219, 231, 231, 637, 641, 0, 106, 188, 172, 0, 0),
(15, 'HCU_SH_0302', '120101002', '2016-04-07 22:25:52', 4681, NULL, NULL, NULL, NULL, NULL, NULL, 451, 350, NULL, NULL),
(6, 'HCU_SH_0305', '120101005', '2016-05-10 15:27:44', 4867, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'HCU_SH_0309', '120101009', '2016-06-18 23:30:39', 5151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'HCU_SH_0304', '120101004', '2016-06-16 17:41:00', 4767, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'HCU_SH_0303', '120101003', '2016-06-12 15:29:50', 5620, 136, 136, 237, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
