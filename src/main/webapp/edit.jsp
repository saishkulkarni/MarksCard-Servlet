<%@page import="dto.MarksCard"%>
<%@page import="dao.MarksCardDao"%>
<%@page import="dto.Student"%>
<%@page import="dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Marks - Student MarksCard Management</title>
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
        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }
        h1 {
            color: #4CAF50;
            margin-bottom: 30px;
            font-size: 24px;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        input[readonly] {
            background-color: #f0f0f0;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
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
        button[type="reset"] {
            background-color: #f44336;
            color: white;
        }
        button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <%
    int regno = Integer.parseInt(request.getParameter("reg"));
    StudentDao dao = new StudentDao();
    Student student = dao.find(regno);

    int id = Integer.parseInt(request.getParameter("id"));
    MarksCardDao cardDao = new MarksCardDao();
    MarksCard card = cardDao.find(id);
    %>
    <div class="form-container">
        <h1>Enter Updated Details</h1>
        <form action="updateMarks" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= student.getName() %>" readonly>
            </div>
            <div class="form-group">
                <label for="reg">Register Number:</label>
                <input type="text" id="reg" name="reg" value="<%= student.getRegno() %>" readonly>
            </div>
            <div class="form-group">
                <label for="id">Marks Id:</label>
                <input type="text" id="id" name="id" value="<%= card.getId() %>" readonly>
            </div>
            <div class="form-group">
                <label for="std">Class:</label>
                <input type="text" id="std" name="std" value="<%= card.getStandard() %>" readonly>
            </div>
            <div class="form-group">
                <label for="maths">Mathematics Marks:</label>
                <input type="number" id="maths" name="maths" value="<%= card.getMathematics() %>" required>
            </div>
            <div class="form-group">
                <label for="english">English:</label>
                <input type="number" id="english" name="english" value="<%= card.getEnglish() %>" required>
            </div>
            <div class="form-group">
                <label for="science">Science:</label>
                <input type="number" id="science" name="science" value="<%= card.getScience() %>" required>
            </div>
            <div class="form-group">
                <label for="kannada">Kannada:</label>
                <input type="number" id="kannada" name="kannada" value="<%= card.getKannada() %>" required>
            </div>
            <div class="form-group">
                <label for="hindi">Hindi:</label>
                <input type="number" id="hindi" name="hindi" value="<%= card.getHindi() %>" required>
            </div>
            <div class="form-group">
                <label for="socialscience">Social Science:</label>
                <input type="number" id="socialscience" name="socialscience" value="<%= card.getSocialscience() %>" required>
            </div>
            <div class="button-group">
                <button type="reset">Cancel</button>
                <button type="submit">Update</button>
            </div>
        </form>
    </div>
</body>
</html>
