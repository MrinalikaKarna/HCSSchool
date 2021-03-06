
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link
	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="http://www.prepbootstrap.com/Content/shieldui-lite/dist/css/light/all.min.css" />
</head>
<body>
	<div class="container-fluid">
               <div class="row">
                    <div class="col-lg-12">
                        <h4 class="page-header">
                            Teacher's Administration Activities
                        </h4>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href=""> Teacher's Admin</a>
                            </li>
                           
                        </ol>
                    </div>
                </div>
            
            <p> 
                <a href="<%=request.getContextPath() %>/users/adduserdetails?method=GET&param2=${UserDetails.userid}">
                <button data-toggle="modal" class="btn btn-squared-default btn-primary"> <i class="fa fa-user-plus fa-2x"></i>
                    <br/>
                    Add<br/>
                     User
                </button></a>
                <a href="<%=request.getContextPath() %>/users/uploadmarks?method=GET&param2=${UserDetails.userid}">
                <button data-toggle="modal" class="btn btn-squared-default btn-primary">
                   <i class="fa fa-table fa-2x"></i>
                    <br />
                    Upload<br/>
                     Marks
                </button></a>
                  <a href="<%=request.getContextPath() %>/users/feedbacksheet?method=GET&param2=${UserDetails.userid}">
                <button data-toggle="modal" class="btn btn-squared-default btn-primary">
                   <i class="fa fa-pencil-square fa-2x"></i>
                    <br />
                    Write<br/>
                    Feedback
                </button></a>
                <a href="<%=request.getContextPath() %>/users/uploadmarks?method=GET&param2=${UserDetails.userid}">
                <button data-toggle="modal" class="btn btn-squared-default btn-primary">
                   <i class="fa fa-check fa-2x"></i>
                    <br />
                    Approve<br/>
                     Leaves
                </button></a>
                <a href="<%=request.getContextPath() %>/users/attendancesheet?method=GET&param2=${UserDetails.userid}">
                <button data-toggle="modal" class="btn btn-squared-default btn-primary">
                   <i class="fa fa-bars fa-2x"></i>
                    <br />
                    Atten-<br/>
                     dance
                </button></a>

            </p>
       
    </div>    
</body>
</html>