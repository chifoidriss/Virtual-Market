<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>

<%-- <i:if test="${empty sessionScope.user || sessionScope.user.getPhone()!=672243491}">
	<i:redirect url="/home"></i:redirect>
</i:if> --%>

<html>
<head>
<title>Ajout Produit - vMarket</title>
<%@ include file="../include/link.jsp"%>
</head>

<body>

	<%@ include file="../include/header.jsp"%>

	<div class="container-fluid log">
		<div class="col x-40"></div>
		<div class="col x-60 myForm">
			<h3 class="text-center">Ajouter un Produit!</h3><hr>
			<form method="post" class="form" enctype="multipart/form-data">
				<div class="col x-100">
					<i:if test="${!empty error}">
						${error}
					</i:if>
					<i:if test="${!empty success}">
						${success}
					</i:if>
				</div>
				<div class="col x-100">
					<label for="nomProd">Nom du produit :</label> 
					<input type="text" name="nomProd" id="nomProd" class="input">
				</div>
				<div class="col x-50">
					<label for="qte">Quantité :</label> 
					<input type="text" name="qte" id="qte" class="input">
				</div>
				<div class="col x-50">
					<label for="pu">Prix :</label> 
					<input type="text" name="pu" id="pu" class="input">
				</div>
				<div class="col x-100">
					<label for="desc">Description :</label>
					<textarea name="desc" id="desc" class="input"></textarea>
				</div>
				<div class="col x-50">
					<label for="idCat">Catégorie :</label>
					<select name="idCat" id="idCat" class="input">
						<option value="">Selectionner la catégorie</option>
						<i:forEach items="${cat }" var="cate">
							<option value="${cate.idCat}">${cate.nomCat}</option>
						</i:forEach>
					</select>
				</div>
				<div class="col x-50">
					<label for="idMarq">Marque :</label> 
					<select name="idMarq" id="idMarq" class="input">
						<option value="">Selectionner la marque</option>
						<i:forEach items="${marq }" var="mar">
							<option value="${mar.idMarq}">${mar.nomMarq}</option>
						</i:forEach>
					</select>
				</div>

				<div class="col x-100">
					<label for="avatar">Image du produit :</label>
					<label for="avatar" class="input">--- Choisir un fichier ---</label> 
					<input type="file" name="avatar" id="avatar" class="hidden">
				</div>
				<div class="col x-100">
					<button class="btnCustom btn-success" type="submit">Ajouter</button>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>

</body>
</html>