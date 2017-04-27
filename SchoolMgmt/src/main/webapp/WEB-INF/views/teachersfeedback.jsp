
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
<link
	href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">

<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
            <div class="container-fluid">
               <div class="row">
                    <div class="col-lg-12">
                        <h4 class="page-header">
                            Teacher's Feedback
                        </h4>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="">Teacher's Feedback</a>
                            </li>
                           
                        </ol>
                    </div>
                </div>



		<div class="row" id="feedbackdiv">
			
		</div>
</div>
<script>
$(function() {
    <c:forEach items="${Feedback}"  var="fbItem" >
    
    newdiv = '<div class="col-md-4 col-md-offset-3">'+
    '<blockquote class="inner-block">'+
    '<span class="fa fa-3x fa-quote-right">'+'</span>'+
    '<p class="block-text">'+
     '${fbItem.feedbackcomments}' +
    '</p>'+
    '<hr>' +
    '<div>'+
        '<p class="pull-left">'+
        '${fbItem.submitter}' +  '</p>'+'<p class="pull-right">'+
            '<span class="badge">'+'${fbItem.submitdate}'+'</span>'+
        '</p>'+
    '</div>'+
'</blockquote>'+'</div>'

	$("#feedbackdiv").append(newdiv);
	
    </c:forEach>
    
})
</script>

</body>