<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="java.util.List"%>
<%@page import="dao.MarksCardDao"%>
<%@page import="dto.MarksCard"%>
<%@page import="dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MarksCard - Student MarksCard Management</title>
<style>
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	color: #333;
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #f4f4f4;
}

.marks-card {
	background-color: #fff;
	border: 2px solid #333;
	padding: 20px;
	margin-bottom: 20px;
}

.header {
	text-align: center;
	margin-bottom: 20px;
}

.school-name {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.card-title {
	font-size: 20px;
	font-weight: bold;
}

.student-info {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.student-details {
	flex: 1;
}

.student-image {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border: 1px solid #333;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #333;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f0f0f0;
}

.result {
	display: flex;
	justify-content: space-between;
}

.print-button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

.print-button:hover {
	background-color: #45a049;
}

@media print {
	body {
		background-color: #fff;
	}
	.marks-card {
		border: none;
	}
	.print-button {
		display: none;
	}
}
</style>
</head>
<body>
	<%
	Student student = (Student) request.getAttribute("student");
	MarksCard card = (MarksCard) request.getAttribute("card");
	String base64 = Base64.encodeBase64String(student.getPicture());
	%>
	<div class="marks-card">
		<div class="header">
			<div class="school-name">Student MarksCard Management System</div>
			<div class="card-title">
				MarksCard for Class
				<%=card.getStandard()%></div>
		</div>
		<div class="student-info">
			<div class="student-details">
				<p>
					<strong>Name:</strong>
					<%=student.getName()%></p>
				<p>
					<strong>Register Number:</strong>
					<%=student.getRegno()%></p>
			</div>
			<img class="student-image" src="data:image/jpeg;base64,<%=base64%>"
				alt="Student Photo">
		</div>
		<table>
			<tr>
				<th>Subject</th>
				<th>Total Marks</th>
				<th>Marks Obtained</th>
			</tr>
			<tr>
				<td>Kannada</td>
				<td>100</td>
				<td><%=card.getKannada()%></td>
			</tr>
			<tr>
				<td>English</td>
				<td>100</td>
				<td><%=card.getEnglish()%></td>
			</tr>
			<tr>
				<td>Hindi</td>
				<td>100</td>
				<td><%=card.getHindi()%></td>
			</tr>
			<tr>
				<td>Mathematics</td>
				<td>100</td>
				<td><%=card.getMathematics()%></td>
			</tr>
			<tr>
				<td>Science</td>
				<td>100</td>
				<td><%=card.getScience()%></td>
			</tr>
			<tr>
				<td>Social Science</td>
				<td>100</td>
				<td><%=card.getSocialscience()%></td>
			</tr>
		</table>
		<div class="result">
			<p>
				<strong>Percentage:</strong>
				<%=card.getPercentage()%>%
			</p>
			<p>
				<strong>Result:</strong>
				<%=card.getResult()%></p>
		</div>
	</div>
	<button class="print-button" onclick="window.print()">Print /
		Download</button>
	<a href="/servlet-markscard/student-home">
		<button class="print-button">Home</button>
	</a>

</body>
</html>
