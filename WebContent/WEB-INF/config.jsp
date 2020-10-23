<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>

<i:choose>
	<i:when test="${catchException != null}">
		<i:redirect url="/error">
			<i:param name="message" value="${catchException}"></i:param>
		</i:redirect>
	</i:when>
	<i:when test="${SQLException != null}">
		<i:redirect url="/error">
			<i:param name="message" value="${SQLException}"></i:param>
		</i:redirect>
	</i:when>
	<i:when test="${ClassNotFoundException != null}">
		<i:redirect url="/error">
			<i:param name="message" value="${ClassNotFoundException}"></i:param>
		</i:redirect>
	</i:when>
	<i:when test="${ServletException != null}">
		<i:redirect url="/error">
			<i:param name="message" value="${ServletException}"></i:param>
		</i:redirect>
	</i:when>
	<i:when test="${IOException != null}">
		<i:redirect url="/error">
			<i:param name="message" value="${IOException}"></i:param>
		</i:redirect>
	</i:when>
	<i:when test="${Exception != null}">
		<i:redirect url="/error">
			<i:param name="message" value="${Exception}"></i:param>
		</i:redirect>
	</i:when>
</i:choose>

<i:if test="${!empty sessionScope.user}">
	<i:set var="idCli" value="${sessionScope.user.idCli}" scope="session"></i:set>
	<i:set var="user" value="${sessionScope.user}" scope="session"></i:set>
</i:if>


<!DOCTYPE html>