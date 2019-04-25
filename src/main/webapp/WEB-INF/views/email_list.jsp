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

table{
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border : 1px solid black;
}

tr{
	border: 1px solid black; /* tr에 솔리드 블랙을 하면 위에 칸과 아래칸이 나눠진다*/
}

td{
	text-align: center;
}

td,th{
	padding: 8px 8px;
	vertical-align: top;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#ems-write").click(function(){
			//let id = $(this).attr("data-id")
			location.replace("<c:url value ='/ems/write'/>")//ems의 write컨트롤러를 작동시켜라
			
		})
	$(function(){
		$(".email_tr").click(function(){
			let id = $(this).attr("data-id")
			location.replace("<c:url value = '/ems/view'/>" +"?id=" +id)
		})
		
	})
		
	})
</script>
</head>
<body>
<table>
	<tr>
	<th>ID</th>
	<th>발송 Email</th>
	<th>전송 Email</th>
	<th>발송 일자</th>
	<th>발송 시각</th>
	<th>메일 제목</th>
	<th>메일 내용</th>
	<th>첨부파일1</th>
	<th>첨부파일2</th>
	</tr>
	<c:choose>
	<c:when test="${empty EMAILS}">
	<tr><td colspan=9>이메일이 없습니다</td></tr>
	</c:when>
	<c:otherwise>
	<c:forEach var="emails" items="${EMAILS}">
	<tr class="email_tr" data-id="${emails.id}">
	<td>${emails.id}</td>
	<td>${emails.from_email}</td>
	<td>${emails.to_email}</td>
	<td>${emails.s_date}</td>
	<td>${emails.s_time}</td>
	<td>${emails.s_subject}</td>
	<td>${emails.s_content}</td>
	<td>${emails.s_file1}</td>
	<td>${emails.s_file2}</td>
	</c:forEach>
	</c:otherwise>
</c:choose>
</table>
<hr/>
<button id="ems-write">글쓰기</button>

</body>
</html>