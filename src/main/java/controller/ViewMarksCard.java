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

@WebServlet("/view-markscard")
public class ViewMarksCard extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Student student = (Student) req.getSession().getAttribute("student");
		if (student != null) {
			int std = Integer.parseInt(req.getParameter("std"));
			MarksCard card = null;
			List<MarksCard> list = student.getCards();
			for (MarksCard card2 : list) {
				if (card2.getStandard() == std) {
					card = card2;
					break;
				}
			}
			req.setAttribute("student", student);
			req.setAttribute("card", card);
			req.getRequestDispatcher("marks-card.jsp").forward(req, resp);
		} else {
			resp.getWriter().print("<h1>Invalid Session</h1>");
			req.getRequestDispatcher("login.html").include(req, resp);
		}
	}
}
