<%@page import="dto.MarksCard"%>
<%@page import="dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Class - Student MarksCard Management</title>
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
    if (session.getAttribute("student") == null) {
    %>
        <div class="container">
            <h1 class="message">Session Expired. Please Login Again</h1>
            <a href="/servlet-markscard/login" class="home-button">Login</a>
        </div>
    <%
    } else {
        Student student = (Student) session.getAttribute("student");
        int std = student.getStandard();
        boolean flag1 = true;
        boolean flag2 = false;
        boolean flag3 = false;

        if (std > 8) flag2 = true;
        if (std > 9) flag3 = true;

        for (MarksCard card : student.getCards()) {
            if (card.getStandard() == 8) flag1 = false;
            if (card.getStandard() == 9) flag2 = false;
            if (card.getStandard() == 10) flag3 = false;
        }

        if (flag1 || flag2 || flag3) {
    %>
        <div class="container">
            <h1>Select Class to Add Marks</h1>
            <form action="add-marks.jsp">
                <select name="standard">
                    <% if (flag1) { %><option value="8">8</option><% } %>
                    <% if (flag2) { %><option value="9">9</option><% } %>
                    <% if (flag3) { %><option value="10">10</option><% } %>
                </select>
                <button type="submit">Submit</button>
            </form>
            <a href="/servlet-markscard/student-home" class="home-button">Home</a>
        </div>
    <%
        } else {
    %>
        <div class="container">
            <h1 class="message">Marks are Already Up to Date</h1>
            <a href="/servlet-markscard/student-home" class="home-button">Home</a>
        </div>
    <%
        }
    }
    %>
</body>
</html>
