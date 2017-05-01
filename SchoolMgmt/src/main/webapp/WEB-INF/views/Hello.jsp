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
	href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet">
	
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
	
    <script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/scripts.js"></script>
</head>

<body>
 <div id="page-wrapper">

            <div class="container-fluid">
               <div class="row">
                    <div class="col-lg-12">
                        <h4 class="page-header">
                            News, Events and Announcements
                        </h4>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="">News n' Events</a>
                            </li>
                           
                        </ol>
                    </div>
                </div>

    <div class="col-md-3">
         <div class="col-xs-12" id="announcementdiv">
        </div>
    </div>
    <div class="col-md-9">
         <div class="col-xs-12" id="newseventdiv">
    </div>

    </div>
</div>
</div>

  <div class="modal fade alert" id="EventModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true"> 
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
    
      <div class="modal fade alert" id="NewsModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true"> 
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

<script type="text/javascript">
$(function() {
    <c:forEach items="${NewsEventData}"  var="myItem" varStatus="i">
    if ('${myItem.category}'=="Announcement"){
    newdiv = '<div class="panel panel-default">' + '<div class="panel-heading ">' + '<h5 class="announcement">' + '<i class="fa fa-bullhorn fa-1x">' + '</i>' +
    '  ' + '${myItem.title}' + '</h5>' 
	+ '</div>' + '<div class="panel-body">' + '${myItem.content}' + '</div>' +
	'<div class="text-center">' + '</div>' + '</div>';
	$("#announcementdiv").append(newdiv);
	}else if('${myItem.category}'=="Event") {
	 newdiv = '<div class="well">' + '<h4 class="eventtitle">' + '<i class="fa fa-calendar fa-1x">' + '</i>' + '  ' + '${myItem.title}' + '</h4>' +
	 '<p>' + '<b>' + 'Event Dates: ' + '</b>' + '${myItem.fromdate}' + '</p>'
	  + '<p>' + '<b>' + 'Event Details: ' + '</b>' + '${myItem.content}' + '</p>'
	  + '<p>' + '<b>' + 'Eligibility: ' + '</b>' + '${myItem.eligibility}' + '</p>'
	  + '<p hidden id="NewsId">' + '${myItem.newsid}' + '</p>'
	  + '<p hidden id="UserId">' + '${UserDetails.userid}' + '</p>'
	  + '<div class="text-left">' + '<b>' + 'Click here to participate..  ' + '</b>' +
	  '<a href="#" class="participateEvent btn btn-info">' + 'Participate' + '</a>' + '</div>' + '</div>';
	 $("#newseventdiv").append(newdiv);	
	}else{
		newdiv = '<div class="well">' + '<h4 class="newstitle">' + '<i class="fa fa-newspaper-o fa-1x">' + '</i>' + '  ' + '${myItem.title}' + '</h4>' +
		'<h5 class="bytitle">' + 'By: ' + '${myItem.userDetails.firstname}' + " " + '${myItem.userDetails.lastname}'
		+ '</h5>' +
		'<p class="newsbody">' +
		jQuery.trim('${myItem.content}').substring(0, 80).trim(this) + '..' + '</p>' +
		'<div class="body-hidden">' + ('${myItem.content}') + '</div>' + 
		'<div class="text-center">'  + '<a href="#" class="showmeNews">' + '<span class="glyphicon glyphicon-plus">' +
		 '</span>' + 'Full Story' + '</a>' + '</div>' + '</div>';
		 $("#newseventdiv").append(newdiv);
	}
    
    </c:forEach>
    
    $("a.showmeNews").click(function(){
      var newstitle = $(this).closest(".well").find('h4').text();
      $('.modal-title').html(newstitle); 
      var newsbody = $(this).closest(".well").find('.body-hidden').html();
      $('.modal-body').html(newsbody);
      $('#NewsModal').modal('show');
    });
    

    
    $("a.participateEvent").click(function(){
    	 $.ajax({
         	type:"POST",
             url:"addparticipantdetails",
             data: JSON.stringify({
      		   'userDetails':{'userid':$(this).closest('tr').find('#UserId').val()},
      		   'newsEvent':{'newsid':$(this).closest('tr').find('#NewsId').val()}
    			   }),
             dataType: "json",
             contentType: "application/json",
             
             success:function(response){
                 alert(response.message);
             },
             failure: function(response){
                alert(response.message);
                
             }
         });
    	 
    });
 
 });
    
//     $("a.showmeEvent").click(function(){
//         $('.modal-title').html($("#blogtitle").html());
//         $('.modal-body').html($("#blogbody").html());
//         $('#EventModal').modal('show');
//     });
    

</script>
	
</body>
</html>