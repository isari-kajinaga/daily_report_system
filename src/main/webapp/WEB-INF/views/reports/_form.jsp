<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="constants.AttributeConst" %>

<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<fmt:parseDate value="${report.reportDate}" pattern="yyyy-MM-dd" var="reportDay" type="date" />
<label for="${AttributeConst.REP_DATE.getValue()}">日付</label><br />
<input type="date" name="${AttributeConst.REP_DATE.getValue()}" value="<fmt:formatDate value='${reportDay}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_employee.name}" />
<br /><br />

<label for="${AttributeConst.REP_TITLE.getValue()}">タイトル</label><br />
<input type="text" name="${AttributeConst.REP_TITLE.getValue()}" value="${report.title}" />
<br /><br />

<label for="${AttributeConst.REP_CONTENT.getValue()}">内容</label><br />
<textarea name="${AttributeConst.REP_CONTENT.getValue()}" rows="10" cols="50">${report.content}</textarea>
<br /><br />
<input type="hidden" name="${AttributeConst.REP_ID.getValue()}" value="${report.id}" />
<input type="hidden" name="${AttributeConst.TOKEN.getValue()}" value="${_token}" />

<c:if test="${sessionScope.login_employee.bossFlag > report.employee.bossFlag}">
        <br><br>
            <label for="${AttributeConst.REP_APP_FLG.getValue()}">日報承認</label><br />
            <select name="${AttributeConst.REP_APP_FLG.getValue()}">
                <option value="${AttributeConst.APP_FLAG_TRUE.getIntegerValue()}"<c:if test="${report.approvalFlag == AttributeConst.APP_FLAG_TRUE.getIntegerValue()}"> selected</c:if>>承認済</option>
                <option value="${AttributeConst.APP_FLAG_FALSE.getIntegerValue()}"<c:if test="${report.approvalFlag == AttributeConst.APP_FLAG_FALSE.getIntegerValue()}"> selected</c:if>>未承認</option>
            </select>
        <br><br>
</c:if>

<button type="submit">投稿</button>