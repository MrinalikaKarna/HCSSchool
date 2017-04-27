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
		<div class="input-group" id="searchBtn">
			<input type="text" class="form-control" placeholder="Search"
				name="srch-term" id="srch-term">
			 <div class="input-group-btn">
				<button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				</button>
			</div>
		</div>


		<a href="<%=request.getContextPath()%>/users/Hello?method=GET" class="list-group-item" id="menu1" >
				    <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> News n' Events </a>
					<a href="<%=request.getContextPath() %>/users/myprofile?method=GET&param1=${UserDetails.userModel.mobilenumber}" class="list-group-item" id="menu2">
					 <span class="glyphicon glyphicon-user" aria-hidden="true" ></span> My Profile </a>
					 <a href="<%=request.getContextPath() %>/users/reportcard?method=GET&param2=${UserDetails.userid}" class="list-group-item" id="menu3">
						<span class="glyphicon glyphicon-education" aria-hidden="true"></span> Report Card</a> 
					<a href="<%=request.getContextPath() %>/users/leaves?method=GET&param3=${UserDetails.userid}" class="list-group-item" id="menu4">
						<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> Leaves and Calendar</a>
					<a href="<%=request.getContextPath() %>/users/leaves?method=GET&param3=${UserDetails.userid}" class="list-group-item" id="menu8">
						<span class="glyphicon glyphicon-th" aria-hidden="true"></span> Time Table</a>
					<a href="<%=request.getContextPath() %>/users/teachersfeedback?method=GET&param3=${UserDetails.userid}" class="list-group-item" id="menu9">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span> Teacher's Feedback</a>
					<a href="<%=request.getContextPath() %>/users/leaves?method=GET&param3=${UserDetails.userid}" class="list-group-item" id="menu10">
						<span class="glyphicon glyphicon-tower" aria-hidden="true"></span> My Achievements</a>
					<a href="<%=request.getContextPath() %>/users/leaves?method=GET&param3=${UserDetails.userid}" class="list-group-item" id="menu11">
						<span class="glyphicon glyphicon-flag" aria-hidden="true"></span> Activity Tracker</a>
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
    $('#menu2').css('background-color','#155255') 
  break; 
 case "reportcard":
   $('#menu3').css('background-color','#155255') 
	break;
 case "Leaves":
   $('#menu4').css('background-color','#155255') 
   break;
 case "News":
   $('#menu1').css('background-color','#155255') 
	break;
 case "StudentAdmin":
    $('#menu5').css('background-color','#155255') 
	break;
 case "TeacherAdmin":
	$('#menu6').css('background-color','#155255') 
	break;
 case "SupportAdmin":
    $('#menu7').css('background-color','#155255') 
	break;
 case "TeachersFeedback":
    $('#menu9').css('background-color','#155255') 
	break;
 }
});

 </script> 

<script>

</script>




</body>
</html>
