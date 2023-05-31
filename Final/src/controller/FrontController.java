package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);

		if (commandStr.equals("/index.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
		} else if (commandStr.equals("/Login.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/LogIn/LoginForm.jsp").forward(req, resp);
		} else if (commandStr.equals("/register.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/LogIn/register.jsp").forward(req, resp);
		} else if (commandStr.equals("/Logout.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/LogIn/Logout.jsp").forward(req, resp);
		} else if (commandStr.equals("/findID.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/LogIn/find_id.jsp").forward(req, resp);
		} else if (commandStr.equals("/findPW.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/LogIn/find_pw.jsp").forward(req, resp);
		} else if (commandStr.equals("/about.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/CompanyIntro/about.jsp").forward(req, resp);
		} else if (commandStr.equals("/year.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/CompanyIntro/year.jsp").forward(req, resp);
		} else if (commandStr.equals("/op.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/CompanyIntro/op.jsp").forward(req, resp);
		} else if (commandStr.equals("/howtocome.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/CompanyIntro/howtocome.jsp").forward(req, resp);
		} else if (commandStr.equals("/detail.do")) {
			req.setAttribute("uri", uri);
			req.setAttribute("commandStr", commandStr);
			req.getRequestDispatcher("/Detail/detail.jsp").forward(req, resp);
		}
	}
}
