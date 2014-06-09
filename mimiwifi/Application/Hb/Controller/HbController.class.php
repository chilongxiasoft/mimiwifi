<?php
namespace Hb\Controller;
use Think\Controller;
use Home\Model;

class HbController extends IndexController {
	
	/**
	 * 心跳包
 	 *	
	 */
	public function index() {

	
		$file = fopen("log.html", "a+");
		$str = date('Y-m-d H:i:s',time()).'  IP:'.get_client_ip()."<br />\r\n";		
		fwrite($file, $str);
		fclose($file);	
	}
	

}