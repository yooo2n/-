package com.codechobo;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@WebFilter("/commons/Board.jsp")
public class LoginCheckFilter extends HttpFilter implements Filter {
       @Override
       public void init(FilterConfig Config) throws ServletException {
       }

   	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
   		HttpServletRequest httpRequest = (HttpServletRequest) request;
   		HttpSession session = httpRequest.getSession(false);
   		
   		boolean login = false;
   		if(session != null) {
   			if (session.getAttribute("id") != null) {
   				login = true;
   			}
   		}
   		
   		if (login) {
   			chain.doFilter(request, response);
   		} else if (login = true){
   			RequestDispatcher dispatcher = request
   					.getRequestDispatcher("/commons/LoginForm.jsp");
   			dispatcher.forward(request, response);
   		} else if (login = false) {
   			RequestDispatcher dispatcher = request
   					.getRequestDispatcher("/commons/Index.jsp");
   			dispatcher.forward(request, response);
   		}
   	}

   	@Override
   	public void destroy() {
   		
   	}
}
