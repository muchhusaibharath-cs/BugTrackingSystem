
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Bug Tracking System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f8;
            text-align: center;
            margin: 0;
        }
        .login-box {
            background: white;
            width: 350px;
            margin: 80px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        h2 { color: #243b55; }
        input {
            width: 90%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            width: 98%;
            padding: 12px;
            background: #243b55;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        a { color: #243b55; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>User Login</h2>

        <form action="login" method="post">
            <input type="email" name="email"
                   placeholder="Enter Email" required>

            <input type="password" name="password"
                   placeholder="Enter Password" required>

            <button type="submit">Login</button>
        </form>

        <p><a href="index.jsp">Back to Home</a></p>
    </div>
</body>
</html>
