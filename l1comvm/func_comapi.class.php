<?php
/**
 * Created by PhpStorm.
 * User: jianlinz
 * Date: 2016/6/20
 * Time: 12:06
 */

class classApiL1vmFuncCom
{

    //日志记录
    public function logger($project,$fromUser,$createTime,$log_content)
    {
        /*
        if(isset($_SERVER['HTTP_APPNAME'])){   //SAE
            sae_set_display_errors(false);
            sae_debug($log_content);
            sae_set_display_errors(true);
        }else if($_SERVER['REMOTE_ADDR'] != "127.0.0.1"){ //LOCAL
            $max_size = 10000;
            $log_filename = "log.xml";
            if(file_exists($log_filename) and (abs(filesize($log_filename)) > $max_size)){unlink($log_filename);}
            file_put_contents($log_filename, date('H:i:s')." ".$log_content."\r\n", FILE_APPEND);
        }
        */
        //存储log在数据库中
        $cDbObj = new classDbiL1vmCommon();
        $result = $cDbObj->dbi_log_process($project,$fromUser,$createTime,$log_content);

        return $result;
    }

}


?>