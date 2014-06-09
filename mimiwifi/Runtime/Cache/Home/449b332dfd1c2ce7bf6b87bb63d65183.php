<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <title><?php echo ($meta_title); ?> - MIMI云 - MIMI商用智能路由器云管理平台</title>
	<link href="/favicon.ico" mce_href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="/Public/default/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!--[if lt IE 9]>
      <link rel="stylesheet" type="text/css" href="/Public/default/plugins/jquery-ui/jquery.ui.1.10.2.ie.css"/>
    <![endif]-->
    <link href="/Public/default/assets/css/main.css" rel="stylesheet" type="text/css" />
    <link href="/Public/default/assets/css/plugins.css" rel="stylesheet" type="text/css" />
    <link href="/Public/default/assets/css/responsive.css" rel="stylesheet" type="text/css"
    />
    <link href="/Public/default/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Public/default/assets/css/fontawesome/font-awesome.min.css">
    <!--[if IE 7]>
      <link rel="stylesheet" href="/Public/default/assets/css/fontawesome/font-awesome-ie7.min.css">
    <![endif]-->
    <!--[if IE 8]>
      <link href="/Public/default/assets/css/ie8.css" rel="stylesheet" type="text/css" />
    <![endif]-->
    <script type="text/javascript" src="/Public/default/assets/js/libs/jquery-1.10.2.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/bootstrap/js/bootstrap.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/assets/js/libs/lodash.compat.min.js">
    </script>
    <!--[if lt IE 9]>
      <script src="/Public/default/assets/js/libs/html5shiv.js">
      </script>
    <![endif]-->
    <script type="text/javascript" src="/Public/default/plugins/touchpunch/jquery.ui.touch-punch.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/event.swipe/jquery.event.move.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/event.swipe/jquery.event.swipe.js">
    </script>
    <script type="text/javascript" src="/Public/default/assets/js/libs/breakpoints.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/respond/respond.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/cookie/jquery.cookie.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/slimscroll/jquery.slimscroll.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/slimscroll/jquery.slimscroll.horizontal.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/sparkline/jquery.sparkline.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/daterangepicker/moment.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/daterangepicker/daterangepicker.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/blockui/jquery.blockUI.min.js">
    </script>
	<script type="text/javascript" src="/Public/default/plugins/uniform/jquery.uniform.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/select2/select2.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/validation/jquery.validate.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/validation/additional-methods.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/noty/jquery.noty.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/noty/layouts/top.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/noty/themes/default.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/datatables/jquery.dataTables.min.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/datatables/DT_bootstrap.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/datatables/responsive/datatables.responsive.js">
	</script>
	<script type="text/javascript" src="/Public/default/plugins/nprogress/nprogress.js">
    </script>
    <script type="text/javascript" src="/Public/default/plugins/bootbox/bootbox.min.js">
    </script>
	<script type="text/javascript" src="/Public/defaultplugins/bootstrap-multiselect/bootstrap-multiselect.min.js">
    </script>
	<script type="text/javascript" src="/Public/default/plugins/bootstrap-switch/bootstrap-switch.min.js">
    </script>
	<script type="text/javascript" src="/Public/default/plugins/globalize/globalize.js">
    </script>
	<script type="text/javascript" src="/Public/default/plugins/globalize/cultures/globalize.culture.de-DE.js">
    </script>
	<script type="text/javascript" src="/Public/default/plugins/globalize/cultures/globalize.culture.ja-JP.js">
    </script>
    <script type="text/javascript" src="/Public/default/assets/js/app.js">
    </script>
    <script type="text/javascript" src="/Public/default/assets/js/plugins.js">
    </script>
    <script type="text/javascript" src="/Public/default/assets/js/plugins.form-components.js">
    </script>
    <script>
      $(document).ready(function() {
        App.init();
        Plugins.init();
        FormComponents.init()
      });
    </script>
    <script type="text/javascript" src="/Public/default/assets/js/custom.js">
    </script>
    <script type="text/javascript" src="/Public/default/assets/js/demo/form_wizard.js">
    </script>
	<script type="text/javascript" src="/Public/default/assets/js/demo/form_components.js">
    </script>
	<script type="text/javascript" src="/Public/default/assets/js/demo/pages_calendar.js">
    </script>
    <script type="text/javascript" src="/Public/default/assets/js/demo/charts/chart_filled_blue.js">
    </script>
    <script type="text/javascript" src="/Public/default/assets/js/demo/charts/chart_simple.js">
    </script>
	<script type="text/javascript" src="/Public/default/assets/js/demo/ui_general.js">
    </script>
	
  </head>
  
  <body>
    <header class="header navbar navbar-fixed-top" role="banner">
      <div class="container">
        <ul class="nav navbar-nav">
          <li class="nav-toggle">
            <a href="javascript:void(0);" title="">
              <i class="icon-reorder">
              </i>
            </a>
          </li>
        </ul>
        <a class="navbar-brand" href="<?php echo U('/');?>">
          <img src="/Public/default/assets/img/logo.png" alt="logo" />　
        </a>
        <a href="#" class="toggle-sidebar bs-tooltip" data-placement="bottom"
        data-original-title="点击这里，打开/关闭边栏">
          <i class="icon-reorder"></i>
        </a>
        <ul class="nav navbar-nav navbar-left hidden-xs hidden-sm">
			<?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (u($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown user">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="icon-male">
              </i>
              <span class="username">
                <?php echo session('user_auth.username');?>
              </span>
              <i class="icon-caret-down small">
              </i>
            </a>
            <ul class="dropdown-menu">
              <li>
                <a href="<?php echo U('User/updatePassword');?>">
                  <i class="icon-tasks">
                  </i>
                  修改密码
                </a>
              </li>
              <li class="divider">
              </li>
			  <li>
                <a href="<?php echo U('User/updateNickname');?>">
                  <i class="icon-tasks">
                  </i>
                  修改昵称
                </a>
              </li>
              <li class="divider">
              </li>
              <li>
                <a href="<?php echo U('Public/logout');?>">
                  <i class="icon-key">
                  </i>
                  退出
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </header>
    <div id="container">
      <div id="sidebar" class="sidebar-fixed">
	  
        <div id="sidebar-content">
			<ul id="nav">
                <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i; if(!empty($sub_menu)): if(!empty($key)): ?><li <?php if(($thisgourp['group']) == $key): ?>class="current open"<?php endif; ?> >
								<a href="javascript:void(0);"><i class="<?php switch($key): case "云路由管理": ?>icon-cloud<?php break;?>
										<?php case "广告管理": ?>icon-rss<?php break;?>
										<?php case "统计报告": ?>icon-bar-chart<?php break;?>
										<?php case "财务中心": ?>icon-usd<?php break;?>
										<?php case "用户中心": ?>icon-user<?php break;?>
										<?php case "系统设置": ?>icon-cogs<?php break;?>
										<?php default: ?>icon-dashboard<?php endswitch;?> "></i><?php echo ($key); ?></a><?php endif; ?>
								
                            <ul class="sub-menu"><?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li><a href="<?php echo (u($menu["url"])); ?>"><i class="icon-angle-right"></i><?php echo ($menu["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
							</ul>
							</li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
			</ul>
        </div>
		
        <div id="divider" class="resizeable">
        </div>
      </div>
      <div id="content">
        <div class="container">
          <div class="crumbs">
            <ul id="breadcrumbs" class="breadcrumb">
              <li>
                <i class="icon-home">
                </i>
                <a href="<?php echo U('/');?>">
                  控制台
                </a>
              </li>
              <li class="current">
                <a class="#" href="#" title="">
                  <?php echo ($meta_title); ?>
                </a>
              </li>
            </ul>
          </div>
   
	  
  <div class="page-header">
    <div class="page-title">
      <h3><?php echo ($meta_title); ?></h3>
    </div>
  </div>
  
    <div class="row">
    <div class="col-md-12">
      <div class="widget box">
        <div class="widget-content no-padding">
          <div class="row">
            <div class="dataTables_header clearfix">
              <div class="col-md-6">
			  <a class="btn ajax-get" url="<?php echo U('clear');?>">清 空</a> 
			  <a class="btn ajax-post " target-form="ids" url="<?php echo U('remove');?>">删 除</a>
			  </div>
              <div class="col-md-6">
              </div>
            </div>
          </div>
	<!-- 数据列表 -->
	<table class="table table-striped table-bordered table-hover table-checkable">
		<thead>
        <tr>
		<th class="checkbox-column"><input class="uniform" type="checkbox"/></th>
		<th class="">编号</th>
		<th class="">行为名称</th>
		<th class="">执行者</th>
		<th class="">执行时间</th>
		<th class="">操作</th>
		</tr>
    </thead>
    <tbody>
		<?php if(!empty($_list)): if(is_array($_list)): $i = 0; $__LIST__ = $_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
            <td class="checkbox-column"><input class="uniform ids" type="checkbox" name="ids[]" value="<?php echo ($vo["id"]); ?>" /></td>
			<td><?php echo ($vo["id"]); ?> </td>
			<td><?php echo get_action($vo['action_id'],'title');?></td>
			<td><?php echo get_nickname($vo['user_id']);?></td>
			<td><span><?php echo (time_format($vo["create_time"])); ?></span></td>
			<td>
				<i class="icon-search "></i> <a href="<?php echo U('Action/edit?id='.$vo['id']);?>">详细</a>
				<i class="icon-trash"></i> <a class="confirm ajax-get" href="<?php echo U('Action/remove?ids='.$vo['id']);?>">删除</a>
             </td>
		</tr><?php endforeach; endif; else: echo "" ;endif; ?>
		<?php else: ?>
		<td colspan="6" class="text-center"> aOh! 暂时还没有内容! </td><?php endif; ?>
	</tbody>
    </table>
          <div class="row">
            <div class="dataTables_footer clearfix"> <?php echo ($_page); ?> </div>
          </div>
        </div>
      </div>
    </div>
  </div>


	   </div>    
      </div>
	 </div>
    <script type="text/javascript" src="/Public/Home/js/common.js"></script>
	 
  </body>
 <div style="display:none"><script src="http://s22.cnzz.com/z_stat.php?id=1000362120&web_id=1000362120" language="JavaScript"></script></div> 
</html>