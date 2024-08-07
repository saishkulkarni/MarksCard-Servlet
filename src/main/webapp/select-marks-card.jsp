<%@page import="dto.MarksCard"%>
<%@page import="java.util.List"%>
<%@page import="dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Select MarksCard - Student MarksCard Management</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	padding: 20px;
}

.container {
	background-color: #ffffff;
	padding: 40px;
	border-radius: 5px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
	text-align: center;
}

h1 {
	color: #4CAF50;
	margin-bottom: 30px;
	font-size: 24px;
}

form {
	display: flex;
	flex-direction: column;
	align-items: center;
}

select {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
}

button {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button[type="submit"] {
	background-color: #4CAF50;
	color: white;
}

.home-button {
	background-color: #2196F3;
	color: white;
	text-decoration: none;
	display: inline-block;
	margin-top: 20px;
}

button:hover {
	opacity: 0.8;
}

.message {
	color: #f44336;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%
	List<MarksCard> list = (List<MarksCard>) request.getAttribute("list");
	%>
	<div class="container">
		<h1>Select MarksCard</h1>
		<form action="/servlet-markscard/view-markscard" method="post">
			<select name="std">
				<%
				for (MarksCard card : list) {
					if (card.isStatus()) {
				%>
				<option value="<%=card.getStandard()%>">Class
					<%=card.getStandard()%></option>
				<%
				}
				}
				%>
			</select>
			<button type="submit">View MarksCard</button>
		</form>
		<a href="/servlet-markscard/student-home" class="home-button">Home</a>
	</div>
</body>
</html>
