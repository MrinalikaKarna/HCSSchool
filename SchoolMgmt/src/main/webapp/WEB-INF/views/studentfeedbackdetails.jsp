
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
<link rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
</head>

<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h4 class="page-header">Write Feedback</h4>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a
						href="<%=request.getContextPath() %>/users/teacheradmin?method=GET&param3=${UserDetails.userid}">
							Teacher's Admin</a></li>
					<li><i class="fa fa-bar-chart-o"></i> <a
						href="<%=request.getContextPath() %>/users/feedbacksheet?method=GET&param3=${UserDetails.userid}">
							Select Class</a></li>
					<li class="active"><i class="fa fa-bar-chart-o"></i>
						Write Feedback</li>

				</ol>
			</div>
		</div>
<div class="well">
		<div class="row">
		
			<div class='col-md-2'>
				<div class="form-group ">
					<label class="control-label requiredField" for="fromdate">
						Select Date <span class="asteriskField"> * </span>
					</label>
					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-calendar"> </i>
						</div>
						<input class="form-control" id="datepicker"
							name="datepicker" placeholder="DD/MM/YYYY" type="date" />
					</div>
				</div>
			</div>
		</div>
		</div>


		<table class="table table-bordered">
			<thead class="thead-inverse">
				<tr>
					<th>Roll No.</th>
					<th>Name</th>
					<th>Class</th>
					<th>Feedback</th>
					<th>Submit</th>
				</tr>
			</thead>
			<c:forEach items="${StudentDetails}" var="sdetails" varStatus="i">
				<tr id="${i.index}">
					<td><input name="userid" id="userid"
						value='${sdetails.userid}' readonly="readonly"></td>
					<td><input name="name" id="name"
						value='${sdetails.firstname} ${sdetails.lastname}'
						readonly="readonly" /></td>
					<td><input name="classname" id="classname"
						value='${sdetails.classDetails.classid}' readonly="readonly" /></td>
					<td><textarea  name="Feedback" id="#feedback"
					    rows="3"></textarea></td>
					<td><input type="submit" name="Submit" id="#attendanceabsent"
						class="btn btn-primary" value="Submit"></td>
				</tr>

			</c:forEach>
		</table>


	</div>


	<script>        
   $(document).ready(function() {

	   
     $(".presentBtn").click(function(){
    	var reference = $(this)
        $.ajax({
        	type:"POST",
            url:"addattendancedetails",
            data: JSON.stringify({
     		  "userDetails":{'userid':$(this).closest('tr').find('#userid').val()},
     		   "date":$('#datepicker').val(),
       		  "attendancestatus":"P",	
   			   }),
            dataType: "json",
             contentType: "application/json",
            
            success:function(response){
             if (response.NullMessage=="ok"){
                $(reference).closest('tr').find('.presentBtn').css('background-color', 'green');}
             else if (response.NullMessage=="Enter Date First.."){
            	 alert(response.NullMessage);
             }
            },
            failure: function(response){
               alert(response.message);
               
            }
        });
    });
     
     $(".absentBtn").click(function(){
    	 var reference = $(this)
         $.ajax({
         	type:"POST",
             url:"addattendancedetails",
             data: JSON.stringify({
      		  "userDetails":{'userid':$(this).closest('tr').find('#userid').val()},
      		   "date":$('#datepicker').val(),
        		  "attendancestatus":"A",	
    			   }),
             dataType: "json",
              contentType: "application/json",
             
             success:function(response){
            	 if (response.NullMessage=="ok"){
            	     $(reference).closest('tr').find('.absentBtn').css('background-color', 'red');
            	     }
            	 else if (response.NullMessage=="Enter Date First.."){
            		 alert(response.NullMessage);
            	 }
             },
             failure: function(response){
                alert(response.message);
                
             }
         });
     });
});
   
   $.noConflict();
   jQuery( document ).ready(function( $ ){
           var date_input=$('input[name="datepicker"]'); 
           var container=$('#bootstrap-iso form').length>0 ? $('#bootstrap-iso form').parent() : "body";
           date_input.datepicker({
        	   format: 'dd/mm/yyyy',
               container: container,
               todayHighlight: true,
               autoclose: true,
           })

       })
</script>
</body>