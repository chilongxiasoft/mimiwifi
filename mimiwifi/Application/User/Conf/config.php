<?php
// +----------------------------------------------------------------------
// | MIMIWIFI
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.mimiwifi.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: @author a-ze <592358@qq.com>
// +----------------------------------------------------------------------

/**
 * UCenter客户端配置文件
 * 注意：该配置文件请使用常量方式定义
 */

define('UC_APP_ID', 1); //应用ID
define('UC_API_TYPE', 'Model'); //可选值 Model / Service
define('UC_AUTH_KEY', '!93`.FSh?Izu6NHo~r405J&]VBwAfsj{}>x+pOEa'); //加密KEY
define('UC_DB_DSN', 'mysqli://root:zz13659239977@127.0.0.1:3306/mimiyun'); // 数据库连接，使用Model方式调用API必须配置此项
define('UC_TABLE_PREFIX', 'mimi_yun_'); // 数据表前缀，使用Model方式调用API必须配置此项
