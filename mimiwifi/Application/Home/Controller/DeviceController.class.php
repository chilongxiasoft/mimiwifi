<?php
// +----------------------------------------------------------------------
// | MIMIWIFI
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.mimiwifi.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: @author a-ze <592358@qq.com>
// +----------------------------------------------------------------------

namespace Home\Controller;

/**
 * 设备管理控制器
 * @author a-ze <592358@qq.com>
 */
class DeviceController extends AdminController {

    /**
     * 设备管理首页
     * @author a-ze <592358@qq.com>
     */
    public function index(){
        $sn       =   I('sn');
        $map['status']  =   array('egt',0);
        $map['sn']  =  array('like', '%'.(string)$sn.'%');
		 $list   = $this->lists('Device', $map);
        int_to_string($list);
		 //var_dump($list);exit;
		 
		 //查看并更新各个路由的状态
		 foreach($list as $v)
		 {
		  //dump($v);exit;
		   //首先计算最近心跳时间距离现在有多久
		   $time = time();
		   $timediff=$time-strtotime($v['last_utime']);
		   $days = intval($timediff/86400);
          $remain = $timediff%86400;
          $hours = intval($remain/3600);
          $remain = $remain%3600;
          $mins = intval($remain/60);
          $secs = $remain%60;
          $res = array("day" => $days,"hour" => $hours,"min" => $mins,"sec" => $secs);
		  
		   //判断上次心跳到现在是否时间超限
		   if(($days=='0')&&($hours=='0')&&((int)$mins<=5))
		   {
		   //没有超过时间上限
		   
		   }
		   else
		   {
		   //超过5分钟时间上限,状态改为掉线
		   $device=M('device');//链接数据库
		   $condition['mac'] = $v['mac'];
		   $data['status'] = '0';//更新设备表的状态
			$device->where($condition)->save($data);
		   }
		 }
		 
		 $list   = $this->lists('Device', $map);//再一次获取所有数据，因为上面的状态可能被更新
        $this->assign('_list', $list);
        $this->meta_title = '设备列表';
        $this->display();
    }
	

    /**
     * 新增设备
     * @author a-ze <592358@qq.com>
     */
    public function add(){
			$this->assign('data',null);
            $this->meta_title = '新增设备';
            $this->display('edit');
        }
    	
	

  /**
     * 编辑设备
     * @author a-ze <592358@qq.com>
     */
    public function edit(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Device')->field(true)->find($id);

        $this->assign('data',$data);
        $this->meta_title = '编辑设备';
        $this->display();
    }

    /**
     * 更新设备
     * @author a-ze <592358@qq.com>
     */
    public function saveDevice(){
        $res = D('Device')->update();
        if(!$res){
            $this->error(D('Device')->getError());
        }else{
            $this->success($res['id']?'更新成功！':'新增成功！');
        }
    }
	
	
   /**
     * 删除设备
     * @author a-ze <592358@qq.com>
     */
    public function delete(){
        $id = array_unique((array)I('id',0));

        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map = array('id' => array('in', $id) );
        if(M('Device')->where($map)->delete()){
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }
}
