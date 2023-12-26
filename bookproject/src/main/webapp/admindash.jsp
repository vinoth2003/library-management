<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    <style>
        body {
         
 			background: #ECE9E6;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #FFFFFF, #ECE9E6);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #FFFFFF, #ECE9E6); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        nav {
            background-color: #555;
            overflow: hidden;
        }

        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        

        nav a:hover {
            background-color: #ddd;
            color: black;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 30vh;
        }
        .register {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-button {
            background-color: #4caf50;
            color: #fff;
            padding: 15px 30px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px;
            text-decoration: none;
        }

        .login-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <header>
        <h1>Modern E-Library Management System</h1>
    </header>

    <nav>
        <a href="#">Home</a>
        <a href="#">About</a>
        <a style=float:right; href="home.jsp">Back To Login </a>    
    </nav>
    <div class="register">

    </div>

    <div class="login-container">
        
        <a href="addbook.jsp" class="login-button">Add Book</a>
        <a href="updatebook.jsp" class="login-button">Update Book</a>
        <a href="deletebook.jsp" class="login-button">Delete Book</a>
        <a href="viewrequest.jsp" class="login-button">View Request</a>
        <a href="DashBoard.jsp" class="login-button">DashBoard</a>
    </div>

</body>
</html>
