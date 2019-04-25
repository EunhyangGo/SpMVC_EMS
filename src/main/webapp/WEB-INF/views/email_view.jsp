<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>이메일 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style>
	#ems_view{
		border: 1px solid black;
		
	}

	.ems_box{
		width:50%;
		margin-bottom: 10px;
		text-align: center;
		padding: 0.5em;
		
	}
	
	.ems-button{
		width: 50px;
		padding: 0.2em; /*세로 크기*/
		
		
	}
</style>
<script>

$(function(){
	$("#ems-update").click(function(){
		let id =${emsVO.id}
		location.href = "<c:url value='/ems/update'/>" +"?id=" +id
	})
	
	$("#ems-delete").click(function(){
		let id = ${emsVO.id}
		if(confirm("게시물을 삭제할까요?")){
			location.href ="<c:url value='/ems/delete'/>" +"?id=" +id
		}
	})
})
</script>

</head>
<body>
	<article id="ems_view" class="ems_box">
		<h3>${emsVO.id}</h3>
		<p>발송 Email: ${emsVO.from_email}</p>
		<p>받는 Email: ${emsVO.to_email}</p>
		<P>메일 제목 : ${emsVO.s_subject}</P>
		<p>메일 내용 : ${emsVO.s_content}</p>
	</article>
	<div class="ems-box">
	<button type="button" class="ems-button" id="ems-update">편집</button>
	<button type="button" class="ems-button" id="ems-delete">삭제</button>
</div>
</body>
</html>

