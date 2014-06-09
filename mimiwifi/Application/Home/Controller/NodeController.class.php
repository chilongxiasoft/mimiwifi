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
 * 应用点管理控制器
 * @author a-ze <592358@qq.com>
 */
class NodeController extends AdminController {

    /**
     * 应用点管理首页
     * @author a-ze <592358@qq.com>
     */
    public function index(){
		$pid  = I('get.pid',0);
        if($pid){
            $data = M('Menu')->where("id={$pid}")->field(true)->find();
            $this->assign('data',$data);
        }
        $sn       =   I('sn');
        $map['status']  =   array('egt',0);
        $map['sn']  =  array('like', '%'.(string)$sn.'%');
		$list   = $this->lists('Node', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '应用点列表';
        $this->display();

  /*       $pid  = I('get.pid',0);
        if($pid){
            $data = M('Menu')->where("id={$pid}")->field(true)->find();
            $this->assign('data',$data);
        }
        $title      =   trim(I('get.title'));
        $type       =   C('CONFIG_GROUP_LIST');
        $all_menu   =   M('Menu')->getField('id,title');
        $map['pid'] =   $pid;
        if($title)
            $map['title'] = array('like',"%{$title}%");
        $list       =   M("Menu")->where($map)->field(true)->order('sort asc,id asc')->select();
        int_to_string($list,array('hide'=>array(1=>'是',0=>'否'),'is_dev'=>array(1=>'是',0=>'否')));
        if($list) {
            foreach($list as &$key){
                if($key['pid']){
                    $key['up_title'] = $all_menu[$key['pid']];
                }
            }
            $this->assign('list',$list);
        }
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->meta_title = '应用点列表';
        $this->display();
		
		
		 */
    }
	

    /**
     * 新增应用点
     * @author a-ze <592358@qq.com>
     */
    public function add(){
			$this->assign('data',null);
            $this->meta_title = '新增应用点';
            $this->display('edit');
        }
    	
	

  /**
     * 编辑应用点
     * @author a-ze <592358@qq.com>
     */
    public function edit(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Node')->field(true)->find($id);

        $this->assign('data',$data);
        $this->meta_title = '编辑应用点';
        $this->display();
    }

    /**
     * 更新应用点
     * @author a-ze <592358@qq.com>
     */
    public function saveNode(){
        $res = D('Node')->update();
        if(!$res){
            $this->error(D('Node')->getError());
        }else{
            $this->success($res['id']?'更新成功！':'新增成功！');
        }
    }
	
	
   /**
     * 删除应用点
     * @author a-ze <592358@qq.com>
     */
    public function delete(){
        $id = array_unique((array)I('id',0));

        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map = array('id' => array('in', $id) );
        if(M('Node')->where($map)->delete()){
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }
}
