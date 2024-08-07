<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Class Details - Student MarksCard Management</title>
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
        .home-link {
            text-align: center;
            margin-top: 20px;
        }
        .home-link button {
            background-color: #2196F3;
            color: white;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Enter <%= request.getParameter("standard") %> Class Details</h1>
        <form action="saveMarks" method="post">
            <div class="form-group">
                <label for="std">Class:</label>
                <input type="text" id="std" name="std" value="<%= request.getParameter("standard") %>" readonly>
            </div>
            <div class="form-group">
                <label for="maths">Mathematics Marks:</label>
                <input type="number" id="maths" name="maths" required>
            </div>
            <div class="form-group">
                <label for="english">English Marks:</label>
                <input type="number" id="english" name="english" required>
            </div>
            <div class="form-group">
                <label for="science">Science Marks:</label>
                <input type="number" id="science" name="science" required>
            </div>
            <div class="form-group">
                <label for="kannada">Kannada Marks:</label>
                <input type="number" id="kannada" name="kannada" required>
            </div>
            <div class="form-group">
                <label for="hindi">Hindi Marks:</label>
                <input type="number" id="hindi" name="hindi" required>
            </div>
            <div class="form-group">
                <label for="socialscience">Social Science Marks:</label>
                <input type="number" id="socialscience" name="socialscience" required>
            </div>
            <div class="button-group">
                <button type="reset">Cancel</button>
                <button type="submit">Save</button>
            </div>
        </form>
        <div class="home-link">
            <a href="/servlet-markscard/student-home"><button type="button">Home</button></a>
        </div>
    </div>
</body>
</html>
