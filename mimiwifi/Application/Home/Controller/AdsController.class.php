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
 * 广告管理控制器
 * @author a-ze <592358@qq.com>
 */
class AdsController extends AdminController {

    /**
     * 广告管理首页
     * @author a-ze <592358@qq.com>
     */
    public function index(){
        $sn       =   I('sn');
        $map['status']  =   array('egt',0);
        $map['sn']  =  array('like', '%'.(string)$sn.'%');
		$list   = $this->lists('Ads', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '广告列表';
        $this->display();
    }
	

    /**
     * 新增广告
     * @author a-ze <592358@qq.com>
     */
    public function add(){
			$this->assign('data',null);
            $this->meta_title = '新增广告';
            $this->display('edit');
        }
    	
	

  /**
     * 编辑广告
     * @author a-ze <592358@qq.com>
     */
    public function edit(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Ads')->field(true)->find($id);

        $this->assign('data',$data);
        $this->meta_title = '编辑广告';
        $this->display();
    }

    /**
     * 更新广告
     * @author a-ze <592358@qq.com>
     */
    public function saveAds(){
        $res = D('Ads')->update();
        if(!$res){
            $this->error(D('Ads')->getError());
        }else{
            $this->success($res['id']?'更新成功！':'新增成功！');
        }
    }
	
	
   /**
     * 删除广告
     * @author a-ze <592358@qq.com>
     */
    public function delete(){
        $id = array_unique((array)I('id',0));

        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map = array('id' => array('in', $id) );
        if(M('Ads')->where($map)->delete()){
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }
}
