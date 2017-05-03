
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- <link -->
<%-- 	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css" --%>
<!-- 	rel="stylesheet"> -->
<link href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet">

<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>

<body>
    
        	<div class="container-fluid">
               <div class="row">
                    <div class="col-lg-12">
                        <h4 class="page-header">
                            Leaves and Attendance
                        </h4>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href=""> Leaves and Attendance</a>
                            </li>
                           
                        </ol>
                    </div>
                </div>
            
            <p> 
                <a href="<%=request.getContextPath() %>/users/attendancetracker?method=GET&param2=${UserDetails.userid}">
                <button data-toggle="modal" data-target="#newsModal" class="btn btn-squared-default btn-primary">
                    <i class="fa fa-tasks fa-2x"></i>
                    <br />
                    Attendance<br/>
                     Tracker
                </button>
                </a>
                <button data-toggle="modal" data-target="#eventModal" class="btn btn-squared-default btn-primary">
                    <i class="fa fa-calendar fa-2x"></i>
                    <br />
                    Apply<br/>
                     Leaves
                </button>
                <button data-toggle="modal" data-target="#eventModal" class="btn btn-squared-default btn-primary">
                    <i class="fa fa-calendar fa-2x"></i>
                    <br />
                    Leave<br/>
                    Tracker
                </button>
                <button data-toggle="modal" data-target="#announcementModal" class="btn btn-squared-default btn-primary">
                    <i class="fa fa-bullhorn fa-2x"></i>
                    <br />
                    Yearly <br/>
                    Leaves 
                </button>

            </p>
       
    </div>     


</body>


</html>