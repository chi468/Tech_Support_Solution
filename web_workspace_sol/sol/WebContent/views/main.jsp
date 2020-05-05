 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sol.member.model.vo.*" %>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <%@include file="/layout/head.jsp" %>
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    
  </head>
  <body>
    <!-- Side Navbar -->
    <%@include file="/layout/sideNavi.jsp" %>    
    <div class="page">
      <!-- navbar-->
      <%@include file="/layout/header.jsp" %>
     
      <!-- Counts Section -->
      <section class="dashboard-counts section-padding">
        <div class="container-fluid">
          <div class="row">
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-5 col-7">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-user"></i></div>
                <div class="name"><strong class="text-uppercase">같은회사 가입</strong><span>Last 7 days</span>
                  <div class="count-number">${requestScope.mainData.companyMemberCount}</div>
                </div>
              </div>
            </div>
            <!-- Count item widget-->
            <div class="col-xl-3 col-md-5 col-7">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-padnote"></i></div>
                <div class="name"><strong class="text-uppercase">기술공유 게시판 새 글</strong><span>Last 7 days</span>
                  <div class="count-number">${requestScope.mainData.newSharingCount}</div>
                </div>
              </div>
            </div>
            <!-- Count item widget-->
            <div class="col-xl-3 col-md-5 col-8">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-bill"></i></div>
                <div class="name"><strong class="text-uppercase">내 글에  달린 댓글</strong><span>Last 7 days</span>
                  <div class="count-number">${requestScope.mainData.newCommentCont}</div>
                </div>
              </div>
            </div>
            <!-- Count item widget-->
            <div class="col-xl-2 col-md-5 col-7">
              <div class="wrapper count-title d-flex">
                <div class="icon"><i class="icon-list-1"></i></div>
                <div class="name"><strong class="text-uppercase">긴급 공지</strong><span>Last 7 days</span>
                  <div class="count-number">${requestScope.mainData.emergencyCount}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Header Section-->
      <section class="dashboard-header section-padding">
        <div class="container-fluid">
          <div class="row d-flex align-items-md-stretch">
          
          
            <!-- Pie Chart-->
            <div class="col-lg-5 col-md-7">
              <div class="card project-progress">
                <h2 class="display h4">우리회사 기술지원 게시판 현황</h2>
                <p> 현재 회사의 기술지원 게시판 상태별 현황</p>
                <div class="pie-chart">
                  <canvas id="pieChart" width="300" height="300"> </canvas>
                </div>
              </div>
            </div>
            <!-- Line Chart -->
            <div class="col-lg-6 col-md-12 flex-lg-last flex-md-first align-self-baseline">
              <div class="card sales-report">
                <h2 class="display h4">공지사항</h2>
                <p> 관리자가 채택한 공지사항입니다. 필독하세요!</p>
                <section>
       				<div class="container">
         				 <h1 class="jumbotron-heading">
      					    <button type="button" class="btn btn-sm btn-outline-secondary">제목</button>&nbsp;
    					      ${requestScope.board.name}
    					 </h1>
    		   		     <br><br>
          			     <p class="lead text-muted"><button type="button" class="btn btn-sm btn-outline-secondary">내용</button>&nbsp;
         	 			 	<div style="overflow; scroll; width:600px; height:300px; class="btn btn-sm btn-outline-secondary">
	          					${requestScope.board.text}
         	 			 	</div>
        				 </p>
          				 <button type="button" class="btn btn-sm btn-outline-secondary">첨부파일</button>&nbsp;
          				 <a href="/fileDownLoad.do?boardNo=${requestScope.board.boardNo }">${requestScope.board.fileData.fileName}</a>
        			</div>
      </section>
              </div>
            </div>
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
    
    <input type="hidden" id="newReg" value="${requestScope.mainData.technicalSupportCount.newRegistration}"/>
    <input type="hidden" id="assignE" value="${requestScope.mainData.technicalSupportCount.assignEngineer}"/>
    <input type="hidden" id="analyzing" value="${requestScope.mainData.technicalSupportCount.analyzing}"/>
    <input type="hidden" id="infor" value="${requestScope.mainData.technicalSupportCount.requestInforation}"/>
    <input type="hidden" id="nFeed" value="${requestScope.mainData.technicalSupportCount.needFeedBack}"/>
    
    <script>
    $(function(){
    	
    	var newReg = ${requestScope.mainData.technicalSupportCount.newRegistration};
    	var assignE = ${requestScope.mainData.technicalSupportCount.assignEngineer};
    	var analyzing = ${requestScope.mainData.technicalSupportCount.analyzing};
    	var infor = ${requestScope.mainData.technicalSupportCount.requestInforation};
    	var nFeed = ${requestScope.mainData.technicalSupportCount.needFeedBack};    
    });
    
    </script>
    
    <!-- JavaScript files-->
    <%@include file="/layout/javaScriptFile.jsp"%>
    <!-- Main File-->
    <script src="/js/front.js"></script>
  </body>
</html>