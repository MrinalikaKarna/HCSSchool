
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Student Details</title>
<link
	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet">

<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="panel panel-default">
<!-- 		<div class="panel-heading main-color-bg"> -->
<!-- 			<h2 class="panel-title">My Report Card</h2> -->
<!-- 		</div> -->
		<div class="panel-body" align="center">
			<!-- 	<div class="row"> -->
			<div class="well">
				<div class="col-md-3">
					<label>Class </label> <select name="InputClassDetails"
						id="InputClassDetails">
						<c:forEach var="classd" items="${ClassDetails}">
							<option value="${classd.classid}" label="${classd.classname}" >${classd.classname}</selected>
						</c:forEach>

					</select>
				</div>

				<div class="col-md-3">
					<label>Exam </label> <select name="InputExamDetails"
						id="InputExamDetails">
						<c:forEach var="examd" items="${ExamDetails}">
							<option value="${examd.examid}" label="${examd.examname}">${examd.examname}</selected>
						</c:forEach>

					</select>
				</div>
				<input name="userid" id="userid" type="hidden"
					value='${UserDetails.userid}' />

				<div class="col-md-6">
					<input class="col-md-3 btn-default active" type="submit"
						name="result" id="result" value="Get Result" />
				</div>
				<br>

			</div>
			<!-- 	</div> -->


			<table class="table table-striped" id="myTable">
				
			</table>
		</div>
	</div>

	<script>        
   $(document).ready(function() {
     $("#result").click(function(){
    	 $('#myTable').empty();
        $.ajax({
        	type:"POST",
            url:"getResultDetails",
           data:JSON.stringify({'userid':$('#userid').val(),'examid':$('#InputExamDetails').val(),'classid':$('#InputClassDetails').val()}),
           dataType: "json",
           contentType: "application/json",
           success:function(response){
              newdiv = '<tbody>'+'<tr>'+'<td>' +  'English:' + '</td>' + '<td>' +response.MarksDetails.english + '</td>' + '</tr>'
              +'<td>' + 'Hindi:' + '</td>' + '<td>' + response.MarksDetails.hindi + '</td>' + '</tr>'
              +'<td>' + 'Maths:' + '</td>' + '<td>' + response.MarksDetails.maths + '</td>' + '</tr>'
              +'<td>' + 'Science:' + '</td>' + '<td>' + response.MarksDetails.science + '</td>' + '</tr>'
              +'<td>' + 'Social Studies:' + '</td>' + '<td>' + response.MarksDetails.socialstudies + '</td>'
              + '</tr>' +'<td>' + 'Sanskrit:' + '</td>' + '<td>' + response.MarksDetails.sanskrit + '</td>' + '</tr>' + '</tbody>',
              $('#myTable').append(newdiv);

          JSON.parse(resData, function () {
        	  alert(response.message);
          });
             
            },
            failure: function(response){
            	
                alert(response.message);
               
            }
        });
    });
});             
</script>

</body>