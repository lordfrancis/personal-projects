<%--
  Created by IntelliJ IDEA.
  User: franz
  Date: 03/12/2022
  Time: 10:40 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Task Organizer</title>
    <style>
        table, tr, td, th{
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <h1> List of Tasks </h1>
    <table>
        <tr>
            <th> Task ID </th>
            <th> Title </th>
            <th> Description </th>
            <th> Due Date </th>
            <th> Remarks </th>
            <th> Status </th>
            <th> Edit </th>
            <th> Delete </th>
        </tr>
        <c:forEach items="${tasks}" var="task">
            <tr>
                <td> ${task.id}</td>
                <td> ${task.title}</td>
                <td> ${task.description}</td>
                <td> ${task.due_date}</td>
                <td> ${task.remarks}</td>
                <td> ${task.status}</td>
                <td> <a href="updateTaskView?id=${task.id}">Edit </a></td>
                <td> <a href="deleteTask?id=${task.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <a href="addtask"> Add Task </a>
</body>
</html>
