<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/scripts.js"></script>

   

  </head>
  <body >


    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse" >
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Work Station</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav">
            <li id="Tab1"><a href="<%=request.getContextPath() %>/users/Hello?method=GET">My Site</a></li>
            <li id="Tab2"><a href="#about">Image Gallery</a></li>
            <li id="Tab3"><a href="<%=request.getContextPath() %>/users/creativecorner?method=GET&param1=${UserDetails.userid}">Creative Corner</a></li>
            <li id="Tab4"><a href="#about">Forums</a></li>
            
          </ul>
          
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Welcome, ${UserDetails.firstname} ${UserDetails.lastname}</a></li>
            <li><a href="<%=request.getContextPath() %>/users/logout">Log Out</a></li>
          </ul>
        </div>
    </nav>
    
    <div id="header" class="col-md-12">

          <div class="col-md-10">
             <h2><span class="glyphicon glyphicon-book" aria-hidden="true"></span>  ABC School  <small>Education first</small></h2>
          </div>
<!--          <div class="col-md-2">  -->
<!-- 					<form class="navbar-form" role="search"> -->
<!-- 						<div class="input-group"> -->
<!-- 							<input type="text" class="form-control" placeholder="Search" -->
<!-- 								name="srch-term" id="srch-term"> -->
<!-- 							<div class="input-group-btn"> -->
<!-- 								<button class="btn btn-default" type="submit"> -->
<!-- 									<i class="glyphicon glyphicon-search"></i> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 				</div> -->
        
 
 
      
    </div>
<!--     </div> -->

    

    
<script type="text/javascript">
$(document).ready(function(){ 
switch("${TabStatus}") {
 case "hello":
    $('#Tab1').css('background-color','#092324') 
  break; 
 case "creativecorner":
   $('#Tab3').css('background-color','#092324')
	break;
  };

  
  $(".navbar-toggle").click(function(event) {
	  $(".navbar-collapse").toggle('hide');
	  });
});



 </script> 

</body>
  </html>