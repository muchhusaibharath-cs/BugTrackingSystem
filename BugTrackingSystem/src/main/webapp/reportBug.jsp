
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
    <title>Report a Bug</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f4f8;
        }

        .form-box {
            background: white;
            width: 420px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        h2 {
            text-align: center;
            color: #243b55;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #243b55;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background: #141e30;
        }

        .error {
            color: red;
            font-size: 13px;
        }
    </style>

    <script>
        function validateForm() {
            const title = document.forms["bugForm"]["bugTitle"].value.trim();
            const description = document.forms["bugForm"]["description"].value.trim();
            const priority = document.forms["bugForm"]["priority"].value;

            if (title.length < 3) {
                alert("Bug title must contain at least 3 characters.");
                return false;
            }

            if (description.length < 10) {
                alert("Description must contain at least 10 characters.");
                return false;
            }

            if (priority === "") {
                alert("Please select a priority.");
                return false;
            }

            return true;
        }
    </script>
</head>

<body>

<div class="form-box">
    <h2>Report a Bug</h2>

    <% if ("1".equals(request.getParameter("success"))) { %>
        <p style="color:green;text-align:center;">
            Bug reported successfully!
        </p>
    <% } %>

    <% if ("1".equals(request.getParameter("error"))) { %>
        <p style="color:red;text-align:center;">
            Please enter valid bug details and select a priority.
        </p>
    <% } %>

    <form name="bugForm"
          action="reportBug"
          method="post"
          onsubmit="return validateForm()">

        <input type="text"
               name="bugTitle"
               placeholder="Enter Bug Title"
               minlength="3"
               maxlength="100"
               required>

        <textarea name="description"
                  placeholder="Describe the Bug"
                  rows="5"
                  minlength="10"
                  maxlength="1000"
                  required></textarea>

        <select name="priority" required>
            <option value="">Select Priority</option>
            <option value="Low">Low</option>
            <option value="Medium">Medium</option>
            <option value="High">High</option>
        </select>

        <button type="submit">Submit Bug</button>
    </form>

    <p style="text-align:center">
        <a href="dashboard.jsp">Back to Dashboard</a>
    </p>
</div>

</body>
</html>
