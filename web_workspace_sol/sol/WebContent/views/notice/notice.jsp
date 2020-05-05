<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sol.board.model.vo.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
 	<%@ include file="/layout/head.jsp" %>
  </head>
  <body>
    <!-- Side Navbar -->
  	<%@ include file="/layout/sideNavi.jsp" %>
    <div class="page">
      <!-- navbar-->
      <%@include file="/layout/header.jsp"%>
      <!-- Breadcrumb-->
      <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="/views/main.jsp">Home</a></li>
            <li class="breadcrumb-item active">Notice       </li>
          </ul>
        </div>
      </div>
      <section>
        <div class="container-fluid">
          <!-- Page Header-->
          <header> 
            <h1 class="h3 display">공지사항            </h1>
           
          </header>
          
          <c:if test="${sessionScope.member.typeNo gt 1}">
          	<div style="text-align:right;">
          	 	<button onclick="hrefForm();" class="btn btn-primary my-2">글 작성</button>
          	</div>
          </c:if>
          
          <div class="row">
           	<jsp:include page="noticeEmergency.jsp" flush="false">				
				<jsp:param name="pageBoardEmergency" value="${requestScope.pageBoardDataEmergency}" />								
			</jsp:include>
            
            <jsp:include page="noticeNormal.jsp" flush="false">				
				<jsp:param name="pageBoardDataNoraml" value="${requestScope.pageBoardDataNormal}" />								
			</jsp:include>
			
            <jsp:include page="noticeImportance.jsp" flush="false">				
				<jsp:param name="pageBoardDataImportance" value="${requestScope.pageBoardDataImportance}" />				
			</jsp:include>
            
            <jsp:include page="noticeAll.jsp" flush="false">				
				<jsp:param name="pageBoardData" value="${requestScope.pageBoardData}" />				
			</jsp:include>
          </div>
          
          <div class="form-group" style="line-height:10px;">
              	<form action = "/search.do" method="get" class="form-inline">
              		<select id="searchSelect" name="searchSelect" class="form-control mb-2 mr-sm-2">
	              		<option value="1">제목</option>
    	          		<option value="2">내용</option>
    	          		<option value="3">중요도</option>
            	  	</select>            	  	
            	  	
            	  	<select id="searchState" name="searchState" class="form-control mb-2 mr-sm-2" style="display:none;">
	              		<option value="1">긴급</option>
    	          		<option value="2">중요</option>
    	          		<option value="3">일반</option>
            	  	</select>
            	  	
            	  	<input type="hidden" name="boardTypeNo" value="1"/> 	  
              		<input type="text" id="searchText" name="searchText" placeholder="검색어를 입력하세요" class="form-control mb-2 mr-sm-2"/>
              		<button type="submit" class="btn btn-info" style="background-color:dodger-blue;">검색</button>
              	</form>
              </div>
          
        </div>
      </section>
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>Technical Support &copy; 2018-2019</p>
            </div>
            <div class="col-sm-6 text-right">
              <p>Design by <a href="https://bootstrapious.com" class="external">Bootstrapious</a></p>
              <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions and it helps me to run Bootstrapious. Thank you for understanding :)-->
            </div>
          </div>
        </div>
      </footer>
    </div>
    <!-- JavaScript files-->
 	<%@include file="/layout/javaScriptFile.jsp"%>
 	<script>
 		function hrefForm(){
 			location.href="/views/notice/noticeCreate.jsp";
 		} 	
 	</script>
 	
 	
 	<script>
 	
 		$("#searchSelect").change(function(){
 			if($("#searchSelect").val()==3){
 				$("#searchState").css("display","block");
 				$("#searchText").val("긴급");
 				$("#searchText").css("display","none");
 			}else{
 				$("#searchState").css("display","none");
 				$("#searchText").css("display","block");
 			}
 		});
 		
 		
 		$("#searchState").change(function(){
 			
 			if($("#searchState").val()=="1"){
 				$("#searchText").val("긴급");
 			}
 			else if($("#searchState").val()=="2"){
 	 			$("#searchText").val("중요");
 	 		}
 	 		else{
 	 			$("#searchText").val("일반");		
 	 		}
 		});
 		
 	</script>
 	
    <!-- Main File-->
    <script src="/js/front.js"></script>
  </body>
</html>