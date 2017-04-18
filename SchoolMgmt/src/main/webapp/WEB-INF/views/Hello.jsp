<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello Page</title>
<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.servletContext.contextPath}/css/customcss.css"
	rel="stylesheet">
	
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
	
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/scripts.js"></script>
</head>

<body>
<div>
    <div class="col-md-3">
        
            <div class="col-xs-12" id="announcementdiv">
             <h4>Announcements</h4>

        </div>
    </div>
    <div class="col-md-9">
            <div class="col-xs-12" id="newseventdiv">
              <h4>News n' Events</h4>
       
        </div>

    </div>
</div>

<script type="text/javascript">
$(function() {
    <c:forEach items="${NewsEventData}"  var="myItem" >
    if ('${myItem.category}'=="Announcement"){
    newdiv = '<div class="panel panel-default">' + '<div class="panel-heading">' + '<h5>' + '<i class="fa fa-bullhorn fa-1x">' + '</i>' + '  ' + '${myItem.title}' + '</h5>' 
	+ '</div>' + '<div class="panel-body">' + '${myItem.content}' + '</div>' +
	'<div class="text-center">' + '<a href="#">' + '<span class="glyphicon glyphicon-plus">' +
	'</span>' + 'Full Story' + '</a>' + '</div>' + '</div>';
	$("#announcementdiv").append(newdiv);
	}else if('${myItem.category}'=="Event") {
	 newdiv = '<div class="well">' + '<h4>' + '<i class="fa fa-calendar fa-1x">' + '</i>' + '  ' + '${myItem.title}' + '</h4>' + '<h5>' + '${myItem.fromdate}' + '</h5>' + '<p>' +
	 '${myItem.content}' + '</p>' + '<div class="text-center">'  + '<a href="#">' + '<span class="glyphicon glyphicon-plus">' +
	 '</span>' + 'Full Story' + '</a>' + '</div>' + '</div>';
	 $("#newseventdiv").append(newdiv);	
	}else{
		newdiv = '<div class="well">' + '<h4>' + '<i class="fa fa-tasks fa-1x">' + '</i>' + '  ' + '${myItem.title}' + '</h4>' + '<p>' +
		 '${myItem.content}' + '</p>' + '<div class="text-center">'  + '<a href="#">' + '<span class="glyphicon glyphicon-plus">' +
		 '</span>' + 'Full Story' + '</a>' + '</div>' + '</div>';
		 $("#newseventdiv").append(newdiv);
	}
    
    </c:forEach>
    
})
</script>
	
</body>
</html>