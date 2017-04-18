
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
<link href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet">

<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
	<div>
		<div class="input-group">
			<label>Class </label> <select name="InputClassDetails"
				id="InputClassDetails">
				<c:forEach var="classd" items="${ClassDetails}">
					<option value="${classd.classid}" label="${classd.classname}" />
				</c:forEach>

			</select>
		</div>
        ${classd.classname}
		<div class="input-group">
			<label>Exam </label> <select name="InputExamDetails"
				id="InputExamDetails">
				<c:forEach var="examd" items="${ExamDetails}">
					<option value="${examd.examid}" label="${examd.examname}" />
				</c:forEach>

			</select>
		</div>
		<input name="userid" id="userid" value='${UserDetails.userid}'/>
		<br>
		
		<input type="submit" name="result" id="result" value="Get Result"
									class="resultBtn"/>

	</div>
	
<table id="myTable">
    <thead>
        <tr>
            <th>Subject</th>
            <th>Marks</th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>
	
	<script>        
   $(document).ready(function() {
     $("#result").click(function(){
    	 
        $.ajax({
        	type:"POST",
            url:"getResultDetails",
           data:JSON.stringify({'userid':$('#userid').val(),'examid':$('#InputExamDetails').val(),'classid':$('#InputClassDetails').val()}),
           dataType: "json",
           contentType: "application/json",
           success:function(response){
              alert(response.MarksDetails.hindi);
              var resData = {"English":"Value2" , "Hindi":"Value2" , "Maths":"Value3" , "Science":"Value4",
          			"Social Studies":"Value2" ,"Sanskrit":"Value2" },
              $tbody = $('#myTable').find('tbody');

          JSON.parse(resData, function (k, v) {
              $tbody.append('<tr><td>'+k+'</td><td>'+v+'</td></tr>');
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