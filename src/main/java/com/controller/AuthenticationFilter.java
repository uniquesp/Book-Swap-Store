
package com.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "/AuthenticationFilter", urlPatterns = { "*" }, asyncSupported = true)
public class AuthenticationFilter implements Filter {

   private static final List<String> notallowedwithoutLogin = Arrays.asList(new String[] {"/User-Wishlist.jsp","/User-Cart.jsp","/User-Orders-History.jsp","/User-Sell-Request.jsp","/Sell-Book.jsp","/User-Orders-History.jsp","/User-CartDetails.jsp"});
   private static final List<String> notallowedwithoutLoginAdmin = Arrays.asList(new String[] {"/Admin.Dashboard.jsp","/Admin-Header.jsp","/Admin-Footer.jsp","/Admin-Sidebar.jsp","/User-Details.jsp","/Book-Details.jsp","/Book-Add.jsp","/Category-Details.jsp","/SubCategory-Details.jsp","/Admin-Sell-Request.jsp","/Admin-Orders-Detais.jsp"});
   private static final List<String> allowedPrefix = Arrays.asList(new String[] {".css",".js",".jpg",".jpeg",".png",".svg",".min.js",".ttf",".woff2",".woff",".eot"});

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
	//	HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		/*
		 * if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".jpeg") ||
		 * uri.endsWith(".jpg") || uri.endsWith(".png") || uri.endsWith(".svg") ||
		 * uri.endsWith(".min.js") || uri.endsWith(".ttf") || uri.endsWith(".woff2") ||
		 * uri.endsWith(".woff") || uri.endsWith(".eot")) { chain.doFilter(request,
		 * response); return; }
		 */
		for (String prefix : allowedPrefix) {
		    if (uri.endsWith(prefix)) {
		        chain.doFilter(request, response);
		        return;
		    }
		}
		HttpSession session = req.getSession(false);

		if (session != null && session.getAttribute("userId") == null && notallowedwithoutLogin.contains(req.getServletPath())) {
			RequestDispatcher rd = req.getRequestDispatcher("User-Login.jsp");
			rd.forward(request, response);
			return;
		}
		if (session != null && session.getAttribute("admin_id") == null && notallowedwithoutLoginAdmin.contains(req.getServletPath())) {
			RequestDispatcher rd = req.getRequestDispatcher("Admin-Login.jsp");
			rd.forward(request, response);
			return;
		}
		
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}
}
