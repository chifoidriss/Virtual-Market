<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>

<html>
<head>
<title>Home - vMarket</title>
<%@ include file="../include/link.jsp"%>
</head>

<body>

	<%@ include file="../include/header.jsp"%>

	<!-- SECTION CATEGORIES -->
	<div class="section">
		<div class="container">
			<div class="row">
				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img src="./asset/img/shop01.png" alt="">
						</div>
						<div class="shop-body">
							<h3>Laptops<br>Collection</h3>
							<a href="store?cat=ordinateurs" class="cta-btn">Shop now
								<i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img src="./asset/img/shop03.png" alt="">
						</div>
						<div class="shop-body">
							<h3>Smartphones<br>Collection</h3>
							<a href="store?cat=telephones" class="cta-btn">Shop now
								<i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /shop -->

				<!-- shop -->
				<div class="col-md-4 col-xs-6">
					<div class="shop">
						<div class="shop-img">
							<img src="./asset/img/shop02.png" alt="">
						</div>
						<div class="shop-body">
							<h3>Accéssoires<br>Collection</h3>
							<a href="store?cat=accessoires" class="cta-btn">Shop now
								<i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /shop -->
			</div>
		</div>
	</div>
	<!-- /SECTION CATEGORIES -->

	<!-- SECTION NEW PRODUCTS -->
	<div class="section">
		<div class="container">
			<div class="row">
				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">Nouveaux Produits</h3>
						<div class="section-nav">
							<ul class="section-tab-nav tab-nav">
								<li class="active">
									<a data-toggle="tab" href="#tab1">Laptops</a>
								</li>
								<li><a data-toggle="tab" href="#tab1">Smartphones</a></li>
								<li><a data-toggle="tab" href="#tab1">Accéssoires</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /section title -->

				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">
								<i:forEach items="${prodN}" var="pro">
									<!-- product -->
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
													${pro.nomProd}</a>
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
													<i class="fa fa-shopping-cart"></i>
													panier
												</a>
											</button>
										</div>
									</div>
									<!-- /product -->
								</i:forEach>
								</div>
								<div id="slick-nav-1" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- Products tab & slick -->
			</div>
		</div>
	</div>
	<!-- /SECTION NEW PRODUCTS -->

	<!-- HOT DEAL SECTION -->
	<div id="hot-deal" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="hot-deal">
						<ul class="hot-deal-countdown">
							<li>
								<div>
									<h3>02</h3>
									<span>Jours</span>
								</div>
							</li>
							<li>
								<div>
									<h3>10</h3>
									<span>Heures</span>
								</div>
							</li>
							<li>
								<div>
									<h3>34</h3>
									<span>Minutes</span>
								</div>
							</li>
							<li>
								<div>
									<h3>60</h3>
									<span>Secondes</span>
								</div>
							</li>
						</ul>
						<h2 class="text-uppercase">Promo de la semaine</h2>
						<p>Nouvelle collection jusqu'à 50% de Rédction</p>
						<a class="primary-btn cta-btn" href="store">Shop now</a>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /HOT DEAL SECTION -->

	<!-- SECTION TOP SELLING -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title">Nos Meilleures Ventes</h3>
						<div class="section-nav">
							<ul class="section-tab-nav tab-nav">
								<li class="active">
									<a data-toggle="tab" href="#tab2">Laptops</a>
								</li>
								<li><a data-toggle="tab" href="#tab2">Smartphones</a></li>
								<li><a data-toggle="tab" href="#tab2">Accéssoires</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /section title -->

				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab2" class="tab-pane fade in active">
								<div class="products-slick" data-nav="#slick-nav-2">
									<i:forEach items="${prodTopS}" var="pro">
									<!-- product -->
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
													${pro.nomProd}</a>
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
													<i class="fa fa-shopping-cart"></i>
													panier
												</a>
											</button>
										</div>
									</div>
									<!-- /product -->
									</i:forEach>
								</div>
								<div id="slick-nav-2" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- /Products tab & slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION TOP SELLING -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">Laptops</h4>
						<div class="section-nav">
							<div id="slick-nav-3" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-3">
						<div>
							<!-- product widget -->
							<i:forEach items="${prodTop}" var="pro">
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
							<!-- /product widget -->
						</div>

						<div>
							<!-- product widget -->
							<i:forEach items="${prodTop}" var="pro">
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
							<!-- /product widget -->
						</div>
					</div>
				</div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">Smartphones</h4>
						<div class="section-nav">
							<div id="slick-nav-4" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-4">
						<div>
							<!-- product widget -->
							<i:forEach items="${prodTop}" var="pro">
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
							<!-- /product widget -->
						</div>

						<div>
							<!-- product widget -->
							<i:forEach items="${prodTop}" var="pro">
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
							<!-- /product widget -->
						</div>
					</div>
				</div>

				<div class="clearfix visible-sm visible-xs"></div>

				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">Accéssoires</h4>
						<div class="section-nav">
							<div id="slick-nav-5" class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick" data-nav="#slick-nav-5">
						<div>
							<!-- product widget -->
							<i:forEach items="${prodTop}" var="pro">
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
							<!-- /product widget -->
						</div>

						<div>
							<!-- product widget -->
							<i:forEach items="${prodTop}" var="pro">
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
							<!-- /product widget -->
						</div>
					</div>
				</div>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<%@ include file="../include/footer.jsp"%>

</body>
</html>