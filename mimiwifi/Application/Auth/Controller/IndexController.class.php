<?php
namespace Auth\Controller;
use Think\Controller;
use Home\Model;

class IndexController extends Controller {
	
	/**
	 * 改地址是微信平台所有者配置的地址，里面包含他们的id，改方法查询id，然后找到对应的设备的登陆ip返回一个页面，用户点击登陆就可以登陆系统了
 	 *	
	 */
	public function index() {
		
			// 查询id是否合法
			$data = M('Device')->field('gw_ip,gw_port')->find($gwmac);	
				$this->display();

	}
	
	/**
	 *获取token
	 */ 
	public function token() {
		$token_time = time();
		$token_livetime = 180;
		$slat_string = "test";
		$token = md5(intval($token_time/$token_livetime) . $slat_string);
		$this->ajaxReturn($token);
	}
	
	public function login() {
		$this->show('login');
	}
}