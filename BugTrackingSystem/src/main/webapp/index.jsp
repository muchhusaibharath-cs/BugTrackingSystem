
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bug Tracking System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f8;
            text-align: center;
            margin: 0;
        }
        .header {
            background: #243b55;
            color: white;
            padding: 25px;
        }
        .container {
            background: white;
            width: 65%;
            margin: 60px auto;
            padding: 40px;
            border-radius: 10px;
        }
        h1 { color: #243b55; }
        p { color: #555; font-size: 17px; }
        a {
            display: inline-block;
            background: #243b55;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
        }
        a:hover { background: #141e30; }
    </style>
</head>
<body>
    <div class="header">
        <h1>BUG TRACKING SYSTEM</h1>
        <p>Manage and track software bugs easily</p>
    </div>

    <div class="container">
        <h1>Welcome!</h1>
        <p>Welcome to the Bug Tracking System.</p>
        <p>Report, manage and monitor software issues in one place.</p>
        <a href="login.jsp">Get Started</a>
    </div>
</body>
</html>
