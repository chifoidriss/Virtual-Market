<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>
<i:if test="${!empty sessionScope.user}">
	<i:redirect url="/home"></i:redirect>
</i:if>

<html>
<head>
	<title>Connexion - vMarket</title>
	<%@ include file="../include/link.jsp" %>
</head>

<body>
	
	<%@ include file="../include/header.jsp" %>

	<div class="container-fluid log">
		<div class="col x-50"></div>
		<div class="col x-50 myForm">
			<h3 class="text-center">Bon Retour!</h3><hr>
			<form method="POST" class="form">
				<div class="col x-100">
					<i:if test="${!empty error}">
						<div class="alert alert-danger">${error}</div>
					</i:if>
					<i:if test="${!empty success}">
						<div class="alert alert-success">${success}</div>
					</i:if>
				</div>
				<div class="col x-100">
					<input type="text" name="ephone" class="input"
							value='<i:out value="${ephone}"></i:out>'
							placeholder="Email ou Numéro de Téléphone...">
				</div>
				<div class="col x-100">
					<input type="password" name="password" class="input"
							placeholder="Mot de passe...">
				</div>
				<div class="col x-100">
					<input type="checkbox" name="remenber" id="remenber">
					<label for="remenber"> Remember Me</label>
				</div>
				<div class="col x-100">
					<button class="btnCustom btn-success" type="submit">Se Connecter</button>
					<hr>
				</div>
			</form>
			<div class="col x-100">
				<button class="btnCustom btn-danger">Se Connecter avec Google</button>
			</div>
			<div class="col x-100">
				<button class="btnCustom btn-primary">Se Connecter avec Facebook</button>
				<hr>
			</div>
			<div class="col x-100 text-center">
				<a class="small" href="forgot">Mot de Passe Oublié?</a>
			</div>
			<div class="col x-100 text-center">
				<a class="small" href="sigin">Créer un Compte!</a>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>