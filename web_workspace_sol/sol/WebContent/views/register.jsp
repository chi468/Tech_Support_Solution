<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <%@ include file="/layout/head.jsp" %>
  </head>
  <body>
    <div class="page login-page">
      <div class="container">
        <div class="form-outer text-center d-flex align-items-center">
          <div class="form-inner">
            <div class="logo text-uppercase"><strong class="text-primary">회원가입</strong></div>
            <br>
            <pre><p>              저희 솔루션의 관계자만 가입이 가능합니다.              </p></pre>
            <form action="/register.do" method="post" class="text-left form-validate">
            
               <div class="dropdown dropdown-validate">
    		 	 	<button id="selectCompany" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      				 	회사 종류 선택
    				</button>
    				<div id="companyMessage" style="font-size:8px"></div>    			
    				<div class="dropdown-menu">
      					<a id="selectPartner" class="dropdown-item" href="#">협력사</a>
      					<a id="selectManufacturer" class="dropdown-item" href="#">제조사</a>	      			
	    			</div>	    	
  			  </div>
  			  
  			  <div id="enterCompany" class="form-group-material"  style="display:none">
               	<input id="register-company" type="text" name="registerCompany" required data-msg="Please enter your company" class="input-material">
               	<label for="register-company" class="label-material">Company Name </label>
              </div>
              
              <br><br>
            
              <div class="form-group-material">
                <input id="register-username" type="text" name="registerUsername" required data-msg="Please enter your username" class="input-material">
                <label for="register-username" class="label-material">User Name</label>
              </div>
              <div class="form-group-material">
                <input id="register-email" type="text" name="registerEmail" required data-msg="Please enter a valid email address" class="input-material">
                <label for="register-email" class="label-material">Email Address      </label>
              </div>
              <div class="form-group-material">
                <input id="register-password" type="password" name="registerPassword" required data-msg="Please enter your password" class="input-material">
                <label for="register-password" class="label-material">Password        </label>
              </div>
              <div class="form-group-material">
                <input id="register-phone" type="text" name="registerPhone" required data-msg="Please enter your phone number" class="input-material">
                <label for="register-phone" class="label-material">Phone        </label>
              </div>
              <div class="form-group-material">
                <input id="register-address" type="text" name="registerAddress" required data-msg="Please enter your address" class="input-material">
                <label for="register-address" class="label-material">Address        </label>
              </div>
              <div class="form-group terms-conditions text-center">
                <input id="register-agree" name="registerAgree" type="checkbox" required value="1" data-msg="Your agreement is required" class="form-control-custom">
                <label for="register-agree">I agree with the terms and policy</label>
              </div>
              <div class="form-group text-center">
                <input id="register" type="submit" onclick="return check();" value="Register" class="btn btn-primary">
              </div>
            </form><small>Already have an account? </small><a href="/index.jsp" class="signup">Login</a>
          </div>
          <div class="copyrights text-center">
            <p>Design by <a href="https://bootstrapious.com" class="external">Bootstrapious</a></p>
            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript files-->
  	<%@ include file="/layout/javaScriptFile.jsp" %>
  
  	<script>
    function check() {
		
		var selectComapany = $("#selectCompany").html();		
		
		console.log(selectComapany.length);		
			
		if(selectComapany.length==3){			
			return true;
		}else{					
			$("#companyMessage").css("color","red");
			$("#companyMessage").html("회사 종류를 선택해주세요");
    		return false;
    	}
	}

  	</script>  	
  	
  	
    <!-- Main File-->
    <script src="/js/front.js"></script>
  </body>
</html>