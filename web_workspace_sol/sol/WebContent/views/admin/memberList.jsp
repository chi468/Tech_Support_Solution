<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.sol.member.model.vo.*" %> 
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
            <li class="breadcrumb-item active">회원 전체 정보조회       </li>
          </ul>
        </div>
      </div>
        
            <div class="col-lg-12">
              <div class="card">
                <div class="card-header">
                  <h4>회원 리스트</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped table-sm">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>UserName</th>
                          <th>Email</th>
                          <th>Phone</th>
                          <th>가입일</th>
                          <th>Company</th>                                                 
                          <th>회원 구분</th>
                          <th>관리자 변경</th>	
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="member" items="${requestScope.pageMemberData.memberList}" varStatus="status">
                      		<tr>
	                      		<th scope="row">${member.num}</th>
    	                  		<td>${member.userName}</td>
        	              		<td>${member.email}</td>
            	          		<td>${member.phone}</td>
                	      		<td>${member.enrollDate}</td>
                    	  		<td>${member.company}</td>                    	  		
                    	  			<form action="/changeType.do" method="post">
                    	  			<input name="emailType" value="${member.email}${member.typeNo}" style="display:none"/>
                    	  			<c:if test="${member.typeNo eq 2}">
                    	  				<td>제조사 엔지니어</td><td><button type="submit" class="btn btn-xs btn-dark">관리자로 변경</button></td>
                    	  			</c:if>
                    	  			<c:if test="${member.typeNo eq 3}">
                    	  				<td>관리자</td><td><button type="submit" class="btn btn-xs btn-dark">제조사 엔지니어로 변경</button></td>
                    	  			</c:if>
                    	  			<c:if test="${member.typeNo eq 1}"><td>협력사 엔지니어</td><td></td></c:if>
                    	  			<input type="hidden" value="${requestScope.pageMemberData.currentPage }" name="changeType-currentPage"/>
                    	  			<input type="hidden" value="${requestScope.pageMemberNData.currentPage }" name="changeType-currentNPage"/>
                    	  			</form>                    	  		
                    	  		<td>
                    	  			<form action="/changeActiveN.do" method="post">
                    	  				<input name="email" style="display:none;" value="${member.email }">
                    	  				<input type="hidden" value="${requestScope.pageMemberData.currentPage }" name="changeActive-currentPage"/>
	                    	  			<input type="hidden" value="${requestScope.pageMemberNData.currentPage }" name="changeActive-currentNPage"/>
                    	  				<button onclick="return deleteMember();"class="btn btn-xs btn-dark">삭제</button>
                    	  			</form>
                    	  		</td>                    	  	                   	  		
                      		</tr>                      	
                      	</c:forEach>          
                      </tbody>
                    </table>
                   	<nav>  						
  							<form action="/memberAllView.do" method="get">
  								<ul class="pagination justify-content-center">
  								<input type="hidden" name="currentNPage" value="${requestScope.pageMemberNData.currentPage }">
  								<input type="hidden" id="currentPage" name="currentPage">  								
  					 			${requestScope.pageMemberData.pageNavi}
  					 			</ul>  					 		
  					 		</form>  						
					</nav>
                  </div>
                </div>
              </div>
            </div>
            
            
             <div class="col-lg-12">
              <div class="card">
                <div class="card-header">
                  <h4>삭제회원 리스트</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped table-sm">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>UserName</th>
                          <th>Email</th>
                          <th>Phone</th>
                          <th>가입일</th>
                          <th>Company</th>
                          <th></th>	
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="member" items="${requestScope.pageMemberNData.memberList}" varStatus="status">
                      		<tr>
	                      		<th scope="row">${member.num}</th>
    	                  		<td>${member.userName}</td>
        	              		<td>${member.email}</td>
            	          		<td>${member.phone}</td>
                	      		<td>${member.enrollDate}</td>
                    	  		<td>${member.company}</td>
                    	  		<td></td>
                    	  		<td>                    	  			
                    	  		</td>                    	  		
                      		</tr>                      	
                      	</c:forEach>                       
                      </tbody>
                    </table>
                   	<nav>
  						
  							<form action="/memberAllView.do" method="get">
  								<ul class="pagination justify-content-center">
  									<input type="hidden" id="currentNPage" name="currentNPage">  								
  									<input type="hidden" name="currentPage" value="${requestScope.pageMemberData.currentPage }">
  					 				${requestScope.pageMemberNData.pageNavi} 	
  					 			</ul>				 		
  					 		</form>
					</nav>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>Technical Solution &copy; 2018-2019</p>
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
 	
 	<!-- 회원 삭제를 위한 JavaScript부분 -->
 	<script>
 		function deleteMember(){
 			
 			if(window.confirm("정말로 삭제하시겠습니까?")){
 				alert("해당 회원을 삭제하였습니다.");
 				return true;
 			}else{
 				return false;
 			} 				
 		} 	
 		
 		function pageSelect(page,pageType){
 			var pageType1=pageType;
 			var page1=page;
 			
 			if(pageType1=="currentPageType"){
 				$("#currentPage").val(page);
 			} 			
 			else{
 				$("#currentNPage").val(page);
 				
 			return true;
 			} 			
 		} 
 		
 	</script>
 	 	 	
    <!-- Main File-->    
    <script src="/js/front.js"></script>
  </body>
</html>