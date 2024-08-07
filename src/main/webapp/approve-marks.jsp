<%@page import="dto.MarksCard"%>
<%@page import="dto.Student"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Approve Marks - Student MarksCard Management</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	padding: 20px;
}

.container {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	overflow-x: auto;
}

h1 {
	color: #4CAF50;
	margin-bottom: 20px;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

.btn {
	padding: 8px 12px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s;
}

.btn-change {
	background-color: #2196F3;
	color: white;
}

.btn-edit {
	background-color: #FFC107;
	color: black;
}

.btn-home {
	background-color: #4CAF50;
	color: white;
	display: inline-block;
	text-decoration: none;
	margin-top: 20px;
}

.btn:hover {
	opacity: 0.8;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Approve Marks</h1>
		<%
		StudentDao dao = new StudentDao();
		List<Student> list = dao.fetchAll();
		%>
		<table>
			<tr>
				<th>Register Number</th>
				<th>Name</th>
				<th>Standard</th>
				<th>Mathematics</th>
				<th>Science</th>
				<th>Kannada</th>
				<th>Hindi</th>
				<th>English</th>
				<th>Social Science</th>
				<th>Percentage</th>
				<th>Result</th>
				<th>Status</th>
				<th>Change Status</th>
				<th>Edit</th>
			</tr>
			<%
			for (Student student : list) {
				List<MarksCard> list1 = student.getCards();
				for (MarksCard card : list1) {
			%>
			<tr>
				<td><%=student.getRegno()%></td>
				<td><%=student.getName()%></td>
				<td><%=card.getStandard()%></td>
				<td><%=card.getMathematics()%></td>
				<td><%=card.getScience()%></td>
				<td><%=card.getKannada()%></td>
				<td><%=card.getHindi()%></td>
				<td><%=card.getEnglish()%></td>
				<td><%=card.getSocialscience()%></td>
				<td><%=card.getPercentage()%></td>
				<td><%=card.getResult()%></td>
				<td>
					<%
					if (card.isStatus()) {
					%> Approved <%
					} else {
					%> Not Approved <%
					}
					%>
				</td>
				<td><a href="change-status?id=<%=card.getId()%>"><button
							class="btn btn-change">Change Status</button></a></td>
				<td><a
					href="edit.jsp?reg=<%=student.getRegno()%>&id=<%=card.getId()%>"><button
							class="btn btn-edit">Edit</button></a></td>
			</tr>
			<%
			}
			}
			%>
		</table>
		<a href="/servlet-markscard/teacher-home" class="btn btn-home">Home</a>
	</div>
</body>
</html>
