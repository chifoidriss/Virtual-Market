<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" aria-controls="navbar"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home">Virtual Market</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-left">
				<li class="active"><a href="home">Home</a></li>
				<li><a href="produits">Produits</a></li>
				<i:if test="${!empty sessionScope.user && user.phone==672243491}">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">
							Admin <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="addProduit">AddProduit</a></li>
						</ul>
					</li>
				</i:if>
				<i:if test="${empty sessionScope.user}">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" 
							role="button" aria-haspopup="true" aria-expanded="false">
							Authentification <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="login">Se connecter</a></li>
							<li><a href="sigin">S'inscrire</a></li>
						</ul>
					</li>
				</i:if>
				<i:if test="${!empty sessionScope.user}">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">
							Bienvenue ${user.prenomCli} <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="cart?idCli=${idCli}">Mon Panier</a></li>
							<li><a href="espace">Mon Espace</a></li>
							<li><a href="sigout">Se déconnecter</a></li>
						</ul>
					</li>
				</i:if>
			</ul>
		
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
						<i class="fa fa-shopping-cart"></i> <span class="qty">XXX</span>
					</a>
					<div class="cart-dropdown">
						<div class="cart-list">
							<i:set var="qte" value="0"></i:set>
							<i:set var="mont" value="0"></i:set>
							<i:forEach items="${panier}" var="pan" varStatus="i">
								<div class="product-widget">
									<div class="product-img">
										<img src="${pan.prod.avatar}">
									</div>
									<div class="product-body">
										<h3 class="product-name">
											<a href="produit?idProd=${pan.prod.idProd}">
												${pan.prod.nomProd}
											</a>
										</h3>
										<h4 class="product-price">
											<span class="qty">${pan.qte}x</span>
											$${pan.qte * pan.prod.pu}
										</h4>
									</div>
									<a href="panier?idCli=${idCli}&idProd=${pan.prod.idProd}&action=del">
										<button class="delete">
											<i class="fa fa-close"></i>
										</button>
									</a>
								</div>
								<i:set var="qte" value="${qte + pan.qte}"></i:set>
								<i:set var="mont" value="${mont+(pan.qte*pan.prod.pu)}"></i:set>
							</i:forEach>
						</div>
						<i:if test="${qte > 0 }">
							<div class="cart-summary">
								<small>${qte} Article(s) choisi(s)</small>
								<h5>MONTANT TOTAL: $${mont}</h5>
							</div>
							<div class="cart-btns">
								<a href="cart?idCli=${idCli}">Voir Mon Panier</a> 
								<a href="commande?idCli=${idCli}">Commander
								<i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</i:if>
					</div>
				</li>
			</ul>
		</div>
	</div>
</nav>