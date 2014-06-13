<?php
namespace Hb\Controller;
use Think\Controller;
use Home\Model;

class IndexController extends Controller {
	
	/**
	 * 心跳包
 	 *	
	 */
	public function hb() {
		
	if ($_SERVER['REQUEST_METHOD'] == 'GET')
	{
	//路由访问的地址：http://hb.example.com/hb.php?mac=xx:xx:xx:xx:xx:xx 
	//MAC为路由物理地址，用于辨别是否是自家的路由器
	    if($_GET["mac"]!=NULL)
		{
		   //dump('123');exit;
		   $mac=$_GET["mac"];
		   
		   @mysql_connect("localhost","root")//连接本地数据库
		   or die("数据库连接失败！");
		   @mysql_select_db("mimiyun")//选择mimiyun数据库
		   or die("数据库选择失败！");
		   
		   //dump("select * from mimi_yun_device where mac=".$mac."");exit;
		   
		   $query = mysql_query("select * from mimi_yun_device where mac='".$mac."'")
		   or die("执行SQL语句失败！");//查询数据库对比看是否是自家路由
		
		   $result = mysql_fetch_array($query);
		   if(empty($result))//返回为空，则拒绝访问
		   {
		     echo 'wrong address';
		   }
		   else//不为空则返回JSON字符串，即心跳包的参数
		   {
		    echo '{"interval":"3", "posturl":"'. 'http://' . $_SERVER['SERVER_NAME'] . $_SERVER['SCRIPT_NAME'] . '"}' ."\r\n";
		   
		   }
	
		}

	}else if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	

		$data = file_get_contents("php://input");
		$obj = json_decode($data, true);
		
		$hb=M('hb');//链接数据库
		$device=M('device');//链接数据库
		
		$map['gwmac']  = $obj['gwmac'];
		$map['gwaddr'] = $obj['gwaddr'];
		$map['usrnum'] = $obj['usrnum'];
		
		$condition['gwmac'] = $obj['gwmac'];
		$consult = $hb->where($condition)->find();//查找到相应的DEVICE，看其中的status状态
		//var_dump($consult);exit;
		if(empty($consult))//为空，说明这个POST过来的DEVICE MAC地址有问题，不处理
		{
		
		}
		else
		{
		  if($consult['device_status']=='0')//如果收到心跳包的时候还是状态为0，则状态变为1
		  {
		    $map['device_status'] = '1';
		  }
		}
		
		//var_dump($map);exit;
		$lastId = $hb->add($map);//添加到数据库
		//var_dump($lastId);exit;
		
		$file = fopen("log.html", "a+");		
		fwrite($file, "gwmac: $obj[gwmac] gwaddr:  $obj[gwaddr] gwport:  $obj[gwport]  usrnum: $obj[usrnum] gwwanaddr: $obj[gwwanaddr] gwlanaddr: $obj[gwlanaddr] <br>\r\n");

		if ($obj[usrnum])	
		{
			fwrite($file, "{<br>\r\n");
			foreach ($obj[datas] as $data)
			{
				fwrite($file, "type $data[type] mac $data[mac] start $data[start] used $data[used] end $data[end]<br>\r\n");	
			}
			fwrite($file, "}<br>\r\n");
		}
		fclose($file);	
		
	  }
	}
	
	public function test(){
	
	    
	}
	

}