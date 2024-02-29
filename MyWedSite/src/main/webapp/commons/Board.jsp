<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page session = "false" %>
    
<!DOCTYPE html>


		<%
		HttpSession session = request.getSession(); //세션 생성
		String id = (String)session.getAttribute("id"); //세션객체에 저장된 아이디값 저장
		
			if (session.getAttribute("id") != null) { //로그인 됐는지 확인후 board 페이지로 이동
				System.out.println("로그인여부:" + session.getAttribute("id")); 
			}else {//로그인 안됐으면 다시 로그인폼으로 이동
				response.sendRedirect("/commons/LoginForm.jsp?tourl="+request.getRequestURI());
				System.out.println("로그인여부:" + session.getAttribute("id"));
				return;
			}
			
		%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8" >
<title>Board</title>
<link rel="stylesheet" type="text/css" href="../css/Index.css">
<link rel="shortcut icon" type="image/x-icon" href="https://image.ibb.co/fOur3b/favicon.png"/>
<meta name="theme-color" content="#1885ed">
</head>

<body>

<form method="post" action="/boardAction" >
<header class="header">
  <div class="container header__container">
<div class="header__logo"><img class="header__img" src="https://image.ibb.co/kcVou6/path3000.png"> <h1 class="header__title">Bricks<span class="header__light">.io</span></h1></div> 
     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
  
  <div class="header__menu">
    <nav id="navbar" class="header__nav collapse">
      <ul class="header__elenco">
        <li class="header__el"><a href="/commons/Index.jsp" class="header__link">Home</a></li>
        <li class="header__el"><a href="#" class="header__link">Pricing</a></li>
        <li class="header__el"><a href="#" class="header__link">Success stories</a></li>
        <li class="header__el"><a href="/commons/Board.jsp" class="header__link">Board</a></li>
        <li class="header__el"><a href="#" class="header__link">Contact us</a></li>
        <li class="header__el header__el--blue" onclick = "" >
         <c:if test="${!empty id}">
        <a href="/commons/Logout.jsp" class="btn btn--white" >logout</a>
        </c:if></li>
      </ul>
    </nav>
  </div>
    </div>
</header>

<div class="sect sect--padding-top">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
    <div class="site">
      <h1 class="site__title">Board</h1>
      <h2 class="site__subtitle">Board</h2>
      <div class="site__box-link">
        <a class="btn btn--width" href="">Pricing</a>
        <a class="btn btn--revert btn--width" href="">Contact</a>
      </div>
      <img class="site__img" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MDhfMTEg%2FMDAxNjUyMDE4NzEwMTA5.7vGEevt37Diyt2fEWJZRjWX67iqTqBbBBE14vzBZ9i4g.vhNUre5khPv9ymU9nIRMsQ36SajdOKm_1HhBwQdOyyEg.JPEG.morningind%2F2022050511060300-02CB906EA538A35643C1E1484C4B947D.jpg&type=sc960_832">
    </div>
    </div>
    </div>
  </div>
</div>
</form>
</body>
<script type="text/javascript" src="../js/Index.js"></script>
</html>