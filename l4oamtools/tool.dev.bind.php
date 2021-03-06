<?php
/**
 * Created by PhpStorm.
 * User: jianlinz
 * Date: 2015/7/1
 * Time: 19:52
 */
/*
 * 本工具用于管理员在后台强制绑定用户与设备

 *
**/
include_once "../l1comvm/vmlayer.php";
include_once "../l2sdk/task_l2sdk_wechat.class.php";
header("Content-type:text/html;charset=utf-8");
//如果运行在本地，以下地址存放二维码图片
static $imagePath = "D:/work/image/";

$wx_options = array(
    'token'=>MFUN_WX_TOKEN, //填写你设定的key
    'encodingaeskey'=>MFUN_WX_ENCODINGAESKEY, //填写加密用的EncodingAESKey，如接口为明文模式可忽略
    'appid'=>MFUN_WX_APPID,
    'appsecret'=>MFUN_WX_APPSECRET, //填写高级调用功能的密钥
    'debug'=> MFUN_WX_DEBUG,
    'logcallback' => MFUN_WX_LOGCALLBACK
);
$wxObj0 = new classTaskL2sdkWechat($wx_options);

if (isset($_POST["deviceid"])){
    $deviceid = trim($_POST["deviceid"]);
    $devicetype = substr($deviceid, 0, 15);}
else{
    $deviceid = "";
    $devicetype = "";
}
if (isset($_POST["openid"])) $openid = trim($_POST["openid"]); else  $openid = "";
if (isset($_POST["mac"])) $mac = trim($_POST["mac"]); else  $mac = "";
if (isset($_POST["qrcode"])) $qrcode = trim($_POST["qrcode"]); else  $qrcode = "";

//$deviceid = $_POST["deviceid"];
//$devicetype = substr($deviceid, 0, 15);
//$openid = $_POST["openid"];
//$mac = $_POST["mac"];
//$qrcode = $_POST["qrcode"];
echo "Input Device ID = " . $deviceid ."<br>";
echo "Input Qrcode = " . $qrcode ."<br>";
echo "Input Device Type = " . $devicetype ."<br>";
echo "Input Device MAC = " . $mac ."<br>";
echo "Input User ID = " . $openid ."<br>";

//Step1:刷新Token
echo "<br><H2>微信硬件工作环境即将开始......<br></H2>";
$wxObj = new classTaskL2sdkIotWx(MFUN_WX_APPID, MFUN_WX_APPSECRET);
//实验Token是否已经被刷新
echo "<br>Step1：测试最新刷新的Token=<br>"."$wxObj->access_token"."<br>";


// Step2 设备用户绑定状态查询
echo "<br>Step2：设备和用户后台数据库绑定： <br>";
$wxDbObj = new classDbiL2sdkWechat();
$result = $wxDbObj->dbi_blebound_duplicate($openid, $deviceid, $openid, $devicetype);
if ($result == false)
{
    $result = $wxDbObj->dbi_blebound_save($openid, $deviceid, $openid, $devicetype);
    echo "后台数据库绑定该设备和用户："."Result=".json_encode($result)."<br>";
}
else
    echo "该设备和用户在数据库中已经存在，Duplicated, no action <br>";

//Step3 设备MAC地址绑定状态查询
echo "<br>Step3：设备和MAC地址后台数据库绑定： <br>";
$result = $wxDbObj->dbi_deviceqrcode_save($deviceid, $qrcode, $devicetype, $mac);
echo "后台数据库绑定该设备和指定MAC地址："."Result=".json_encode($result)."<br>";

//Step4 微信云绑定状态查询
$wxObj->device_AuthBLE($deviceid, $mac);
$result = $wxObj->compel_bind($deviceid, $openid);
echo "<br>Step4：微信云强制绑定设备结果  <br>";
var_dump($result);

//end of tool_main();
?>