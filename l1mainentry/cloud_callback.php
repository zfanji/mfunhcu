<?php
/*
    方倍工作室原创，ZJL修改
*/
include_once "../l1comvm/vmlayer.php";
include_once "../l2sdk/l2sdk_wechat.class.php";
//header("Content-type:text/html;charset=utf-8");

// 主程序MAIN()
$wx_options = array(
    'token'=>WX_TOKEN, //填写你设定的key
    'encodingaeskey'=>WX_ENCODINGAESKEY, //填写加密用的EncodingAESKey，如接口为明文模式可忽略
    'appid'=>WX_APPID,
    'appsecret'=>WX_APPSECRET, //填写高级调用功能的密钥
    'debug'=> WX_DEBUG,
    'logcallback' => WX_LOGCALLBACK
);

$wxObj = new class_wechat_sdk($wx_options);

//$wxObj->responseMsg();

if (isset($_GET['echostr'])) {
    $wxObj->valid_sdk01();
}
else{
    $wxObj->responseMsg();
}
