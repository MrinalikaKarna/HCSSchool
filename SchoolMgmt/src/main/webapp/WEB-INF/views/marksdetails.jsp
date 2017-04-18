
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
<link href="${pageContext.servletContext.contextPath}/css/customcss.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
</head>

<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>

<body>



		<div >
			


					<div class="input-group">
						<label>Year </label>
						<select name="InputYearDetails" id="InputYearDetails">
							<c:forEach var="yeard" items="${YearDetails}">
								<option value="${yeard.yearid}" label="${yeard.yearid}" />
							</c:forEach>

						</select>
					</div>

					<div class="input-group">
						<label>Exam </label>
						<select name="InputExamDetails" id="InputExamDetails">
							<c:forEach var="examd" items="${ExamDetails}">
								<option value="${examd.examid}" label="${examd.examname}"  />
							</c:forEach>

						</select>
					</div>
					<table>
					<c:forEach items="${StudentDetails}" var="sdetails" varStatus="i">
					<tr id="${i.index}">
						<td><input name="userid" id="userid" value='${sdetails.userid}' readonly="readonly"></td>
						<td><input name="firstname" id="firstname" value='${sdetails.firstname}' readonly="readonly" /></td>
						<td><input name="lastname" id="lastname" value='${sdetails.lastname}' readonly="readonly" /></td>
						<td><input name="classname" id="classname" value='${sdetails.classDetails.classid}' readonly="readonly" /></td>
						<td><input id="english" name="english" type="text" value=0></td>
						<td><input id="hindi" name="hindi" type="text" value=0></td>
						<td><input id="maths" name="maths" type="text" value=0></td>
						<td><input id="science" name="science" type="text" value=0></td>
						<td><input id="socialstudies" name="socialstudies" type="text" value=0></td>
						<td><input id="sanskrit" name="sanskrit" type="text" value=0></td>
						<td><input type="submit" name="Update" id="Update" class="updateBtn" value=${i.index }></td>
					 	
					</tr>
						
                    </c:forEach>
                    </table>
					
					
			
			
		</div>

<script>        
   $(document).ready(function() {

	   
     $(".updateBtn").click(function(){

        $.ajax({
        	type:"POST",
            url:"addmarksdetails",
            data: JSON.stringify({
     		   'userDetails':{'userid':$(this).closest('tr').find('#userid').val()},'examDetails':{'examid':$('#InputExamDetails').val()},
              	'yearDetails':{'yearid':$('#InputYearDetails').val()},
              	'classDetails':{'classid':$(this).closest('tr').find('#classname').val()},'english':$(this).closest('tr').find('#english').val(),
              	'hindi':$(this).closest('tr').find('#hindi').val(),
              	'maths':$(this).closest('tr').find('#maths').val(),
              	'science':$(this).closest('tr').find('#science').val(),
              	'socialstudies':$(this).closest('tr').find('#socialstudies').val(),
              	'sanskrit':$(this).closest('tr').find('#sanskrit').val()
   			   }),
            dataType: "json",
            contentType: "application/json",
            
            success:function(response){
//                alert(response.message);
              $(reference).closest('tr').find('#Update').css('background-color', 'red');
             
            },
            failure: function(response){
               alert(response.message);
               
            }
        });
    });
});             
</script>
</body>
</html>