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
 * 统计管理控制器
 * @author a-ze <592358@qq.com>
 */
class ReportController extends AdminController {

    /**
     * 统计管理首页
     * @author a-ze <592358@qq.com>
     */
    public function index(){
        $sn       =   I('sn');
        $map['status']  =   array('egt',0);
        $map['sn']  =  array('like', '%'.(string)$sn.'%');
		$list   = $this->lists('Report', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '统计列表';
        $this->display();
    }
	

    /**
     * 新增统计
     * @author a-ze <592358@qq.com>
     */
    public function add(){
			$this->assign('data',null);
            $this->meta_title = '新增统计';
            $this->display('edit');
        }
    	
	

  /**
     * 编辑统计
     * @author a-ze <592358@qq.com>
     */
    public function edit(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Report')->field(true)->find($id);

        $this->assign('data',$data);
        $this->meta_title = '编辑统计';
        $this->display();
    }

    /**
     * 更新统计
     * @author a-ze <592358@qq.com>
     */
    public function saveReport(){
        $res = D('Report')->update();
        if(!$res){
            $this->error(D('Report')->getError());
        }else{
            $this->success($res['id']?'更新成功！':'新增成功！');
        }
    }
	
	
   /**
     * 删除统计
     * @author a-ze <592358@qq.com>
     */
    public function delete(){
        $id = array_unique((array)I('id',0));

        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map = array('id' => array('in', $id) );
        if(M('Report')->where($map)->delete()){
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }
}
