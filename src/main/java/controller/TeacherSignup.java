package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDao;
import dao.TeacherDao;
import dto.Teacher;

@WebServlet("/teacher-signup")
public class TeacherSignup extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TeacherDao dao = new TeacherDao();
		StudentDao dao2=new StudentDao();
		String email = req.getParameter("email");
		long mobile=Long.parseLong(req.getParameter("mob"));
		if (dao.find(email) == null && dao.find(mobile)==null && dao2.find(email) == null && dao2.find(mobile)==null) {
			Teacher teacher = new Teacher();
			teacher.setName(req.getParameter("name"));
			teacher.setMobile(mobile);
			teacher.setEmail(email);
			teacher.setPassword(req.getParameter("password"));
			teacher.setSubject(req.getParameter("subject"));

			dao.save(teacher);

			Teacher teacher2 = dao.find(teacher.getEmail());
			int empid = teacher2.getEmpid();

			resp.getWriter().print("<h1>Account Created Succesfully and your Employee Id is : " + empid + "</h1>");
			req.getRequestDispatcher("login.html").include(req, resp);
		} else {
			resp.getWriter().print("<h1>Account Already Exists Check and try again</h1>");
			req.getRequestDispatcher("teacher-signup.html").include(req, resp);
		}
	}
}
