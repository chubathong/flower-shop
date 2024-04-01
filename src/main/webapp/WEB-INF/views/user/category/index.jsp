    <%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>product list</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->
        <section class="about_us padding_top">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="about_us_content">
                        <h5><a href="${pageContext.request.contextPath }/layout/home">Home</a> &gt;Product
	&gt;${category.name }</h5>
                      
                        
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- product list part start-->
    <section class="trending_items">
        <div class="container">
           
                
                          <div class="row">
             <c:forEach var="product" items="${category.products }">
                <div class="col-lg-4 col-sm-6">
                    <div class="single_product_item">
                        <div class="single_product_item_thumb">
                          <a href="${pageContext.request.contextPath}/layout/details/${product.id }">  <img src="${pageContext.request.contextPath}/resources/assets/user/images/${product.photo }" alt="#" class="img-fluid"></a>
                        </div>
                        <h3> <a href="${pageContext.request.contextPath}/layout/details/${product.id }">${product.description } </a> </h3>
                        <p>From $ ${product.price }</p>
                    </div>
                </div>
                 </c:forEach>
                 
            </div>
            <div class="load_more_btn text-center">
                            <a href="#" class="btn_3">Load More</a>
                        </div>
           
        </div>
    </section>


