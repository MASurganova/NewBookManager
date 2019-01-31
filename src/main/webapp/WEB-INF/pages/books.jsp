<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Book Manager</title>

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

    </style>
</head>
<body>

<h3>${pageName}</h3>
<c:if test="${pageName =='Books list'}">
    <a href="unreadList/"><button>List of unread books</button></a>
    <br>
    <br>
    <a href="add/"><button>Add a book</button></a>
</c:if>
<c:if test="${pageName !='Books list'}">
    <a href="http://localhost:8080/books/"><button>Back to main</button></a>
</c:if>
<br>
<br>

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
            <th width="60">Year</th>
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
                <td><a href="<c:url value='/read/${book.id}'/>">Read</a></td>
                <td><a href="<c:url value='/update/${book.id}'/>">Update</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<c:if test="${pageName =='Books list'}">

    <c:url var="searchByTitleAction" value="/bookListByTitle"/>

    <form:form action="${searchByTitleAction}">
        <table>
            <td>
                <label name="title">
                        <spring:message text="Search by title"/>
            </td>
            <td>
                <input name="title"/>
            </td>
            <td >
                <input type="submit"
                       value="<spring:message text="Search"/>"/>
            </td>
        </table>
    </form:form>

    <c:url var="searchByYearAction" value="/bookListByYear"/>

    <form:form action="${searchByYearAction}">
        <td>
            <label name="year">
                <spring:message text="Search by year"/>
            </label>
        </td>
        <td>
            <input name="year"/>
        </td>
        <td>
            <input type="submit"
                   value="<spring:message text="Search"/>"/>
        </td>
    </form:form>
</c:if>

</body>
</html>
