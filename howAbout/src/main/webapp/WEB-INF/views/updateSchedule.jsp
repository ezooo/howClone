<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<title>스케줄 수정</title>
</head>
<body>
 	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./">Home</a>
			</div>
		</div>
	</nav>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
			TITLE
			</h1>
		</div>
	</div> 
	
		<!-- <div class="float-right">
			<form:form action="${pageContext.request.contextPath}/logout" method="POST">
				<input type="submit" class="btn btn-sm btn-success" value="Logout" />
			</form:form>
		</div> 
		
		 -->
		<br><br>
		<form:form modelAttribute="updateSchedule"
					action="./update"
		 class="form-horizontal"
		 method="post">
		<fieldset>
		<legend>subtitle</legend>
		<div class="form-group row">
			<label class="col-sm-2 control-label"> schedule_id</label>
			<div class="col-sm-3">
				<form:input type="hidden" path="schedule_id" class="form-control" value="${schedule.schedule_id}"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">schedule_date</label>
			<div class="col-sm-3">
				<form:input path="schedule_date" class="form-control" type="date" value="${schedule.schedule_date}"/>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-2 control-label">schedule_record</label>
			<div class="col-sm-3">
				<form:textarea path="schedule_record" class="form-control" value="${schedule.schedule_record}"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">weather</label>
			<div class="col-sm-3">
				<form:input path="weather" class="form-control" value="${schedule.weather}"/>
			</div>
		</div>
		

		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
			<input type="submit" class="btn btn-primary" value="전송" />
			</div>
		</div>
		</fieldset>
		</form:form>
	
</body>
</html>