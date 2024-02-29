<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
 <%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../css/LoginForm.css">
</head>
<body>
		
<form method="post" action="/LoginAction" id="login-form" class="login-form" autocomplete="off" role="main">
  <h1 class="a11y-hidden">Login Form</h1>
  <div>
    <label class="label-id">
      <input  value = "${cookie.id.value}"  type="text"  class="text" name="id" placeholder="id" tabindex="1" required/>
      
      <span class="required" >id</span>
    </label>
  </div>
  <input type="checkbox" name="checkbox" ${empty cookie.id.value?"":"checked"} class="show-password a11y-hidden" id="show-password" tabindex="3" />
  <label class="label-show-password" for="show-password">
    <span>Remember Id</span>
  </label>
  <div>
    <label class="label-password">
      <input type="password" class="text" name="pwd" placeholder="Password" tabindex="2" required />
      <span class="required">Password</span>
    </label>
    
        <label class="label-url">
      <input type="hidden" name="tourl" value="${param.tourl}"  />
    </label>
    
  </div>
  <input type="submit" value="Log In" />
  <div class="email">
    <a href="#">Forgot password?</a>
  </div>
  <figure aria-hidden="true">
    <div class="person-body"></div>
    <div class="neck skin"></div>
    <div class="head skin">
      <div class="eyes"></div>
      <div class="mouth"></div>
    </div>
    <div class="hair"></div>
    <div class="ears"></div>
    <div class="shirt-1"></div>
    <div class="shirt-2"></div>
  </figure>

</form>
</body>
<script>

</script>
</html>