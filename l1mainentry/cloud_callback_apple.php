<?php
/**
 * Created by PhpStorm.
 * User: jianlinz
 * Date: 2016/7/5
 * Time: 15:02
 */
include_once "../l1comvm/vmlayer.php";

// 主程序MAIN()
$obj = new classTaskL1vmCoreRouter();
$obj->mfun_l1vm_task_main_entry(MFUN_MAIN_ENTRY_APPLE, NULL, NULL, $GLOBALS["HTTP_RAW_POST_DATA"]);

?>

