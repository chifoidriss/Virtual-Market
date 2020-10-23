<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="i"%>

<i:if test="${!empty error}">
	<i:redirect url="/error">
		<i:param name="message" value="${error}"></i:param>
	</i:redirect>
</i:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${prod.nomProd} - vMarket</title>

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
					<ul class="breadcrumb-tree">
						<li><a href="#">Home</a></li>
						<li><a href="#">Boutiques</a></li>
						<li><a href="#">${prod.nomCat}</a></li>
						<li><a href="#">${prod.nomMarq}</a></li>
						<li class="active">${prod.nomProd}</li>
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
				<!-- Product main img -->
				<div class="col-md-5 col-md-push-2">
					<div id="product-main-img">
						<div class="product-preview">
							<img src="${prod.avatar}" alt="">
						</div>

						<div class="product-preview">
							<img src="${prod.avatar}" alt="">
						</div>

						<div class="product-preview">
							<img src="${prod.avatar}" alt="">
						</div>

						<div class="product-preview">
							<img src="${prod.avatar}" alt="">
						</div>
					</div>
				</div>
				<!-- /Product main img -->

				<!-- Product thumb imgs -->
				<div class="col-md-2  col-md-pull-5">
					<div id="product-imgs">
						<div class="product-preview">
							<img src="${prod.avatar}" alt="">
						</div>

						<div class="product-preview">
							<img src="${prod.avatar}" alt="">
						</div>

						<div class="product-preview">
							<img src="${prod.avatar}" alt="">
						</div>

						<div class="product-preview">
							<img src="${prod.avatar}" alt="">
						</div>
					</div>
				</div>
				<!-- /Product thumb imgs -->

				<!-- Product details -->
				<div class="col-md-5">
					<div class="product-details">
						<h2 class="product-name">${prod.nomProd}</h2>
						<div>
							<div class="product-rating">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o"></i>
							</div>
							<a class="review-link" href="#">10 Review(s) | Add your
								review</a>
						</div>
						<div>
							<h3 class="product-price">$${prod.pu}</h3>
							<span class="product-available">In Stock</span>
						</div>
						<p>${prod.desc}</p>

						<div class="add-to-cart">
							<form method="post" action="panier">
								<div class="qty-label">
									Qté:
									<div class="input-number">
										<input type="number" value="1" name="qte">
										<span class="qty-up">+</span>
										<span class="qty-down">-</span>
									</div>
								</div>
								<input type="hidden" name="idCli"
										value="${sessionScope.user.idCli}">
								<input type="hidden" name="idProd" value="${prod.idProd}">
								<input type="hidden" name="action" value="add">
								
								<button class="add-to-cart-btn" type="submit">
									<i class="fa fa-shopping-cart"></i> add to cart
								</button>
							</form>
						</div>

						<ul class="product-btns">
							<li><a href="#"><i class="fa fa-heart-o"></i>
							add to wishlist</a></li>
							<li><a href="#"><i class="fa fa-exchange"></i>
							add to compare</a></li>
						</ul>

						<ul class="product-links">
							<li>Categorie:</li>
							<li><a href="store?idCat=${prod.idCat}">${prod.nomCat}</a></li>
						</ul>
						<ul class="product-links">
							<li>Marque:</li>
							<li><a href="store?idMarq=${prod.idMarq}">${prod.nomMarq}</a></li>
						</ul>

						<ul class="product-links">
							<li>Partager sur:</li>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-envelope"></i></a></li>
						</ul>

					</div>
				</div>
				<!-- /Product details -->

				<!-- Product tab -->
				<div class="col-md-12">
					<div id="product-tab">
						<!-- product tab nav -->
						<ul class="tab-nav">
							<li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
							<li><a data-toggle="tab" href="#tab2">Details</a></li>
							<li><a data-toggle="tab" href="#tab3">Votes (3)</a></li>
						</ul>
						<!-- /product tab nav -->

						<!-- product tab content -->
						<div class="tab-content">
							<!-- tab1  -->
							<div id="tab1" class="tab-pane fade in active">
								<div class="row">
									<div class="col-md-12">
										<p>${prod.desc}</p>
									</div>
								</div>
							</div>
							<!-- /tab1  -->

							<!-- tab2  -->
							<div id="tab2" class="tab-pane fade in">
								<div class="row">
									<div class="col-md-12">
										<p>${prod.desc}</p>
									</div>
								</div>
							</div>
							<!-- /tab2  -->

							<!-- tab3  -->
							<div id="tab3" class="tab-pane fade in">
								<div class="row">
									<!-- Rating -->
									<div class="col-md-3">
										<div id="rating">
											<div class="rating-avg">
												<span>4.5</span>
												<div class="rating-stars">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
											</div>
											<ul class="rating">
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
													<div class="rating-progress">
														<div style="width: 80%;"></div>
													</div>
													<span class="sum">3</span>
												</li>
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star-o"></i>
													</div>
													<div class="rating-progress">
														<div style="width: 60%;"></div>
													</div>
													<span class="sum">2</span>
												</li>
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star-o"></i>
														<i class="fa fa-star-o"></i>
													</div>
													<div class="rating-progress">
														<div></div>
													</div>
													<span class="sum">0</span>
												</li>
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star-o"></i>
														<i class="fa fa-star-o"></i>
														<i class="fa fa-star-o"></i>
													</div>
													<div class="rating-progress">
														<div></div>
													</div>
													<span class="sum">0</span>
												</li>
												<li>
													<div class="rating-stars">
														<i class="fa fa-star"></i>
														<i class="fa fa-star-o"></i>
														<i class="fa fa-star-o"></i>
														<i class="fa fa-star-o"></i>
														<i class="fa fa-star-o"></i>
													</div>
													<div class="rating-progress">
														<div></div>
													</div>
													<span class="sum">0</span>
												</li>
											</ul>
										</div>
									</div>
									<!-- /Rating -->

									<!-- Reviews -->
									<div class="col-md-6">
										<div id="reviews">
											<ul class="reviews">
												<li>
													<div class="review-heading">
														<h5 class="name">John</h5>
														<p class="date">27 DEC 2018, 8:0 PM</p>
														<div class="review-rating">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o empty"></i>
														</div>
													</div>
													<div class="review-body">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
															elit, sed do eiusmod tempor incididunt ut labore et
															dolore magna aliqua</p>
													</div>
												</li>
												<li>
													<div class="review-heading">
														<h5 class="name">John</h5>
														<p class="date">27 DEC 2018, 8:0 PM</p>
														<div class="review-rating">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o empty"></i>
														</div>
													</div>
													<div class="review-body">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
															elit, sed do eiusmod tempor incididunt ut labore et
															dolore magna aliqua</p>
													</div>
												</li>
												<li>
													<div class="review-heading">
														<h5 class="name">John</h5>
														<p class="date">27 DEC 2018, 8:0 PM</p>
														<div class="review-rating">
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star"></i>
															<i class="fa fa-star-o empty"></i>
														</div>
													</div>
													<div class="review-body">
														<p>Lorem ipsum dolor sit amet, consectetur adipisicing
															elit, sed do eiusmod tempor incididunt ut labore et
															dolore magna aliqua</p>
													</div>
												</li>
											</ul>
											<ul class="reviews-pagination">
												<li class="active">1</li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a href="#">4</a></li>
												<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
											</ul>
										</div>
									</div>
									<!-- /Reviews -->

									<!-- Review Form -->
									<div class="col-md-3">
										<div id="review-form">
											<form method="post" class="review-form">
												<textarea class="input" 
														placeholder="Votre Commentaire"></textarea>
												<div class="input-rating">
													<span>Votre vote: </span>
													<div class="stars">
														<input id="star5" name="rating" value="5" type="radio">
														<label for="star5"></label>
														<input id="star4" name="rating" value="4" type="radio">
														<label for="star4"></label>
														<input id="star3" name="rating" value="3" type="radio">
														<label for="star3"></label>
														<input id="star2" name="rating" value="2" type="radio">
														<label for="star2"></label>
														<input id="star1" name="rating" value="1" type="radio">
														<label for="star1"></label>
													</div>
												</div>
												<button class="primary-btn">Envoyer</button>
											</form>
										</div>
									</div>
									<!-- /Review Form -->
								</div>
							</div>
							<!-- /tab3  -->
						</div>
						<!-- /product tab content  -->
					</div>
				</div>
				<!-- /product tab -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- Section Related Products -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<div class="col-md-12">
					<div class="section-title text-center">
						<h3 class="title">Produits Simillaires</h3>
					</div>
				</div>

				<i:forEach items="${prodR}" var="pro">
					<!-- product -->
					<div class="col-md-3 col-xs-6">
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
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /Section Related Products -->

	<%@ include file="../include/footer.jsp"%>

</body>
</html>
