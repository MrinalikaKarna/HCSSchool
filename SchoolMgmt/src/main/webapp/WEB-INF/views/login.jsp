
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false"%>

<html>
<head>


<link href="${pageContext.servletContext.contextPath}/css/login.style.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>


</head>
<body>
   <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src= "${pageContext.servletContext.contextPath}/images/loginuser.png"/>
            <p id="profile-name" class="profile-name-card">HCS School</p>
            <s:form class="form-signin" commandName="userLoginData" action="users/welcome" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <s:input path="mobilenumber" type="tel" id="inputTel" class="form-control" placeholder="Mobile Number" ></s:input><br>
                <s:input path="password" type="password" id="inputPassword" class="form-control" placeholder="Password" ></s:input>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
            </s:form><!-- /form -->
            <a href="#" class="forgot-password">
                Forgot the password?
            </a>
            <p id="loginFooter"> Copyright © 2016-2017. All rights reserved.<p>
            ${Failed}
        </div><!--/card-container -->
     
    </div>
 <script type="text/javascript">  
   $(document).ready(function(){
	   if('${Failed}'=='failed'){
		   alert("Enter correct details..");
	   }
   });
  </script> 
</body>
</html>