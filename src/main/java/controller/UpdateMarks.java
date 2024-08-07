package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MarksCardDao;
import dto.MarksCard;

@WebServlet("/updateMarks")
public class UpdateMarks extends HttpServlet
{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int maths = Integer.parseInt(req.getParameter("maths"));
	int science = Integer.parseInt(req.getParameter("science"));
	int english = Integer.parseInt(req.getParameter("english"));
	int kannada = Integer.parseInt(req.getParameter("kannada"));
	int hindi = Integer.parseInt(req.getParameter("hindi"));
	int social = Integer.parseInt(req.getParameter("socialscience"));
	int standard = Integer.parseInt(req.getParameter("std"));
	int id=Integer.parseInt(req.getParameter("id"));
	
	String result = "";
	double percenatge = 0;

	if (maths > 100 || science > 100 || english > 100 || kannada > 100 || hindi > 100 || social > 100) {
		resp.getWriter().print("<h1>Enter Proper Marks</h1>");
		req.getRequestDispatcher("AddMarks.jsp?standard=" + standard).include(req, resp);
	} else {
		percenatge = (maths + english + hindi + kannada + science + social) / 6;
		if(maths < 35 || science < 35 || english < 35 || kannada < 35 || hindi <35  || social < 35)
		{
			result="Fail";
		}
		else {
		
		if (percenatge < 35) {
			result = "Fail";
		} else if (percenatge < 60) {
			result = "Second Class";
		} else if (percenatge < 85) {
			result = "First Class";
		} else {
			result = "Distinction";
		}
		}
		MarksCard card = new MarksCard();
		card.setEnglish(english);
		card.setHindi(hindi);
		card.setKannada(kannada);
		card.setMathematics(maths);
		card.setPercentage(percenatge);
		card.setStandard(standard);
		card.setSocialscience(social);
		card.setScience(science);
		card.setResult(result);
		card.setId(id);
		
		MarksCardDao cardDao=new MarksCardDao();
		cardDao.update(card);
		
		resp.getWriter().print("<h1>Updated Successfully</h1>");
		req.getRequestDispatcher("approve-marks.jsp").include(req, resp);
		
		
	}
}
}
