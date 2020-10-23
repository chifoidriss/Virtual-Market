<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>

<i:if test="${empty sessionScope.user}">
	<i:redirect url="/home"></i:redirect>
</i:if>