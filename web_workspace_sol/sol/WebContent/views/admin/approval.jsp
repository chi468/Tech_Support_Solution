<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
 	<%@ include file="/layout/head.jsp" %>
  </head>
  <body>
  
  	<c:if test="${sessionScope.member.typeNo != 4}">
  	<script>
  		location.href="/error.jsp";
  	</script>
  	</c:if>
   	
   	<!-- ajax import -->
   	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">	
	</script>
 	
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
            <li class="breadcrumb-item active">Approval       </li>
          </ul>
        </div>
      </div>
      <section>
        <div class="container-fluid">
          <!-- Page Header-->
          <header> 
            <h1 class="h3 display">회원가입 승인           </h1>
          </header>
          <div class="row">
            <div class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <h4>가입 신청 리스트</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>UserName</th>
                          <th>Email</th>
                          <th>Phone</th>
                          <th>Type</th>
                          <th>Company</th>
                          <th>가입 신청일</th>
                          <th></th>	
                        </tr>
                      </thead>
                      <tbody id="admitTbody">
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <h4>기술지원 게시판(미지정 리스트)</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>작성자 Name</th>
                          <th>Email</th>
                          <th>Phone</th>
                          <th>Company</th>
                          <th>제목</th>
                          <th>내용</th>
                          <th>작성일</th>
                        </tr>
                      </thead>
                      <tbody>                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <h4>가입 반려 리스트</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped table-hover">
                      <thead>
	                   <tr>
                       	  <th>#</th>
                          <th>UserName</th>
                          <th>Email</th>
                          <th>Phone</th>
                          <th>Type</th>
                          <th>Company</th>
                          <th>가입 신청일</th>
                        </tr>
                      </thead>
                      <tbody id="refuseTbody">                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <h4>승인 완료</h4>
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
                          <th>Type</th>
                          <th>Company</th>
                          <th>가입 신청일</th>
                        </tr>
                      </thead>
                      <tbody id="admitSuccessTbody">                       
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>Your company &copy; 2017-2019</p>
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
 	
 	<!-- JavaScript 부분 -->
 	
 	<script> 	
 	$(document).ready(function(){
 		
 		$.ajax({
 			type : 'post', 
 			url : '/approvalList.do',
 			data : { state : "W" },
 			success : function(memberList){
 				
           		for(var i=1;i<=memberList.length;i++){  
           			$("#admitTbody").append("<tr>");
           			$("#admitTbody").append('<th scope="row">'+i+'</th>');
						$("#admitTbody").append('<td>'+memberList[i-1].userName+'</td>');
        			 	$("#admitTbody").append('<td>'+memberList[i-1].email+'</td>');
        			 	$("#admitTbody").append('<td>'+memberList[i-1].phone+'</td>');
        			 	$("#admitTbody").append('<td>'+memberList[i-1].typeNo+'</td>');
        			 	$("#admitTbody").append('<td>'+memberList[i-1].company+'</td>');
        			 	$("#admitTbody").append('<td>'+memberList[i-1].enrollDate+'</td>');        			 
        			 	$("#admitTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return admit(this);" id="admit" class="btn btn-xs btn-dark">승인</button></td>');
        			 	$("#admitTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return refuse(this);" id="refuse" class="btn btn-xs btn-dark">반려</button></td>');
        				$("#admitTbody").append("</tr>");
        			}		
 			},
 			error : function(data){
 				console.log("list : ajax통신에러");
 			} 			
 		});		
 		
 		
 		
 		$.ajax({
 			type : 'post', 
 			url : '/approvalList.do',
 			data : { state : "R" },
 			success : function(memberList){
 				
           		for(var i=1;i<=memberList.length;i++){  
           			$("#refuseTbody").append("<tr>");
           			$("#refuseTbody").append('<th scope="row">'+i+'</th>');
						$("#refuseTbody").append('<td>'+memberList[i-1].userName+'</td>');
        			 	$("#refuseTbody").append('<td>'+memberList[i-1].email+'</td>');
        			 	$("#refuseTbody").append('<td>'+memberList[i-1].phone+'</td>');
        			 	$("#refuseTbody").append('<td>'+memberList[i-1].typeNo+'</td>');
        			 	$("#refuseTbody").append('<td>'+memberList[i-1].company+'</td>');
        			 	$("#refuseTbody").append('<td>'+memberList[i-1].enrollDate+'</td>');        			 
        			 	$("#refuseTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return admit(this);" id="admit" class="btn btn-xs btn-dark">승인</button></td>');
        			 	$("#refuseTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return deleteMember(this);" id="deleteBtn" class="btn btn-xs btn-dark">삭제</button></td>');
        				$("#refuseTbody").append("</tr>");
        			}		
 			},
 			error : function(data){
 				console.log("list : ajax통신에러");
 			} 			
 		});
 		
 		
 		
 		
 	}); 		
 		
 		 function admit(admBtn){  			 
 			var email = admBtn.value;  			
	 		$.ajax({
 				type : 'post',
 				url : '/registerAdmit.do',
 				data : {email : email}, 				
 				success : function(list){
 					
 					$("#admitTbody").empty();
 					$("#refuseTbody").empty(); 					
 					
 					var memberList = list[0];
 	 				
 	           		for(var i=1;i<=memberList.length;i++){  
 	           				$("#admitTbody").append("<tr>");
 	           				$("#admitTbody").append('<th scope="row">'+i+'</th>');
 	        			   	$("#admitTbody").append('<td>'+memberList[i-1].userName+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].email+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].phone+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].typeNo+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].company+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].enrollDate+'</td>');        			 
 	        			 	$("#admitTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return admit(this);" id="admit" class="btn btn-xs btn-dark">승인</button></td>');
 	        			 	$("#admitTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return refuse(this);" id="refuse" class="btn btn-xs btn-dark">반려</button></td>');
 	        				$("#admitTbody").append("</tr>");
 	        			}
 	           		
 	           		
 	           		var refuseList = list[1];
 	           		
 	           		for(var i=1;i<=refuseList.length;i++){  
        				$("#refuseTbody").append("<tr>");
        				$("#refuseTbody").append('<th scope="row">'+i+'</th>');
	     			   	$("#refuseTbody").append('<td>'+refuseList[i-1].userName+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].email+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].phone+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].typeNo+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].company+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].enrollDate+'</td>');        			 
     			 		$("#refuseTbody").append('<td><button value="'+refuseList[i-1].email+'" onclick="return admit(this);" id="admit" class="btn btn-xs btn-dark">승인</button></td>');
	     			 	$("#refuseTbody").append('<td><button value="'+refuseList[i-1].email+'" onclick="return deleteMember(this);" id="delteBtn" class="btn btn-xs btn-dark">삭제</button></td>');
	     				$("#refuseTbody").append("</tr>");
     				}
 	           		
 	           		var admitMember = list[2][0]; 	           		
	 	            
    	    		$("#admitSuccessTbody").append("<tr>");
        			$("#admitSuccessTbody").append('<th scope="row"></th>');
   				   	$("#admitSuccessTbody").append('<td>'+admitMember.userName+'</td>');
     			 	$("#admitSuccessTbody").append('<td>'+admitMember.email+'</td>');
   	 			 	$("#admitSuccessTbody").append('<td>'+admitMember.phone+'</td>');
   				 	$("#admitSuccessTbody").append('<td>'+admitMember.typeNo+'</td>');
   				 	$("#admitSuccessTbody").append('<td>'+admitMember.company+'</td>');
   				 	$("#admitSuccessTbody").append('<td>'+admitMember.enrollDate+'</td>');        			      			 	
   					$("#admitSuccessTbody").append("</tr>");     				
 	 			},
 	 			error : function(data){
 	 				console.log("list : ajax통신에러");
 	 			},
 	 			complete: function(){
 	 				return false;
 	 			}
 			}); 			
	 	};	 	
	 	
	 	
	 	function refuse(rfsBtn){
	 		
	 		var email = rfsBtn.value;
	 		
	 		$.ajax({
 				type : 'post',
 				url : '/registerRefuse.do',
 				data : {email : email}, 				
 				success : function(list){
 					
 					$("#admitTbody").empty();
 					$("#refuseTbody").empty(); 					
 					
 					var memberList = list[0];
 	 				
 	           		for(var i=1;i<=memberList.length;i++){  
 	           				$("#admitTbody").append("<tr>");
 	           				$("#admitTbody").append('<th scope="row">'+i+'</th>');
 	        			   	$("#admitTbody").append('<td>'+memberList[i-1].userName+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].email+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].phone+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].typeNo+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].company+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].enrollDate+'</td>');        			 
 	        			 	$("#admitTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return admit(this);" id="admit" class="btn btn-xs btn-dark">승인</button></td>');
 	        			 	$("#admitTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return refuse(this);" id="refuse" class="btn btn-xs btn-dark">반려</button></td>');
 	        				$("#admitTbody").append("</tr>");
 	        			}
 	           		
 	           		
 	           		var refuseList = list[1];
 	           		
 	           		for(var i=1;i<=refuseList.length;i++){  
        				$("#refuseTbody").append("<tr>");
        				$("#refuseTbody").append('<th scope="row">'+i+'</th>');
	     			   	$("#refuseTbody").append('<td>'+refuseList[i-1].userName+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].email+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].phone+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].typeNo+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].company+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].enrollDate+'</td>');        			 
     			 		$("#refuseTbody").append('<td><button value="'+refuseList[i-1].email+'" onclick="return admit(this);" id="admit" class="btn btn-xs btn-dark">승인</button></td>');
	     			 	$("#refuseTbody").append('<td><button value="'+refuseList[i-1].email+'" onclick="return deleteMember(this);" id="deleteBtn" class="btn btn-xs btn-dark">삭제</button></td>');
	     				$("#refuseTbody").append("</tr>");
     				}
 	 			},
 	 			error : function(data){
 	 				console.log("list : ajax통신에러");
 	 			},
 	 			complete: function(){
 	 				return false;
 	 			}
 			}); 		
	 	};
	 	
	 	
		function deleteMember(delBtn){
	 		
	 		var email = delBtn.value;
	 		
	 		$.ajax({
 				type : 'post',
 				url : '/deleteMember.do',
 				data : {email : email}, 				
 				success : function(list){
 					
 					$("#admitTbody").empty();
 					$("#refuseTbody").empty(); 					
 					
 					var memberList = list[0];
 	 				
 	           		for(var i=1;i<=memberList.length;i++){  
 	           				$("#admitTbody").append("<tr>");
 	           				$("#admitTbody").append('<th scope="row">'+i+'</th>');
 	        			   	$("#admitTbody").append('<td>'+memberList[i-1].userName+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].email+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].phone+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].typeNo+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].company+'</td>');
 	        			 	$("#admitTbody").append('<td>'+memberList[i-1].enrollDate+'</td>');        			 
 	        			 	$("#admitTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return admit(this);" id="admit" class="btn btn-xs btn-dark">승인</button></td>');
 	        			 	$("#admitTbody").append('<td><button value="'+memberList[i-1].email+'" onclick="return refuse(this);" id="refuse" class="btn btn-xs btn-dark">반려</button></td>');
 	        				$("#admitTbody").append("</tr>");
 	        			}
 	           		
 	           		
 	           		var refuseList = list[1];
 	           		
 	           		for(var i=1;i<=refuseList.length;i++){  
        				$("#refuseTbody").append("<tr>");
        				$("#refuseTbody").append('<th scope="row">'+i+'</th>');
	     			   	$("#refuseTbody").append('<td>'+refuseList[i-1].userName+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].email+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].phone+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].typeNo+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].company+'</td>');
	     			 	$("#refuseTbody").append('<td>'+refuseList[i-1].enrollDate+'</td>');        			 
     			 		$("#refuseTbody").append('<td><button value="'+refuseList[i-1].email+'" onclick="return admit(this);" id="admit" class="btn btn-xs btn-dark">승인</button></td>');
	     			 	$("#refuseTbody").append('<td><button value="'+refuseList[i-1].email+'" onclick="return deleteMember(this);" id="deleteBtn" class="btn btn-xs btn-dark">삭제</button></td>');
	     				$("#refuseTbody").append("</tr>");
     				}
 	 			},
 	 			error : function(data){
 	 				console.log("list : ajax통신에러");
 	 			},
 	 			complete: function(){
 	 				return false;
 	 			}
 			}); 		
	 	};
	 	
	 	
	 	
	 	
 	</script>
    <!-- Main File-->
    <script src="/js/front.js"></script>
  </body>
</html>