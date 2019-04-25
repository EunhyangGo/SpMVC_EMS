<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>Email Management System</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>

.head{
	text-align:center;
}
form{
	margin:0 auto;
	width: 600px;
	
	padding: 1em;
	border: 1px solid #ccc;
	border-radius: 1em;
}

label{
	display:inline-block;
	width: 100px;
	text-align: right;
	color: black;
	font: 20pt;
	float:left;
}

input{
	display:inline-block;
	font-size: 15px;
	width: 450px;
	-mox-box-sizing: border-box;
	box-sizing: border-box;
	
	border: 1px solid #ccc;
	border-color: #000;
	padding: 8px;
	margin: 3px;
	
}

button{
	margin-bottom: 10px;
	width: 50px;
	padding: 0.5em;
}

button:hover{
	background-color:black;
	color:white;
	
}

.e-text{
	height: 20em;
}



</style>
<script>

// 아래의 function은 만약 내가 보낼-발송email아이디를 적지 않으면 
// 창위에 알람을 뜨게 하기 위해서 작성한 것.
$(function(){
	
	$("#save").click(function(){
		
		var from_email =$("#from_email").val()
		var to_email =$("#to_email").val()

		if(from_email ==""){
			alert("발송 Email 주소를 입력하셔야 합니다.")
			$("#from_email").focus()
			return false;
		}
		
		if(to_email ==""){
			alert("보낼 Email 주소를 입력하셔야 합니다.")
			$("#to_email").focus()
			return false;
		}
		
		let fdata =("form").serialize()
		
		$.ajax({
			url:"<c:url value='email_list'/>",
			method:"post",
			data: fdata,
			success:function(){
				alert(ok)
			},
			error:function(){
				alert("실패")
			}
		})
				
	})
})
</script>
</head>
<body>
<article> 
	<h3 class="head">Email Management System</h3>
</article>
<form action=<c:url value="ems" /> method="POST">
<section>
 <label for="id"></label>
 <input type="hidden" name="id"
 		value="${EMSVO.id}"
 		id="id"><br/>

 <label for="from_email">발송 Email</label>
 <input type="text" name="from_email"
 		value="${EMS.from_email}"
 		placeholder="발송 Email 아이디를 입력하셔야 합니다."
 		id="from_email"><br/>
 
  <label for="to_email">받는 Email</label>
 <input type="text" name="to_email"
 		value="${EMS.to_email}"
 		placeholder="받는 Email 아이디를 입력하셔야 합니다."
 		id="to_email"><br/>
 
  <label for="s_date">발송 일자</label>
 <input type="date" name="s_date"
 		value="${EMS.s_date}"
 		id="s_date"><br/>
 
  <label for="s_time">발송 시각</label>
 <input type="time" name="s_time"
 		value="${EMS.s_time}"
 		id="s_time"><br/>
 
  <label for="s_subject">메일 제목</label>
 <input type="text" name="s_subject"
 		value="${EMS.s_subject}"
 		id="s_subject"><br/>
 
  <label for="s_content">메일 내용</label>
 <input type="text" name="s_content"
 		value="${EMS.s_content}"
 		id="s_content" class="e-text"><br/>
 
  <label>첨부파일1</label>
 <input id="s_file1" class="in-box-border"><br/>
 
 <label>첨부파일2</label>
 <input id="s_file2" class="in-box-border"><br/>
 
 <hr/>
 <button id="save" type="submit">전송</button>
 </form>
 </section>
</body>
</html>