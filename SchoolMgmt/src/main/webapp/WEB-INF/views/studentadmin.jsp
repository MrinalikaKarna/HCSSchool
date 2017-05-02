
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- <link -->
<%-- 	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css" --%>
<!-- 	rel="stylesheet"> -->
<link href="${pageContext.servletContext.contextPath}/css/customstyle.css"
	rel="stylesheet">

<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" /> -->
<link rel="stylesheet" type="text/css" href="http://www.prepbootstrap.com/Content/shieldui-lite/dist/css/light/all.min.css" />

<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>

<body>
    
        	<div class="container-fluid">
               <div class="row">
                    <div class="col-lg-12">
                        <h4 class="page-header">
                            Student's Administration Activities
                        </h4>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href=""> Student's Admin</a>
                            </li>
                           
                        </ol>
                    </div>
                </div>
            
            <p> 
                <button data-toggle="modal" data-target="#newsModal" class="btn btn-squared-default btn-primary">
                    <i class="fa fa-tasks fa-2x"></i>
                    <br />
                    Create<br/>
                     News
                </button>
                <button data-toggle="modal" data-target="#eventModal" class="btn btn-squared-default btn-primary">
                    <i class="fa fa-calendar fa-2x"></i>
                    <br />
                    Create<br/>
                     Event
                </button>
                <button data-toggle="modal" data-target="#announcementModal" class="btn btn-squared-default btn-primary">
                    <i class="fa fa-bullhorn fa-2x"></i>
                    <br />
                    Create <br/>
                    Announce- </br>
                    ment
                </button>
                <button data-toggle="modal" data-target="#myItemsModal" class="btn btn-squared-default btn-primary">
                    <i class="fa fa-folder fa-2x"></i>
                    <br />
                    My <br/>
                    Items
                </button>
                <a href="<%=request.getContextPath() %>/users/eventparticipants?method=GET&param2=${UserDetails.userid}">
                <button data-toggle="modal" class="btn btn-squared-default btn-primary">
                    <i class="fa fa-folder fa-2x"></i>
                    <br />
                    Event <br/>
                    Participation <br/>
                    List
                </button>
                </a>

            </p>
       
    </div>     
<!-- </div> -->

<div class="modal fade alert" id="newsModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="lineModalLabel"><i class="fa fa-tasks fa-1x"></i> Create News</h4>
        </div>
        <div class="modal-body">
            <s:form commandName="newsEventData" action="submitNewsData" method="post">
              <div class="form-group">
                <label for="news-heading">News Heading</label>
                <s:input path="title" type="text" class="form-control" id="news-heading" placeholder="Enter heading"/>
              </div>
              
              <div class="form-group">
                <label for="news-detail">News Detail</label>
                <s:input path="content" type="text" class="form-control" id="news-detail" placeholder="Enter News Body here"/>
              </div>
              
              <s:input path="userDetails.userid" type="hidden" value='${UserDetails.userid}'/>

              <button type="submit" class="btn btn-primary center-block">Submit News</button>
            </s:form>
        </div>
    </div>
  </div>
</div>


<!-- Event Modal -->

<div class="modal fade alert" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="lineModalLabel"><i class="fa fa-calendar fa-1x"></i> Create Event</h4>
        </div>
        <div class="modal-body">
            <s:form commandName="newsEventData" action="submitEventData" method="post">
              <div class="form-group">
                <label for="news-heading">Event Name</label>
                <s:input path="title" type="text" class="form-control" id="news-heading" placeholder="Enter event's name"/>
              </div>
              
              <div class="form-group">
                <label for="event-detail">Event Detail</label>
                <s:input path="content" type="text" class="form-control" id="event-detail" placeholder="Enter event's detail here"/>
              </div>
              
              <div class="form-group">
                <label for="event-startdate">Start Date</label>
                <s:input class="form-control" path="fromdate" id="eventstartdate" name="date" placeholder="DD/MM/YYY" type="text"/>
              </div>
              
              <div class="form-group">
                <label for="event-enddate">End Date</label>
                <s:input class="form-control" path="todate" id="eventenddate" name="date" placeholder="DD/MM/YYY" type="text"/>
              </div>
              
              <div class="form-group">
                <label for="event-eligibility">Eligibility Criteria</label>
                <s:input path="eligibility" type="text" class="form-control" id="event-eligibility" placeholder="Enter eligibility criteria here"/>
              </div>
              
              
              
              <s:input path="userDetails.userid" type="hidden" value='${UserDetails.userid}'/>

              <button type="submit" class="btn btn-primary center-block">Submit Event</button>
            </s:form>
        </div>
    </div>
  </div>
 <script type="text/javascript">
 $(function(){           
     if (!Modernizr.inputtypes.date) {
         $('#eventstartdate').datepicker({
               dateFormat : 'yy-mm-dd'
             }
          );
     }
 });
</script>
</div>


<!-- Announcement Modal -->

<div class="modal fade alert" id="announcementModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="lineModalLabel"><i class="fa fa-bullhorn fa-1x"></i> Create Announcement</h4>
        </div>
        <div class="modal-body">
            <s:form commandName="newsEventData" action="submitAnnouncementData" method="post">
              <div class="form-group">
                <label for="news-heading">Announcement Title</label>
                <s:input path="title" type="text" class="form-control" id="news-heading" placeholder="Enter announcement title here"/>
              </div>
              
              <div class="form-group">
                <label for="news-detail">Announcement Detail</label>
                <s:input path="content" type="text" class="form-control" id="news-detail" placeholder="Enter announcement details here"/>
              </div>
              
              <s:input path="userDetails.userid" type="hidden" value='${UserDetails.userid}'/>

              <button type="submit" class="btn btn-primary center-block">Submit Announcement</button>
            </s:form>
        </div>
    </div>
  </div>
</div>


<!-- MyItemsModal -->

	<div class="modal fade alert" id="myItemsModal" tabindex="-1"
		role="dialog" aria-labelledby="modalLabel" aria-hidden="true">

				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
						    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
							<h5 class="text-center">
								My Items
							</h5>
						</div>
						<div class="panel-body text-center">
							<div id="grid"></div>
						</div>
					</div>
				</div>

</div>

</body>


</html>