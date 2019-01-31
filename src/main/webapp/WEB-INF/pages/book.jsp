<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Book Form</title>

    <style type="text/css">

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

    </style>
</head>
<body>

<h3>${pageName}</h3>

    <c:url var="addAction" value="/add"/>

    <form:form action="${addAction}" commandName="book">
        <table>
            <tr>
                <td>
                    <form:hidden path="id"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="bookTitle">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookTitle"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="bookDescription">
                        <spring:message text="Description"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookDescription"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="bookAuthor">
                        <spring:message text="Author"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookAuthor" />
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="bookISBN">
                        <spring:message text="ISBN"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="bookISBN"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="printYear">
                        <spring:message text="Print year"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="printYear"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty book.bookTitle}">
                        <input type="submit"
                               value="<spring:message text="Update Book"/>"/>
                    </c:if>
                    <c:if test="${empty book.bookTitle}">
                        <input type="submit"
                               value="<spring:message text="Add Book"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</body>
</html>
