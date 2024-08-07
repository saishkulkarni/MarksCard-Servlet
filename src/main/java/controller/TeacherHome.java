package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/teacher-home")
public class TeacherHome extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("teacher") == null) {
			resp.getWriter().print("<h1>Invalid Session</h1>");
			req.getRequestDispatcher("login.html").include(req, resp);
		} else {
			req.getRequestDispatcher("teacher-home.html").forward(req, resp);
		}
	}
}
