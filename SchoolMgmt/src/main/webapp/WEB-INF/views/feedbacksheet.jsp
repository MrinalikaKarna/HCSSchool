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
                            Select Class for Feedback
                        </h4>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="<%=request.getContextPath() %>/users/teacheradmin?method=GET&param3=${UserDetails.userid}"> Teacher's Admin</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-bar-chart-o"></i> Select Class
                            </li>
                           
                        </ol>
                    </div>
                </div>
	<div class="well">
		<s:form action="getStudentFeedbackDetails" commandName="ClassDetailsnew"
			method="post">
				<label>Class </label>
				<s:select path="classid" name="InputClassDetails"
					id="InputClassDetails">
					<c:forEach var="classd" items="${ClassDetails}">
						<s:option value="${classd.classid}" label="${classd.classname}" />
					</c:forEach>

				</s:select>
		

			<input type="submit" name="submit" id="submit"
				value="Get Student Details" class="btn btn-info pull-right" />
		</s:form>
      </div>

	</div>

</body>
</html>