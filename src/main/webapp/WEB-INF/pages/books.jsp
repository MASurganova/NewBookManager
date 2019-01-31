<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Books Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

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

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>

<h3>${pageName}</h3>

<div id="pagination">
    <c:url value="${pageURL}" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>
    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="${pageURL}" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="${pageURL}" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>

<c:if test="${!empty listBooks}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Title</th>
            <th width="150">Description</th>
            <th width="120">Author</th>
            <th width="80">ISBN</th>
            <th width="60">Print year</th>
            <th width="60">Already read</th>
            <th width="60">Read</th>
            <th width="60">Update</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td>${book.bookTitle}</td>
                <td>${book.bookDescription}</td>
                <td>${book.bookAuthor}</td>
                <td>${book.bookISBN}</td>
                <td>${book.printYear}</td>
                <td>${book.readAlready}</td>
                <td><a href="<c:url value='/readAlready/${book.id}'/>">Read</a></td>
                <td><a href="<c:url value='/edit/${book.id}'/>">Update</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<h3>Add a Book</h3>

<c:url var="addAction" value="/books/add"/>

<form:form action="${addAction}" commandName="book">
    <table>
        <c:if test="${!empty book.bookTitle}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>

            </tr>
        </c:if>
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

            <c:if test="${!empty book.bookTitle}">
                <td>
                    <form:input path="bookAuthor" readonly="true" disabled="true"/>
                    <form:hidden path="bookAuthor"/>
                </td>
            </c:if>
            <c:if test="${empty book.bookTitle}">
                <td>
                    <form:input path="bookAuthor"/>
                </td>
            </c:if>
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

<a href="unreadList/">List of unread books</a>

<h3>List of books by title</h3>

<c:url var="searchByTitleAction" value="/bookListByTitle"/>

<form:form action="${searchByTitleAction}">
    <table>
        <tr>
            <td>
                <input name="bookTitleForList"/>
            </td>
            <td >
                <input type="submit"
                       value="<spring:message text="title"/>"/>
            </td>
        </tr>
    </table>

</form:form>

<h3>List of books from year</h3>

<c:url var="searchByYearAction" value="/bookListByYear"/>

<form:form action="${searchByYearAction}">
    <table>
        <tr>
            <td>
                <input name="printYearForList"/>
            </td>
            <td>
                <input type="submit"
                       value="<spring:message text="print year"/>"/>
            </td>
        </tr>
    </table>

</form:form>


</body>
</html>
