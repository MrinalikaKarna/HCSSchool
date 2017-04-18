<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">




<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/css/jquery.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet">

    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/scripts.js"></script>
</head>

<body>
<div id="menubody">

	
				    <a href="<%=request.getContextPath() %>/users/Hello?method=GET" class="list-group-item" id="menu1" >
				    <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> News n' Events </a>
					<a href="<%=request.getContextPath() %>/users/myprofile?method=GET&param1=${UserDetails.userModel.mobilenumber}" class="list-group-item" id="menu2">
					 <span class="glyphicon glyphicon-user" aria-hidden="true" ></span> My Profile </a>
					 <a href="<%=request.getContextPath() %>/users/reportcard?method=GET&param2=${UserDetails.userid}" class="list-group-item" id="menu3">
						<span class="glyphicon glyphicon-education" aria-hidden="true"></span> Report Card</a> 
					<a href="<%=request.getContextPath() %>/users/leaves?method=GET&param3=${UserDetails.userid}" class="list-group-item" id="menu4">
						<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Leaves and Calendar</a>
					<a href="<%=request.getContextPath() %>/users/studentadmin?method=GET&param3=${UserDetails.userid}" class="list-group-item" id="menu5">
						<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Student's Admin Activities</a>
					<a href="<%=request.getContextPath() %>/users/teacheradmin?method=GET&param3=${UserDetails.userid}" class="list-group-item" id="menu6">
						<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Teacher's Admin Activities</a>
					<a href="<%=request.getContextPath() %>/users/supportadmin?method=GET&param3=${UserDetails.userid}" class="list-group-item" id="menu7">
						<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Support's Admin Activities</a>
						 
			
			</div> 



 

<!-- //Hide menu according to user role... Activate below code when needed... Below code was successful.. -->

<%-- // switch("${UserDetails.userrole}") { --%>
<!-- // case "Teacher": -->
<!-- //     $('#menu3') -->
<!-- //     .css('display','none') -->
<!-- //  break; -->
<!-- // case "Student": -->
<!-- //     $('#menu5') -->
<!-- //     .css('display','none') -->
<!-- //  break; -->
<!-- // default: -->
<!-- //  break; -->
<!-- // } -->

<script type="text/javascript">
$(document).ready(function(){ 
switch("${MenuStatus}") {
 case "myprofile":
    $('#menu2').css('background-color','grey') 
  break; 
 case "reportcard":
   $('#menu3').css('background-color','grey') 
	break;
 case "Leaves":
   $('#menu4').css('background-color','grey') 
   break;
 case "News":
   $('#menu1').css('background-color','grey') 
	break;
 case "StudentAdmin":
    $('#menu5').css('background-color','grey') 
	break;
 case "TeacherAdmin":
	$('#menu6').css('background-color','grey') 
	break;
 case "SupportAdmin":
    $('#menu7').css('background-color','grey') 
	break;
 }
});

 </script> 

<script>

</script>




</body>
</html>
