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
					<h3 class="breadcrumb-header">Commander</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">Home</a></li>
						<li class="active">Commander</li>
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

				<div class="col-md-6">
					<!-- Billing Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">Addresse</h3><hr>
						</div>
						<div class="form-group">
							<select class="input" name="pays">
								<option value="">Pays</option>
								<option>Cameroun</option>
								<option>Gabon</option>
								<option>Nigeria</option>
								<option>Maroc</option>
								<option>Tunisie</option>
							</select>
						</div>
						<div class="form-group">
							<input class="input" type="text" name="ville"
								placeholder="Ville">
						</div>
						<div class="form-group">
							<input class="input" type="text" name="quartier"
								placeholder="Quartier">
						</div>
					</div>
					<!-- /Billing Details -->

				</div>

				<!-- Order Details -->
				<div class="col-md-6 order-details">
					<div class="section-title text-center">
						<h3 class="title">Votre Commande</h3><hr>
					</div>
					<div class="order-summary">
						<div class="order-col">
							<div>
								<strong># - PRODUITS</strong>
							</div>
							<div>
								<strong>MONTANT</strong>
							</div>
						</div>
						<div class="order-products">
							<i:set var="mont" value="0"></i:set>
							<i:forEach items="${panier}" var="com" varStatus="i">
								<div class="order-col">
									<div>
										${i.index+1} - <strong>${com.qte} X</strong>
										${com.prod.nomProd}
									</div>
									<div>$${com.qte*com.prod.pu}</div>
								</div>
								<i:set var="mont" value="${mont+(com.qte*com.prod.pu)}"></i:set>
							</i:forEach>
							<hr>
						</div>
						<div class="order-col">
							<div>MONTANT HT</div>
							<div>
								<strong>$${mont}</strong>
							</div>
						</div>
						<div class="order-col">
							<div>TVA</div>
							<div>
								<strong>5.5%</strong>
							</div>
						</div>
						<div class="order-col">
							<div>Frais Livraison</div>
							<div>
								<strong>GRATUIT</strong>
							</div>
						</div>
						<div class="order-col">
							<div>
								<strong>MONTANT TTC</strong>
							</div>
							<div>
								<strong class="order-total">$${mont*1.055}</strong>
							</div>
						</div>
						<hr>
					</div>
					<div class="payment-method">
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-1">
							<label for="payment-1"> <span></span> Transfère Bancaire</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore 
									magna aliqua.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-2">
							<label for="payment-2"> <span></span> VISA/Master Card System</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore 
									magna aliqua.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-3">
							<label for="payment-3"> <span></span> Paypal System </label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore 
									magna aliqua.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-4">
							<label for="payment-4"> <span></span> MTN Mobile Money</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore 
									magna aliqua.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-5">
							<label for="payment-5"> <span></span> Orange Mobile Money</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore 
									magna aliqua.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-6">
							<label for="payment-6"> <span></span> EU Mobile Money</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore 
									magna aliqua.</p>
							</div>
						</div>
					</div>
					<div class="input-checkbox">
						<input type="checkbox" id="terms"> <label for="terms">
							<span></span> J'ai lu et accepté les
							<a href="#">Termes & Conditions</a>
						</label>
					</div>
					<a href="#" class="primary-btn order-submit">Passer à l'achat</a>
				</div>
				<!-- /Order Details -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<%@ include file="../include/footer.jsp"%>
</body>
</html>