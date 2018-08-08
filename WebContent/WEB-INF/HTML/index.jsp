<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%@ page language="java" import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <c:if test="${empty student}">
  	<meta http-equiv="refresh" content="2;url=login">
  </c:if>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>课时管理系统</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="/SSM/static/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/SSM/static/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="/SSM/static/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/SSM/static/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="/SSM/static/dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="/SSM/static/bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="/SSM/static/bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="/SSM/static/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/SSM/static/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="/SSM/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  
  
	<link type="text/css" rel="stylesheet" href="/SSM/static/jedate/test/jeDate-test.css">
	<link type="text/css" rel="stylesheet" href="/SSM/static/jedate/skin/jedate.css">
	<script type="text/javascript" src="/SSM/static/jedate/src/jedate.js"></script>
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="/SSM/static/https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="/SSM/static/https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>课时管理系统</b>LTE</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          
          <!-- Tasks: style can be found in dropdown.less -->
          <%-- <c:if test="${not empty student }">
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span>登陆</span>
            </a>
          </li>
          </c:if>
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span>注册</span>
            </a>
          </li> --%>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="/SSM/static/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="/SSM/static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <button href="#" class="btn btn-default btn-flat" data-toggle="modal" data-target="#modification">修改密码</button>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat" data-toggle="modal" data-target="#logout">退出登陆</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="modal" data-target="#logout" ><!-- data-toggle="control-sidebar" --><span>注销</span></a>
          </li>
        </ul>
      </div>
    </nav>
    
  </header>
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/SSM/static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${student.sName}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">我的首页</li>
        <li class="active treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span></span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="index.html"><i class="fa fa-circle-o"></i> 课登列表</a></li>
            <li><a href="index2.html"><i class="fa fa-circle-o"></i> 时间分类</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>我的消息</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">4</span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        	首页
        <small>课堂列表</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!--
      	作者：offline
      	时间：2018-08-02
      	描述：主题
      -->
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="navbar-custom-menu box-header">
        			<ul class="nav navbar-nav">
              	<li class="tasks-menu">
              	<%
              	String  simpleDateFormat = new SimpleDateFormat("YYYY-MM").format(new Date());
              	%>
              	<input type="text" class="jeinput" style="float: left;" id="searchtime" placeholder="<c:if test="${empty search }"><%=simpleDateFormat%></c:if><c:if test="${ not empty search }">${search }</c:if>" class="form-control" />
              	</li>
              	<li class="tasks-menu">&nbsp;&nbsp;
              		<button onclick="search()" id="search" class="btn btn-default "><span class="fa fa-search">&nbsp;</span>搜索</button>
              	</li>
              	<li class="tasks-menu">&nbsp;&nbsp;
              		<button class="btn btn-primary" onclick="add()" data-toggle="modal" data-target="#add">
              		<span class="fa fa-plus">&nbsp;</span>新增</button>
              	</li>
              	<li class="tasks-menu">&nbsp;&nbsp;
              		<button onclick="deleteData()" class="btn btn-primary"><span class="fa fa-minus">&nbsp;</span>删除</button>
              	</li>
              	<li class="tasks-menu">&nbsp;&nbsp;
              		<button onclick="modification()" class="btn btn-primary"><span class="fa fa-edit">&nbsp;</span>修改</button>
              	</li>
              	<li class="tasks-menu">&nbsp;&nbsp;
              		<button onclick="dowload()" id="dowload" class="btn btn-primary"><span class="fa fa-arrow-down">&nbsp;</span>下载</button>
              	</li>
              </ul>
            </div>
            <!-- /.box-header -->
            <div class="box-body"><!-- id="example2" -->
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th><input id="total" type="checkbox"/></th>
                  <th>日期</th>
                  <th>星期</th>
                  <th>起止日期</th>
                  <th>班级</th>
                  <th>授课地点</th>
                  <th>课堂内容</th>
                  <th>课时折算</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach  items="${list}" var="item"> 
               
                <tr>
                  <td><input class="status" type="checkbox"/><input type="hidden" value="${ item.id }"></td>
                  <td>
                  	<fmt:formatDate value="${item.date }" type="both" pattern="d"/>
                  </td>
                  <td> <fmt:formatDate value="${item.week }" type="both" pattern="EEEE"/></td>
                  <td>
                  	<fmt:formatDate value="${item.createdate }" type="both" pattern="YYYY-MM-dd"/>
                  	-
                  	<fmt:formatDate value="${item.createdate }" type="both" pattern="YYYY-MM-dd"/>
                  </td>
                  <td>${item.classtype }</td>
                  <td>${item.address }</td>
                  <td>${item.classcontent }</td>
                  <td>${item.classconversion }</td>
                </tr>
                 </c:forEach>
                </tbody>
              </table>
              <!-- 
              
              <ul class="pagination pull-right" style="margin-right: 60px;">
			    <li class="disabled"><a href="#">首页</a></li>
			    <li><a href="#">上一页</a></li>
			    <li><a class="bg-teal-gradient" href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			    <li><a href="#">4</a></li>
			    <li><a href="#">5</a></li>
			    <li><a href="#">下一页</a></li>
			    <li><a href="#">末页</a></li>
			</ul> -->
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          
          <div class="modal fade" id="logout">
			    <div class="modal-dialog">
			      <div class="modal-content">
			   
			        <!-- 模态框头部 -->
			        <div class="modal-header">
			          <h4 class="modal-title box-title text-center">确定要退出？</h4>
			        </div>
			   
			        <!-- 模态框底部 -->
			        <div class="modal-footer">
			        
			          
			          <a href="/SSM/logout" class="btn btn-secondary" data-dismiss="modal">确定</a>
			          <button type="button" class="btn btn-secondary" data-dismiss="modal">返回</button>
			        </div>
			   		
			      </div>
			    </div>
			</div>		
          
			<div class="modal fade" id="add">
			    <div class="modal-dialog">
			      <div class="modal-content">
			   
			        <!-- 模态框头部 -->
			        <div class="modal-header">
			          <h4 class="modal-title box-title text-center">添加课堂列表</h4>
			        </div>
			   
			        <!-- 模态框主体 -->
			        <div class="modal-body">
			          模态框内容..
			        </div>
			   
			        <!-- 模态框底部 -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-secondary" data-dismiss="modal">提交</button>
			          <button type="button" class="btn btn-secondary pull-left" data-dismiss="modal">退出</button>
			        </div>
			   
			      </div>
			    </div>
			</div>		
			<!-- 修改密码 -->		
			 <!-- 模态框 -->
    <form action="/SSM/modification" method="post">
		 <div class="modal modal-info fade" id="modification" >
		  <div class="modal-dialog">
		    <div class="modal-content" style="width: 80%; margin: auto;">
		      <div class="modal-header">
		        	修改密码
		      </div>
		      <div class="modal-body">
		        <div class="form-group has-feedback" style="width: 60%; margin: 10px auto;">
			        	用户名：${student.sName}
			      </div>
			      <div class="form-group has-feedback" style="width: 60%; margin:10px auto;">
			        <input type="password" class="form-control" placeholder="旧密码" name="oldPwd">
			      </div>
			      <div class="form-group has-feedback" style="width: 60%; margin:10px auto;">
			        <input type="password" class="form-control" placeholder="新密码" name="newPwd">
			      </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">取消</button>
		        <button type="submit" class="btn btn-outline">确认修改</button>
		      </div>
		    </div>
		    <!-- .modal-content -->
		  </div>
		  <!-- .modal-dialog -->
		</div>
	</form>

        </div>
        <!-- /.col -->
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-user bg-yellow"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>

                <p>New phone +1(800)555-1234</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-envelope-o bg-light-blue"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>

                <p>nora@example.com</p>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <i class="menu-icon fa fa-file-code-o bg-green"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>

                <p>Execution time 5 seconds</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="label label-danger pull-right">70%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Update Resume
                <span class="label label-success pull-right">95%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-success" style="width: 95%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Laravel Integration
                <span class="label label-warning pull-right">50%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-warning" style="width: 50%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)">
              <h4 class="control-sidebar-subheading">
                Back End Framework
                <span class="label label-primary pull-right">68%</span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-primary" style="width: 68%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Allow mail redirect
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Other sets of options are available
            </p>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Expose author name in posts
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Allow the user to show his name in blog posts
            </p>
          </div>
          <!-- /.form-group -->

          <h3 class="control-sidebar-heading">Chat Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>
          <!-- /.form-group -->

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="/SSM/static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/SSM/static/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="/SSM/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="/SSM/static/bower_components/raphael/raphael.min.js"></script>
<script src="/SSM/static/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="/SSM/static/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="/SSM/static/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/SSM/static/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="/SSM/static/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/SSM/static/bower_components/moment/min/moment.min.js"></script>
<script src="/SSM/static/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="/SSM/static/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="/SSM/static/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="/SSM/static/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/SSM/static/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/SSM/static/dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/SSM/static/dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/SSM/static/dist/js/demo.js"></script>


<!-- DataTables -->
<script src="/SSM/static/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/SSM/static/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>



<script type="text/javascript">


//删除数据
function deleteData(){
	var list = new Array();
	
	 $(".status").each(function(){
		 
		if($(this).prop("checked") == true){
			var id = $(this).next().val();
			list.push(id);
		}
	});
	 if(list.length < 1){
		 alert("至少选择一条删除数据");
	 }else{
		 window.location.href="/SSM/delete?id="+list.toString();
	 }
	 
}
//全选择
$("#total").click(function(){
	
	if($(this).prop("checked") == true){
		
		$(".status").each(function(){
			
			$(this).prop("checked",true);
		});
	}
	if($(this).prop("checked") == false){
		$(".status").each(function(){
			
			$(this).prop("checked",false);
		});
	}
	
});

//查找方法
function search(){
	 $("#search").click(function(){
		var data = $("#searchtime").val();
		window.location.href="/SSM/search?search="+data;
		 
	 });
}
//添加方法
function add(){
	window.location.href="/SSM/add";
}
//修改方法
function modification(){
	var list = new Array();
	var data = null;
	 $(".status").each(function(){
		 
		if($(this).prop("checked") == true){
			data = $(this).parent();
			var id = $(this).next().val();
			list.push(id);
		}
	});
	//获取需要修改的数据
	 
	 if(list.length == 1){
		var listdata = new Array();
		 data.nextAll().each(function(){
			listdata.push($(this).html().replace(/\s/g,""));
		 });
		 listdata.push(list[0]); //添加修改de
		 //alert(list[0]) //提示修改了第多少条数据
		window.location.href="/SSM/amend?data="+listdata.toString();
		 
	 }else{
		 alert("只能选择一条数据修改");
	 }
	
}

function dowload(){
	$("#dowload").click(function(){
		window.location.href="/SSM/export";
	});
}
</script>

<script>
	var enLang = {                            
        name  : "en",
        month : ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
        weeks : [ "SUN","MON","TUR","WED","THU","FRI","SAT" ],
        times : ["Hour","Minute","Second"],
        timetxt: ["Time","Start Time","End Time"],
        backtxt:"Back",
        clear : "Clear",
        today : "Now",
        yes   : "Confirm",
        close : "Close"
  }
	//时间控件
	jeDate("#searchtime",{
        //onClose:false,
        format: "YYYY-MM"
	 });
	
	$("#checked").onclick(function(){
		var num = $("#checked").lenght;
		alert(num);
	});
	 $(function () {
		    $('#example2').DataTable({
		      'paging'      : true,
		      'lengthChange': false,
		      'searching'   : false,
		      'ordering'    : true,
		      'info'        : true,
		      'autoWidth'   : false
		    });
		  });
	 
</script>

</body>
</html>
