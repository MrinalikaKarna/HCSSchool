<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="s"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div>
		<s:form action="getStudentRegisterDetails" commandName="ClassDetailsnew"
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

</body>
</html>