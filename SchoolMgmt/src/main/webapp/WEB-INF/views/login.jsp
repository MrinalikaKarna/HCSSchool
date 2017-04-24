
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>

<html>
<head>
<title>Login Page</title>


<link href="${pageContext.servletContext.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<body>

	<div class="main">


		<div class="logincontainer">
				<div class="middle">
					<div id="login">

						<s:form commandName="userLoginData" action="users/welcome" method="post">

							<fieldset class="clearfix">

								<p>
									<span class="fa fa-user"></span>
									<s:input path="mobilenumber" type="tel"
										Placeholder="MobileNumber"/>
								</p>
								
								<p>
									<span class="fa fa-lock"></span>
									<s:input path="password" type="Password"
										Placeholder="Password"/>
								</p>
								

								<div>
								<span
										style="width: 50%; text-align: right; display: inline-block;"><input
										type="submit" value="Sign In"></span>
								</div>

							</fieldset>
							<div class="clearfix"></div>
						</s:form>

						<div class="clearfix"></div>

					</div>
					<!-- end login -->
					<div class="logo">
						<img alt="" src="${pageContext.servletContext.contextPath}/images/Applelogo.png">
					</div>

				</div>
		</div>

	</div>

	<!-- <div class="aa"> -->

	<%-- <img src="<spring:url value="/images/Applelogo.png"/>"/> --%>


	<!-- <h4>ABC School</h4><br> -->

	<%-- <s:form commandName="userLoginData" action="users/welcome" method="post"> --%>
	<%--  <s:input path="mobilenumber" type="tel" placeholder="Mobile Number"/><br><br> --%>
	<%--  <s:input path="password" type="Password" placeholder="Password"/><br><br> --%>
	<!--  <input type="submit" value="Login"/> -->
	<%--  </s:form> --%>

	<!-- </div> -->

</body>
</html>