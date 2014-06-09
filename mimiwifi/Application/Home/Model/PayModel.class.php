<?php
// +----------------------------------------------------------------------
// | MIMIWIFI
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.mimiwifi.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: @author a-ze <592358@qq.com>
// +----------------------------------------------------------------------

namespace Home\Model;
use Think\Model;
/**
 * 设备管理模型
 * @author a-ze <592358@qq.com>
 */
class DeviceModel extends Model{
    
    public function lists($status = 1, $order = 'id DESC', $field = true){
        $map = array('status' => $status);
        return $this->field($field)->where($map)->order($order)->select();
    }

	
    /**
     * 新增或更新一个设备
     * @return boolean fasle 失败 ， int  成功 返回完整的数据
     * @author @author a-ze <592358@qq.com>
     */
    public function update(){
        /* 获取数据对象 */
        $data = $this->create($_POST);
        if(empty($data)){
            return false;
        }

        /* 添加或新增设备 */
        if(empty($data['id'])){ //新增数据
            $id = $this->add(); //添加设备
            if(!$id){
                $this->error = '新增设备出错！';
                return false;
            }
        } else { //更新数据
            $status = $this->save(); //更新基础内容
            if(false === $status){
                $this->error = '更新设备出错！';
                return false;
            }
        }

        //内容添加或更新完成
        return $data;

    }	
	


}
