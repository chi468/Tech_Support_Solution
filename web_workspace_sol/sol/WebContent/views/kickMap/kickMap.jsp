<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
 	<meta name="viewport" content="initial-scale=1.0">
 	<%@ include file="/layout/head.jsp" %>
 	<script src="//code.jquery.com/jquery.min.js"></script>
 	<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 500px;
        weight: 400px;
      }
      
    </style>
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
            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
            <li class="breadcrumb-item active">킥보드 맵       </li>
          </ul>
        </div>
      </div>
      <section class="dashboard-counts section-padding">
        <div class="container-fluid">
          <!-- Page Header-->
          <header> 
            <h1 class="h3 display">킥보드 맵            </h1>
          </header>
          <div class="row">
            <div class="col-lg-12">
              <div style="text-align:right;">
          	 	<button onclick="/" class="btn btn-primary my-2">새로고침</button>
          	  </div>
          	 	 <div id="map">
    				<script>
     				 var map;
     				 var gangNam = {lat:37.4978762, lng: 127.0274998};
     				 var marker;
     				 function initMap() {
     				 map = new google.maps.Map(document.getElementById('map'), {
       					 center: gangNam, zoom: 15.3
       				 	 });
     				marker = new google.maps.Marker({position: gangNam, map: map});
    				 }
    				</script>
   					<script src="https://maps.googleapis.com/maps/api/js?key==initMap"
   					async defer></script>
          	  	</div>
          	  
          	  <div class="form-group" style="line-height:10px; float:right;">
          	    <br>
              	<form action = "/search.do" method="get" class="form-inline">
              		<select id="searchSelect" name="searchSelect" class="form-control mb-2 mr-sm-2">
	              		<option value="1">지역</option>
    	          		<option value="2">강남</option>
            	  	</select>            	  	
            	  	
            	  	<input type="hidden" name="boardTypeNo" value="2"/> 	  
              		<input type="text" id="searchText" name="searchText" placeholder="검색어를 입력하세요" class="form-control mb-2 mr-sm-2"/>
              		<button type="submit" class="btn btn-info" style="background-color:dodger-blue;">검색</button>
              	</form>
              </div>	
              
              </div>

              
            </div>
          </div>
        </div>
      </section>
<!--       <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>Technical Support&copy; 2018-2019</p>
            </div>
            <div class="col-sm-6 text-right">
              <p>Design by <a href="https://bootstrapious.com" class="external">Bootstrapious</a></p>
              Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions and it helps me to run Bootstrapious. Thank you for understanding :)
            </div>
          </div>
        </div>
      </footer> -->
    </div>
    <!-- JavaScript files-->
 	<%@include file="/layout/javaScriptFile.jsp"%>
    <!-- Main File-->
    <script src="/js/front.js"></script>
    
   	<script>
		function hrefForm(){
			location.href="/views/sharing/sharingCreate.jsp";
		} 	
 	</script>
 	
 	<script>
 		
 		$("#searchSelect").change(function(){
 			if($("#searchSelect").val()==3){
 				$("#searchState").css("display","block");
 				$("#searchText").val("1");
 				$("#searchText").css("display","none");
 			}else{
 				$("#searchState").css("display","none");
 				$("#searchText").css("display","block");
 			}
 		});
 		
 		
 		$("#searchState").change(function(){
 			$("#searchText").val($("#searchState").val());
 		});
 		
 	</script>
    
  </body>
</html>