      <%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <section class="breadcrumb_part single_product_breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                    </div>
                </div>
            </div>
        </div>
    </section>
  <div class="product_image_area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="product_img_slide owl-carousel">
          
            <div class="single_product_img">
              <img src="${pageContext.request.contextPath}/resources/assets/user/images/${product.photo }" alt="#" class="img-fluid">
            </div>
            <div class="single_product_img">
              <img src="${pageContext.request.contextPath}/resources/assets/user/images/${product.photo }" alt="#" class="img-fluid" >
            </div>
            <div class="single_product_img">
              <img src="${pageContext.request.contextPath}/resources/assets/user/images/${product.photo }" alt="#" class="img-fluid" >
            </div>
          </div>
        </div>
        
        <div class="col-lg-8">
          <div class="single_product_text text-center">
            <h1> ${product.name }</h1>
            <p>
                Description: ${product.description }
            </p>
            <div class="card_area">
                <div class="product_count_area">
                    <p>Price: &nbsp;</p>
                    <p>${product.price }</p>
                    <p>$</p>
                </div>
              <div class="add_to_cart">
                  <a href="${pageContext.request.contextPath }/cart/buy/${product.id }" class="btn_3">add to cart</a>
              </div>
            </div>
          </div>
        </div>
                <div class="col-lg-8">
          <div class="single_product_text text-center">
            <h1> Related Products</h1>
       
          </div>
        </div>
        <c:forEach var="product2" items="${products2 }">
                        <div class="col-lg-8">
          <div class="product_img_slide owl-carousel">
            <div class="single_product_img">
            <a href="${pageContext.request.contextPath}/layout/details/${product2.id }">
              <img src="${pageContext.request.contextPath}/resources/assets/user/images/${product2.photo }" alt="#" class="img-fluid">
              </a>
            </div>
            
       
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
  </div>





