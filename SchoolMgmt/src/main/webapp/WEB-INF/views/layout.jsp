<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>ABC School</title>


    <link href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.servletContext.contextPath}/css/customstyle.css" type="text/css" rel="stylesheet">
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/scripts.js"></script>
    

  </head>
  <body>


    <div class="container-fluid" id = "baselayout">
	<div class="row">
		<div class="col-md-12">
		
		<tiles:insertAttribute name="header" />
		</div>
		
	</div>
	<div class="row" id="contentbody">
		<div class="col-md-2">
		<tiles:insertAttribute name="menu" />
		</div>
		<div class="col-md-10"  id="scrollcontent">
		<tiles:insertAttribute name="body" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
		<div class="footer">
		<tiles:insertAttribute name="footer" />
		</div>
		</div>
	</div>
</div>

    
<script>
   

</script>
  </body>
</html>







<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->

<!-- <title>ABC School</title> -->
<%-- <link href="${pageContext.servletContext.contextPath}/css/layoutstyle.css" rel="stylesheet" type="text/css" /> --%>

<!-- </head> -->
<!-- <body> -->
<%-- <tiles:insertAttribute name="header" /> --%>
<!--  <div class="main"> -->
<%--   <tiles:insertAttribute name="menu" /> --%>
<!--   <div class="rightPane"> -->
<%--    <tiles:insertAttribute name="body" /> --%>
<!--   </div> -->
<!--  </div> -->
<%-- <tiles:insertAttribute name="footer" /> --%>
 
<!-- </body> -->
<!-- </html> -->