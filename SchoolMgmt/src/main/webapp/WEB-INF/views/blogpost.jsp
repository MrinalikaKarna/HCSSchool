<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
 rel="stylesheet" type="text/css" href="https://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
    <script src="https://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
   
</head>
<body>
<div class="container">
    <div class="row">
    <div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-heading">
<!--             <h4></h4> -->
            <h4 class="text-center"><button class="btn btn-primary pull-left">
                    <span class="glyphicon glyphicon-home " aria-hidden="true"></span></button> Your Blogpost <button data-toggle="modal" data-target="#blogPostUploadModal" class="btn btn-primary pull-right">
                    <span class="glyphicon glyphicon-cloud-upload " aria-hidden="true"></span></button></h4>
        </div>
        
        
    </div>

          
        </div></div>
        <div id="blogpostbody">

         </div>
            
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


<div class="modal fade alert" id="blogPostUploadModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="lineModalLabel"><i class="fa fa-tasks fa-1x"></i>Submit New Blogpost</h4>
        </div>
        <div class="modal-body">
        <div align="center">
        
            <s:form commandName="BlogDetails" method="post" action="visualart/doSubmitBlogpost" >
                <table border="0">
                <tr>
                    <s:input path="blogtitle" type="text" class="form-control" placeholder="Title"/>
                </tr>
                <br>
                <tr>
                    <s:textarea path="blogbody" id="editor" cols="30" rows="10" placeholder="Submit your text post here..."></s:textarea>
                </tr>
                    <s:input path="userDetails.userid" name="userid" type="hidden" value='${UserDetails.userid}'/>
                 <br>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Submit New Post" /></td>
                </tr>
            </table>
        </s:form>
        
          
        
         </div>
      </div>
    </div>
  </div>
</div>

   <div class="modal fade alert" id="blogModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true"> 
      <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                        <h4 class="modal-title" id="myLargeModalLabel-1"></h4>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                </div>
        </div>
    </div> 

<script>

$(function () {
	$("#editor").shieldEditor({
        height: 260
    });
	
    <c:forEach items="${BlogPostDetail}"  var="blogItem" >
    
    newdiv = '<div class="panel panel-default">' + '<div class="panel-heading">' + '<h5 id="blogtitle">' + '${blogItem.blogtitle}' + '</br>' +
    '${blogItem.userDetails.firstname}' + '</h5>' 
	+ '</div>' + '<div class="panel-body" id="blogbody">' + '${blogItem.blogbody}' + '</div>' +
	'<div class="text-center">' + '<a href="#" class="showme">' + '<span class="glyphicon glyphicon-plus">' +
	'</span>' + 'Full Story' + '</a>' + '</div>' + '</div>';
	$("#blogpostbody").append(newdiv);

    </c:forEach>


    $("a.showme").click(function(){
        $('.modal-title').html($("#blogtitle").html());
        $('.modal-body').html($("#blogbody").html());
        $('#blogModal').modal('show');
    });

    
    
    
})
</script>


</body>
</html>