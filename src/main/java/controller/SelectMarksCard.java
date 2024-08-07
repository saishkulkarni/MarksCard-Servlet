package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MarksCard;
import dto.Student;

@WebServlet("/select-markscard")
public class SelectMarksCard extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getSession().getAttribute("student") == null) {
			resp.getWriter().print("<h1>Invalid Session</h1>");
			req.getRequestDispatcher("login.html").include(req, resp);
		} else {
			Student student = (Student) req.getSession().getAttribute("student");
			List<MarksCard> list = student.getCards();
			
			boolean flag=true;
			for(MarksCard card:list) {
				if(card.isStatus()) {
					flag=false;
					break;
				}
			}
			
			if (list == null || list.isEmpty() || flag) {
				resp.getWriter().print("<h1>No Marks Cards Found</h1>");
				req.getRequestDispatcher("student-home.html").include(req, resp);
			} else {
				req.setAttribute("list", list);
				req.getRequestDispatcher("select-marks-card.jsp").forward(req, resp);
			}
		}
	}
}
