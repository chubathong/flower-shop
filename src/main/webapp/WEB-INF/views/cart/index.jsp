
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@	taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Flower Shop</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/template/img/logo3.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/template/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/template/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/template/css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/template/css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/template/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/template/css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/template/css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/template/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/template/css/style.css">
</head>

<body>
    <!--::header part start::-->
    <header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/layout/home"> <img src="${pageContext.request.contextPath}/resources/assets/template/img/logoflowershop2.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/layout/home">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/layout/about">About</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Products
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_2">
	                                    <c:forEach var="category" items="${categorys }" varStatus="i">
											
							
								 			<a class="dropdown-item" href="${pageContext.request.contextPath}/layout/category/${category.id }">${category.name }</a>
											
										</c:forEach>
                                       
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/layout/specials">Specials gifts</a>
                                </li>
              
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/layout/myaccount">My account</a>
                                </li>
                                                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/layout/register">Register</a>
                                </li>
                                                               
                            </ul>
                        </div>
                        <div class="hearer_icon d-flex align-items-center">
                            <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <a href="${pageContext.request.contextPath}/cart/index">
                                <i class="flaticon-shopping-cart-black-shape"></i>
                            </a>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <div class="search_input" id="search_input_box">
            <div class="container ">
                <form class="d-flex justify-content-between search-inner">
                    <input type="text" class="form-control" id="search_input" placeholder="Search Here">
                    <button type="submit" class="btn"></button>
                    <span class="ti-close" id="close_search" title="Close Search"></span>
                </form>
            </div>
        </div>
    </header>
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>cart list</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

  <!--================Cart Area =================-->
  <section class="cart_area section_padding">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
        <form method="post"
					action="${pageContext.request.contextPath }/cart/update">
          <table class="table">
            <thead>
              <tr>
              	<th scope="col">Action</th>
              	<th scope="col">ID</th>
                <th scope="col">Product Name</th>
                <th scope="col">Photo</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total</th>
              </tr>
            </thead>
            <c:set var="total" value="0"></c:set>
            <c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
							<c:set var="total"
								value="${total + item.product.price * item.quantity }"></c:set>
            <tbody>
              <tr>
                <td align="center"><a
									href="${pageContext.request.contextPath }/cart/remove/${i.index }">Remove</a>
								</td>
								<td>${item.product.id }</td>
								<td>${item.product.name }</td>
								<td><img
									src="${pageContext.request.contextPath }/resources/assets/user/images/${item.product.photo }"
									width="120" height="100"></td>
								<td>${item.product.price } $</td>
								<td><input type="number" min="1" value="${item.quantity }"
									name="quantities"></td>
               
                <td>
                  <h5>${item.product.price * item.quantity } $</h5>
                </td>
              </tr>
            </c:forEach>
              <tr class="bottom_button">
                <td>
                  <button type="submit" class="btn_1">Update Cart</button>
                  
                </td>
                <td></td>
                <td></td>
               
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td>
                  <h5>Subtotal</h5>
                </td>
                <td>
                  <h5>${total } $</h5>
                </td>
              </tr>
             
            </tbody>
          </table>
          </form>
          <div class="checkout_btn_inner float-right">
            <a class="btn_1" href="${pageContext.request.contextPath }/layout/home">Continue Shopping</a>
            <a class="btn_1 checkout_btn_1" href="${pageContext.request.contextPath }/cart/checkout">Proceed to checkout</a>
          </div>
        </div>
      </div>
  </section>



			
			
		


		<footer class="footer_part">
        <div class="footer_iner">
            <div class="container">
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-8">
                        <div class="footer_menu">
                            <div class="footer_logo">
                                <a href="index.html"><img src="${pageContext.request.contextPath}/resources/assets/template/img/logo.png" alt="#"></a>
                            </div>
                            <div class="footer_menu_item">
                                <a href="index.html">Home</a>
                                <a href="about.html">About</a>
                                <a href="product_list.html">Products</a>
                                <a href="#">Pages</a>
                                <a href="blog.html">Blog</a>
                                <a href="contact.html">Contact</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="social_icon">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-google-plus-g"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="copyright_part">
            <div class="container">
                <div class="row ">
                    <div class="col-lg-12">
                        <div class="copyright_text">
                            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright �<script>document.write(new Date().getFullYear());</script>2022 All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                            <div class="copyright_link">
                                <a href="#">Turms &amp; Conditions</a>
                                <a href="#">FAQ</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
        <!--::footer_part end::-->

    <!-- jquery plugins here-->
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/bootstrap.min.js"></script>
    <!-- magnific popup js -->
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/jquery.magnific-popup.js"></script>
    <!-- carousel js -->
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/jquery.nice-select.min.js"></script>
    <!-- slick js -->
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/contact.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/mail-script.js"></script>
    <!-- custom js -->
    <script src="${pageContext.request.contextPath}/resources/assets/template/js/custom.js"></script>
</body>

</html>
