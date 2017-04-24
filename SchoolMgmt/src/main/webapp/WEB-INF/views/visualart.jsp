<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet">
<link
	
	rel="stylesheet">
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/customstyle.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
   
</head>
<body>
<div class="container">
    <div class="row">
    <div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-heading">
           
            <h4 class="text-center"><button class="btn btn-primary pull-left">
                    <span class="glyphicon glyphicon-home " aria-hidden="true"></span></button>Visual Art Compilation <button data-toggle="modal" data-target="#visualArtUploadModal" class="btn btn-primary pull-right">
                    <span class="glyphicon glyphicon-cloud-upload " aria-hidden="true"></span></button></h4>
        </div>
        
        
    </div>

          
        </div></div>
        <div id="imagebody">

            
        </div>

    </div>
    
     <div class="modal fade alert" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true"> 
      <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                        <h4 class="modal-title" id="myLargeModalLabel-1"></h4>
                    </div>
                    <div class="modal-body active">
                        <img src="" class="imagepreview img-responsive img-rounded center-block" alt="" />
                    </div>
                </div>
        </div>
    </div> 


<div class="modal fade alert" id="visualArtUploadModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="lineModalLabel"><i class="fa fa-tasks fa-1x"></i> Upload your File</h4>
        </div>
        <div class="modal-body">
            <div align="center">
             <form method="post" action="visualart/doUpload" enctype="multipart/form-data">
                <table border="0">
                <tr>
                    <td>Pick file #1:</td>
                    <td><input type="file" name="fileUpload" size="50" /></td>
                </tr>
                
                <tr>
                    <td>Pick file #2:</td>
                    <td><input type="file" name="fileUpload" size="50" /></td>
                </tr>
                 
                <tr>
                <td> 
                <input name="userid" type="hidden" value='${UserDetails.userid}'/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Upload" /></td>
                </tr>
            </table>
        </form>
        </div>
        </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$(function() {
	
    <c:forEach items="${ImageList}" var="myImage" varStatus="i" >
   
    newdiv = '<div class="col-md-3">' + '<div class="well">' + '<a href="#" class="showme">' + '<img alt="Bootstrap template" src= "data:image/jpeg;base64,${myImage}" width="200" height="150" />'
    + '</a>'+ '<h5 id="myheader">' + '${VisualData[i.index].userDetails.firstname} ${VisualData[i.index].userDetails.lastname}' + '</h5>' + '<h5>' + '${VisualData[i.index].userDetails.classDetails.classname}' 
    + '</h5>' + '</div>' + '</div>' 

	$("#imagebody").append(newdiv);
    

    </c:forEach>
    
    $('a.showme').on('click', function(){
    	var mytext=$(this).find('h5.myheader').text();
    	$('.imagepreview').attr('src', $(this).find('img').attr('src'));
    	$('.modal-title').html($("#myheader").html());
        $('#imgModal').modal('show');
      
    })
    
    
   
    
})
</script>
</body>
</html>