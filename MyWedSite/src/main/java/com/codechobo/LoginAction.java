package com.codechobo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginAction")

public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
			}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String id = request.getParameter("id"); // id 넘어옴
		String pwd = request.getParameter("pwd"); // pwd 넘어옴
		String checkbox = request.getParameter("checkbox"); //체크박스에 발생하는 값 
		System.out.println("체크박스 값:"+checkbox);

		if("on".equals(checkbox)) { // 체크박스가 체크되면 쿠키 추가
			Cookie cookie = new Cookie("id",id);
			response.addCookie(cookie);
			
			checkbox = "on";
		}else {				   // 체크박스가 해제되면 쿠키 삭제
			Cookie cookie = new Cookie("id",id);
			cookie.setMaxAge(0); 
			response.addCookie(cookie); 
			checkbox = "null";
		}
	
		String tourl = request.getParameter("tourl"); //이전주소값 저장
		System.out.println("tourl주소:" + tourl);
		
		if (tourl == null || tourl.equals("")) //이전 주소값이 null or "" 일때 tourl을 index 주소로 변경
			tourl = "/commons/Index.jsp";
		
		if(id.equals("asdf") && pwd.equals("1234")) {
			// id 와 pwd가 일치하는 경우 index로 이동 or board로 통해 로그인을 하면 board로 이동
			response.sendRedirect(tourl);
			
			HttpSession session = request.getSession(); // 로그인에 성공하면 세션 얻어오기
			session.setMaxInactiveInterval(30*60); //세션 유지 30분
			session.setAttribute("id",id);//세션 기본 객체에 id 저장

			
		} else { //로그인에 실패하면 로그인창으로 이동
			response.sendRedirect("/commons/LoginForm.jsp");
			
		}
		
	
	}


}
