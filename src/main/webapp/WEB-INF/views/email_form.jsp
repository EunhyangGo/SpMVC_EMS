<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

section{
	width:70%;
	margin: 20px auto;
}

legend {
		font-size:12pt;
		font-weight: bold;
		color : #3d65ff;
	}
	
	
	.in-box {
		padding:8px;
		margin:3px;
		display: inline-block;
		width:70%;
		border:1px solid #ccc;
	}
	
	.in-box:hover {
		background-color: #ddd;
		border:1px solid blue;
	}
	
	.in-box-border {
		padding:8px;
		margin:3px;
		display: inline-block;
		width:70%;
		border-top:1px solid #ccc;
	}
	
	.in-box-error{
		font-size:12px;
		color:red;
	}
	
	#ems-send{
		
	}
	


</style>
<script>


</script>
</head>
<body>
		
	<form:form action ="${rootPath}/ems/write"
		  modelAttribute="emsVO" method="POST">
	
	<fieldset>
	<legend>Email 보내기</legend>
	
 	<label class="in-label" for="id"> ID</label>
 	<div class="in-box-border">
	<form:input class="in-box" type="text" id="id" path="id"/><br/>
	<form:errors path="id" class="in-box-error"/>
	</div>
	
	<div class="in-label" class="in-box-border">
	<label class="in-label" for="from_email">발송 Email</label>
	<form:input class="in-box" id="from_email" path="from_email"/><br/>
	<form:errors path="from_email" class="in-box-error"/>
	</div>
	
	<div class="in-box-border">
	<label class="in-label" for="to_email">받는 Email</label>
	<form:errors path="to_email" class="in-box-error"/>
	<form:input class="in-box" id="to_email" path="to_email"/><br/>
	</div>
	
	<div class="in-box-border">
	<label class="in-label" for="s_subject"> 메일 제목</label>
	<form:input class="in-box" id="s_subject" path="s_subject"/><br/>
	<form:errors path="s_subject" class="in-box-error"/>
	</div>
	
	<div class="in-box-border">
	<label class="in-label" for="s_content"> 메일 내용</label>
	<form:input class="in-box" id="s_content" path="s_content"/><br/>
	<form:errors path="s_content" class="in-box-error"/>
	</div>
	
	<div class="in-box-border">
	<label class="in-label" for="s_file1"> 첨부파일</label>
	<form:input class="in-box" id="s_file1" path="s_file1"/><br/>
	</div>
	
	<button id="ems-send" type="submit">보내기</button>
	</fieldset>
	</form:form>
</body>
</html>