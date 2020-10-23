<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>
<i:if test="${!empty sessionScope.user}">
	<i:redirect url="/home"></i:redirect>
</i:if>

<html>
<head>
	<title>Inscription - vMarket</title>
	<%@ include file="../include/link.jsp" %>
</head>

<body>
	
	<%@ include file="../include/header.jsp" %>

	<div class="container-fluid log">
		<div class="col x-40"></div>
		<div class="col x-60 myForm">
			<h3 class="text-center">Créer un Compte!</h3><hr>
			<form method="post" class="form" enctype="multipart/form-data">
				<div class="col x-100">
					<i:if test="${!empty error}">
						<div class="alert alert-danger">${error}</div>
					</i:if>
					<i:if test="${!empty success}">
						<div class="alert alert-success">${success}</div>
					</i:if>
				</div>
				<div class="col x-100">
					<select name="sexe" class="input">
						<option value="">Sélectionner le Sexe</option>
						<option value="M">Masculin</option>
						<option value="F">Féminin</option>
					</select>
				</div>
				<div class="col x-50">
					<input type="text" name="nomCli" class="input"
							value="<i:out value="${nomCli}"></i:out>"
							placeholder="Entrer Nom...">
				</div>
				<div class="col x-50">
					<input type="text" name="prenomCli" class="input"
							value="<i:out value="${prenomCli}"></i:out>"
							placeholder="Entrer Prénom...">
				</div>
				<div class="col x-50">
					<input type="email" name="email" class="input"
							value="<i:out value="${email}"></i:out>"
							placeholder="Entrer Email...">
				</div>
				<div class="col x-50">
					<input type="text" name="phone" class="input"
							value="<i:out value="${phone}"></i:out>"
							placeholder="Entrer Numéro Téléphone...">
	 			</div>
				<div class="col x-50">
					<input type="password" name="password" class="input"
							value="<i:out value="${password}"></i:out>"
							placeholder="Entrer Mot de Passe...">
				</div>
				<div class="col x-50">
					<input type="password" name="confirm" class="input"
						placeholder="Confirmation...">
				</div>
				<div class="col x-100">
					<label for="profile" class="input">--- Choisir une image ---</label>
					<input type="file" name="profile" id="profile" class="hidden">
				</div>
				<div class="col x-100">
					<input type="checkbox" name="agree" id="rem">
					<label for="rem">I agree with the <a href="#">Terms of use.</a></label>
				</div>
				<div class="col x-100">
					<button class="btnCustom btn-success" type="submit">Inscription</button>
					<hr>
				</div>
			</form>
			<div class="col x-100">
				<button class="btnCustom btn-danger"> S'inscrire avec Google</button>
			</div>
			<div class="col x-100">
				<button class="btnCustom btn-primary"> S'inscrire avec Facebook</button>
				<hr>
			</div>
			<div class="col x-100 text-center">
				<a class="small" href="forgot">Mot de Passe Oublié?</a>
			</div>
			<div class="col x-100 text-center">
				<a class="small" href="login">J'ai déjà un Compte? Me Connecter!</a>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp" %>

</body>
</html>