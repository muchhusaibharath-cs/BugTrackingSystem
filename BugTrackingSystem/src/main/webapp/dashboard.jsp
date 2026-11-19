
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Bug Tracking System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f8;
            margin: 0;
        }
        header {
            background: #243b55;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            background: white;
            width: 70%;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
        }
        .menu a {
            display: inline-block;
            background: #243b55;
            color: white;
            padding: 13px 25px;
            margin: 10px;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <header>
        <h1>BUG TRACKING SYSTEM</h1>
    </header>

    <div class="container">
        <h2>Welcome, <%= session.getAttribute("userName") %>!</h2>

        <p>You have successfully logged in.</p>

        <div class="menu">
            <a href="reportBug.jsp">Report a Bug</a>
            <a href="viewBugs">View Bugs</a>
            <a href="logout">Logout</a>
        </div>
    </div>
</body>
</html>
