
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Bugs - Bug Tracking System</title>

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
            width: 90%;
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: #243b55;
            color: white;
        }

        a {
            color: #243b55;
            text-decoration: none;
        }

        button {
            padding: 7px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 5px;
        }

        .update-button {
            background: #243b55;
            color: white;
        }

        .delete-button {
            background: #c0392b;
            color: white;
        }

        .message {
            color: green;
            font-weight: bold;
        }

        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>

<header>
    <h1>BUG TRACKING SYSTEM</h1>
</header>

<div class="container">

    <h2>Reported Bugs</h2>

    <c:if test="${param.updated == '1'}">
        <p class="message">Bug status updated successfully!</p>
    </c:if>

    <c:if test="${param.deleted == '1'}">
        <p class="message">Bug deleted successfully!</p>
    </c:if>

    <c:if test="${param.error == '1'}">
        <p class="error">Unable to perform the requested operation.</p>
    </c:if>

    <table>
        <tr>
            <th>Bug ID</th>
            <th>Bug Title</th>
            <th>Description</th>
            <th>Priority</th>
            <th>Status</th>
            <th>Reported Date</th>
            <th>Update Status</th>
            <th>Delete</th>
        </tr>

        <c:choose>

            <c:when test="${not empty bugs}">

                <c:forEach var="bug" items="${bugs}">

                    <tr>
                        <td><c:out value="${bug.bugId}"/></td>
                        <td><c:out value="${bug.title}"/></td>
                        <td><c:out value="${bug.description}"/></td>
                        <td><c:out value="${bug.priority}"/></td>
                        <td><c:out value="${bug.status}"/></td>
                        <td><c:out value="${bug.reportedDate}"/></td>

                        <td>
                            <form action="updateBug" method="post">

                                <input type="hidden" name="bugId"
                                       value="<c:out value='${bug.bugId}'/>">

                                <select name="status">

                                    <option value="Open"
                                        <c:if test="${bug.status == 'Open'}">selected</c:if>>
                                        Open
                                    </option>

                                    <option value="In Progress"
                                        <c:if test="${bug.status == 'In Progress'}">selected</c:if>>
                                        In Progress
                                    </option>

                                    <option value="Resolved"
                                        <c:if test="${bug.status == 'Resolved'}">selected</c:if>>
                                        Resolved
                                    </option>

                                    <option value="Closed"
                                        <c:if test="${bug.status == 'Closed'}">selected</c:if>>
                                        Closed
                                    </option>

                                </select>

                                <br>

                                <button type="submit" class="update-button">
                                    Update
                                </button>

                            </form>
                        </td>

                        <td>
                            <form action="deleteBug" method="post"
                                  onsubmit="return confirm('Are you sure you want to delete this bug?');">

                                <input type="hidden" name="bugId"
                                       value="<c:out value='${bug.bugId}'/>">

                                <button type="submit" class="delete-button">
                                    Delete
                                </button>

                            </form>
                        </td>
                    </tr>

                </c:forEach>

            </c:when>

            <c:otherwise>
                <tr>
                    <td colspan="8">No bugs reported yet.</td>
                </tr>
            </c:otherwise>

        </c:choose>

    </table>

    <p><a href="dashboard.jsp">Back to Dashboard</a></p>

</div>

</body>
</html>
