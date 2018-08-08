<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>课时管理系统登陆</title>
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
  <!-- iCheck -->
  <link rel="stylesheet" href="/SSM/static/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="/SSM/static/index2.html"><b>课时管理系统</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg" style="color:red;" id="meg">&nbsp;&nbsp;&nbsp;</p>

    <form id="form" action="/SSM/login" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" name="sId" placeholder="学生号">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" name="sPasswd" placeholder="密码">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row form-group">
        <div class="col-xs-8">
          <input type="text" name="verification" class="form-control" placeholder="验证码">
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <img class="form-control" alt="看不清楚，点击获取" id="vir" style="padding: 0px;" src="/SSM/captcha/getCaptchaImage" />
        	
        <!-- 
        	function () {
        		alert("hhh");
				//生成验证码
			   	$("#vir").attr('src','./captcha/getCaptchaImage.do?'+Math.floor(Math.random()*100) );
			 }
         -->
        </div>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> 记住我
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button id="submit" type="submit" class="btn btn-primary btn-block btn-flat">登&nbsp;陆</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn  btn-social  btn-flat" style="padding-left:15px;"><i class="fa fa-qq"></i>&nbsp;</a>
      <a href="#" class="btn  btn-social  btn-flat" style="padding-left:15px;"><i class="fa fa-weixin"></i>&nbsp;</a>
    </div>
    <!-- /.social-auth-links -->
    <a href="#" class="pull-left">忘记密码</a>
    <a href="/SSM/register" class="pull-right">注册用户</a><br />
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="/SSM/static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/SSM/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/SSM/static/plugins/iCheck/icheck.min.js"></script>
<script>
	$("#submit").click(function(check){
		
		var verify = $("input[name='verification']").val();
		if(verify.length==5){//判断
			//equality 相等
			var iseq = verify == '<%=session.getAttribute("capText")%>';
			//alert(iseq);
			if(!iseq){
				$("#vir").attr('src','./captcha/getCaptchaImage.do?'+Math.floor(Math.random()*100) );
				$("#meg").text("验证码输入错误");
				$("input[name='verification']").val("")
				check.preventDefault();
			}
		} else{
			$("#meg").text("请输入验证码");
			$("#vir").attr('src','./captcha/getCaptchaImage.do?'+Math.floor(Math.random()*100) );
			//$("#from").submit(false);//阻止提交
			check.preventDefault();//阻止提交
		}
	});
	
	//输入框判断
	$("input[name='sId']").blur(function(){
		var input = $("input[name='sId']").val();
		  if(isNaN(input)){
			  if(input.length > 8){
				  //成功不显示任何东西
			  }else{
				  $("#meg").text("id号最少为8位");
			  }
		  }else{
			  $("#meg").text("id必须为数字");
		  }
		  
	});
	
</script>

<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
  
	$('#vir').click(function(){
		$("#vir").attr('src','./captcha/getCaptchaImage.do?'+Math.floor(Math.random()*100) );
	});
</script>
</body>
</html>

    