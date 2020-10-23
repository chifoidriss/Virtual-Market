<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>

<i:if test="${empty sessionScope.user}">
	<i:redirect url="/login"></i:redirect>
</i:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panier - vMarket</title>
<%@ include file="../include/link.jsp"%>
</head>
<body>

	<%@ include file="../include/header.jsp"%>
	
	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">Mon Panier</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">Home</a></li>
						<li class="active">Panier</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<table class="table table-responsive table-striped">
					<thead>
						<th>#</th>
						<th>Produits</th>
						<th>Prix Unit</th>
						<th>Quantité</th>
						<th>Prix Total</th>
					</thead>
					<tbody>
						<i:set var="mont" value="0"></i:set>
						<i:forEach items="${panier}" var="pan" varStatus="i">
							<tr>
								<td>${i.index+1}</td>
								<td>
									<div class="product-widget">
										<div class="product-img">
											<img src="${pan.prod.avatar}" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">${pan.prod.nomCat}</p>
											<h3 class="product-name">${pan.prod.nomProd}</h3>
										</div>
									</div>
								</td>
								<td>$${pan.prod.pu}</td>
								<td>${pan.qte}</td>
								<td>$${pan.qte * pan.prod.pu}</td>
							</tr>
							<i:set var="mont" value="${mont+(pan.qte*pan.prod.pu)}"></i:set>
						</i:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="4">Montant TOTAL</th>
							<th colspan="1">$${mont}</th>
						</tr>
						<tr>
							<th colspan="3">
								<a href="store" class="btn-add-cart pull-left">
									<i class="fa fa-shopping-cart"></i> Continuer les Achats
								</a>
							</th>
							<th colspan="2">
								<a href="command?idCli=${idCli}" class="btn-add-cart pull-right">
									<i class="fa fa-shopping-cart"></i> Passer la Commande
								</a>
							</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<%@ include file="../include/footer.jsp"%>
</body>
</html>