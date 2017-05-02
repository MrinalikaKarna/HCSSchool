<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
</head>
<body>
   <div class="container-fluid">
               <div class="row">
                    <div class="col-lg-12">
                        <h4 class="page-header">
                            Event Participants List
                        </h4>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="<%=request.getContextPath() %>/users/studentadmin?method=GET&param3=${UserDetails.userid}"> Students's Admin</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-bar-chart-o"></i> Event Participants
                            </li>
                           
                        </ol>
                    </div>
                </div>
                
                <table class="table table-bordered">
					<c:forEach items="${EventTitleList}" var="etlist" varStatus="i">
					<tr>
					<td>${etlist}</td>
					    <c:forEach items="${EventParticipantsList}" var="epdetails" varStatus="i">
					      <c:if test="${etlist==epdetails.newsEvent.title}"> 
					        <tr>
					          <td id="participantid" >${epdetails.participantid}</td>
						      <td id="newsid" >${epdetails.newsEvent.newsid}</td>
						      <td id="userid" >${epdetails.userDetails.userid}</td>
						      <td>${epdetails.userDetails.firstname} ${epdetails.userDetails.lastname}</td>
						      <td>${epdetails.userDetails.classDetails.classname}</td>
						      <td><input type="submit" name="Approve" id="#approve"
						class="approveBtn btn btn-info" value="Approve"></td>
					        </tr>
					       </c:if>
					    </c:forEach>
					</tr>	
                    </c:forEach>
                    </table>
                    
          </div>
<script type="text/javascript">

$(document).ready(function() {
	$(".approveBtn").click(function(){
//		alert($(this).closest('tr').find('#participantid').text());
     	var reference = $(this)
        $.ajax({
        	type:"POST",
            url:"approveparticipation",
            data: JSON.stringify({
     		  "userDetails":{'userid':$(this).closest('tr').find('#userid').text()},
     		  "newsEvent":{'newsid':$(this).closest('tr').find('#newsid').text()},
     		  "participantid":$(this).closest('tr').find('#participantid').text()
   			   }),
            dataType: "json",
             contentType: "application/json",
            
            success:function(response){
            	$(reference).closest('tr').find('.approveBtn').val("Approved");
            },
            failure: function(response){
               alert(response.message);
               
            }
        });
	
 	});
	
})

</script>
</body>
</html>