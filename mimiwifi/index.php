<?php
// +----------------------------------------------------------------------
// | MIMIWIFI
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.mimiwifi.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: a-ze <592358@qq.com>
// +----------------------------------------------------------------------

if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

/**
 * 系统调试设置
 * 项目正式部署后请设置为false
 */
define ( 'APP_DEBUG', true );

/**
 * 应用目录设置
 * 安全期间，建议安装调试完成后移动到非WEB目录
 */
define ( 'APP_PATH', './Application/' );

/**
 * 缓存目录设置
 * 此目录必须可写，建议移动到非WEB目录
 */
define ( 'RUNTIME_PATH', './Runtime/' );

define('BIND_MODULE', 'Home'); // 绑定Home模块到当前入口文件
define('BIND_CONTROLLER','Index'); // 绑定Index控制器到当前入口文件


/**
 * 引入核心入口
 * ThinkPHP亦可移动到WEB以外的目录
 */
require './ThinkPHP/ThinkPHP.php';