<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<head>
<meta charset="ISO-8859-1">
<title>Add Account</title>
<script>
	$(function() {
		$("#birthday").datepicker();
	});
</script>
</head>


























    <!-- breadcrumb part start-->
    <section class="breadcrumb_part">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <h2>Register</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb part end-->

    <!--================login_part Area =================-->
    <section class="login_part section_padding ">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_text text-center">
                        <div class="login_part_text_iner">
                            <h2>New to our Shop?</h2>
                            <p>There are advances being made in science and technology
                                everyday, and a good example of this is the</p>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="login_part_form">
                        <div class="login_part_form_iner">
                            <h3>Welcome Back ! <br>
                                Please Sign up now</h3>
                            <s:form class="row contact_form" method="post" modelAttribute="account"
							action="${pageContext.request.contextPath }/layout/register" novalidate="novalidate">
                                <div class="col-md-12 form-group p_star">
                                    <s:input class="form-control" id="name" path="username" value=""
                                        placeholder="Username"/>
                                </div>
                                <div class="col-md-12 form-group p_star">
                                    <s:password  class="form-control" id="password" path="password" value=""
                                        placeholder="Password"/>
                                </div>
                                     <div class="col-md-12 form-group p_star">
                                    <s:input class="form-control" id="name" path="fullName" value=""
                                        placeholder="Full Name"/>
                                </div>
                                   <div class="col-md-12 form-group p_star">
                                    <s:input class="form-control" id="birthday" path="birthday" value=""
                                        placeholder="birthday"/>
                                </div>
                                    <div class="col-md-12 form-group p_star">
                                    <label class="form-check-label"><strong>Gender:</strong></label> <br>&nbsp;&nbsp;&nbsp;&nbsp;
									<s:radiobutton class="form-check-input" path="gender" value="female"/>Female &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<s:radiobutton class="form-check-input" path="gender" value="male"/>Male
                                    
                                </div>
                                <div class="col-md-12 form-group">
                                    <div class="creat_account d-flex align-items-center">
                                        <input type="checkbox" id="f-option" name="selector">
                                        <label for="f-option">Remember me</label>
                                    </div>
                                    <button type="submit" value="submit" class="btn_3">
                                        Register
                                    </button>
                                    <a class="lost_pass" href="#">forget password?</a>
                                </div>
                            </s:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
