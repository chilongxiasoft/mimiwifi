<?php
// +----------------------------------------------------------------------
// | MIMIWIFI
// +----------------------------------------------------------------------
// | Copyright (c) 2014 http://www.mimiwifi.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: @author a-ze <592358@qq.com>
// +----------------------------------------------------------------------

namespace Home\Controller;
use User\Api\UserApi as UserApi;

/**
 * 后台首页控制器
 * @author a-ze <592358@qq.com>
 */
class IndexController extends AdminController {

    /**
     * 后台首页
     * @author a-ze <592358@qq.com>
     */
    public function index(){
        if(UID){
            $this->redirect('Device/index');
        } else {
            $this->redirect('Public/login');
        }
    }

}
