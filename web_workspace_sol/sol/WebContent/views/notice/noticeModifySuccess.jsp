<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<script>
	
	alert("글을 수정하였습니다.");
	
	var boardType="${param.boardType}";
	
	if(boardType=="1")
		location.href="/noticeView.do";
		
	if(boardType=="2")
		location.href="/sharingView.do";
		
	if(boardType=="3")
		location.href="/technicalSupportView.do";
		
		
</script>

</body>
</html>