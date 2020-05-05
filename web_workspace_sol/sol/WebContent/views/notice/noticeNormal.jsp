<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sol.board.model.vo.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="/layout/head.jsp" %>


<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>

<body>
 	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <div class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <h4>일반 공지</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped table-sm">
                      <thead>
                        <tr id="check">
                          <th>#</th>
                          <th>제목</th>
                          <th>내용</th>
                          <th>중요도</th>
                          <th>조회수</th>
                          <th>댓글수</th>
                        </tr>
                      </thead>   
                      <tbody>
                      
                      	
                      	<c:forEach var="board" items="${requestScope.pageBoardDataNormal.boardList}" varStatus="status">	
                      		<tr id="normalBoardList${status.count}">
                      			<th scope="row">${board.num}</th>
    	                  		<td>${board.name}</td>
        	              		<td id="text${status.count}">        	              		
	        	              		<!-- td에 내용 일정량까지만 추가하는 것 -->
									<script>
										var boardText = "${board.text}";
										document.write(boardText.substring(0,10));									
										$("#text${status.count}").append($("boardText"));
										
										$("#normalBoardList${status.count}").mouseenter(function(){											
											$(this).css("border","outset");				
										});
										
										$("#normalBoardList${status.count}").mouseleave(function(){											
											$(this).css("border","none");				
										});
								
										$("#normalBoardList${status.count}").click(function(){											
											location.href="/noticeOneView.do?boardNo=${board.boardNo}"
										});
						    	    </script>
        	              		</td>
            	          		<td>${board.grade}</td>
                	      		<td>${board.hits}</td>
                    	  		<td>${board.commentNo}</td>                    	  		
                      		</tr>                      	
                      	</c:forEach>
                      	
                      	
                      </tbody>
                    </table>
                    <ul class="pagination justify-content-center">
                    </ul>
                    
                  </div>
                </div>
              </div>
            </div>
</body>



	
	<!-- JavaScript files-->  	

	
		
    <!-- Main File-->
    <script src="/js/front.js"></script>

</html>