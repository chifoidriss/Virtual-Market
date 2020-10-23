<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Boutique - vMarket</title>
	
	<%@ include file="../include/link.jsp" %>
</head>

<body>
	
	<%@ include file="../include/header.jsp" %>

	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb-tree">
						<li><a href="#">Home</a></li>
						<li><a href="#">Toutes Catégories</a></li>
						<li class="active">Toutes Marques (227,490 Produits)</li>
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
				<!-- ASIDE -->
				<div id="aside" class="col-md-3">
					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Catégories</h3>
						<div class="checkbox-filter">
							<i:forEach items="${cat}" var="cat">
							<div class="input-checkbox">
								<input type="checkbox" id="${cat.idCat}">
								<label for="${cat.idCat}"><span></span> ${cat.nomCat} 
									<small>(578)</small>
								</label>
							</div>
							</i:forEach>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Prix</h3>
						<div class="price-filter">
							<div id="price-slider"></div>
							<div class="input-number price-min">
								<input id="price-min" type="number">
								<span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
							<span>-</span>
							<div class="input-number price-max">
								<input id="price-max" type="number">
								<span class="qty-up">+</span>
								<span class="qty-down">-</span>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Marques</h3>
						<div class="checkbox-filter">
							<i:forEach items="${marq}" var="marq">
							<div class="input-checkbox">
								<input type="checkbox" id="${marq.idMarq}">
								<label for="${marq.idMarq}"><span></span> ${marq.nomMarq} 
									<small>(578)</small>
								</label>
							</div>
							</i:forEach>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Meilleures Ventes</h3>
						<i:forEach items="${prodTopS}" var="pro">
						<div class="product-widget">
							<div class="product-img">
								<img src="${pro.avatar}" alt="">
							</div>
							<div class="product-body">
								<p class="product-category">${pro.nomCat}</p>
								<h3 class="product-name">
									<a href="produit?idProd=${pro.idProd}">${pro.nomProd}</a>
								</h3>
								<h4 class="product-price">$${pro.pu}</h4>
							</div>
						</div>
						</i:forEach>
					</div>
					<!-- /aside Widget -->
				</div>
				<!-- /ASIDE -->

				<!-- STORE -->
				<div id="store" class="col-md-9">
					<!-- store top filter -->
					<div class="store-filter clearfix">
						<div class="store-sort">
							<label> Filtrer Par:
								<select class="input-select">
										<option value="0">Popular</option>
										<option value="1">Position</option>
								</select>
							</label>
							<label> Afficher:
								<select class="input-select">
									<option value="20">20</option>
									<option value="50">50</option>
								</select>
							</label>
						</div>
						<ul class="store-grid">
							<li class="active"><i class="fa fa-th"></i></li>
							<li><a href="#"><i class="fa fa-th-list"></i></a></li>
							<li><a href="#"><i class="fa fa-search"></i></a></li>
						</ul>
					</div>
					<!-- /store top filter -->

					<!-- store products -->
					<div class="row">
						<i:forEach items="${prod}" var="pro">
							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="${pro.avatar}" alt="">
										<div class="product-label">
											<span class="new">NEW</span>
											<span class="hot">HOT</span>
										</div>
									</div>
									<div class="product-body">
										<p class="product-category">${pro.nomCat}</p>
										<h3 class="product-name">
											<a href="produit?idProd=${pro.idProd}">
												${pro.nomProd}
											</a>
										</h3>
										<h4 class="product-price">$${pro.pu}</h4>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
										<div class="product-btns">
											<button class="add-to-wishlist">
												<i class="fa fa-heart-o"></i>
												<span class="tooltipp">favoris</span>
											</button>
											<button class="add-to-compare">
												<i class="fa fa-exchange"></i>
												<span class="tooltipp">Comparer</span>
											</button>
											<button class="quick-view">
												<a href="produit?idProd=${pro.idProd}">
													<i class="fa fa-eye"></i>
												</a>
												<span class="tooltipp">plus</span>
											</button>
										</div>
									</div>
									<div class="add-to-cart">
										<button class="add-to-cart-btn">
											<a href="panier?idProd=${pro.idProd}">
												<i class="fa fa-shopping-cart"></i> panier
											</a>
										</button>
									</div>
								</div>
							</div>
							<!-- /product -->
						</i:forEach>
					</div>
					<!-- /store products -->

					<!-- store bottom filter -->
					<div class="store-filter clearfix">
						<span class="store-qty">Affichage 20-100 Produits</span>
						<ul class="store-pagination">
							<li class="active">1</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
					<!-- /store bottom filter -->
				</div>
				<!-- /STORE -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<%@ include file="../include/footer.jsp" %>

</body>
</html>
