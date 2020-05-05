<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <%@include file="/layout/head.jsp" %>
  </head>
  <body>
    <!-- Side Navbar -->
    <%@include file="/layout/sideNavi.jsp" %>    
    <div class="page">
      <!-- navbar-->
      <%@include file="/layout/header.jsp" %>
    <div class="page login-page">
      <div class="container">
        <div class="form-outer text-center d-flex align-items-center">
          <div class="form-inner">
            <div class="logo text-uppercase"><span>password</span><strong class="text-primary">check</strong></div>
            <p>비밀번호 확인 <br> 비밀번호를 입력해주세요</p>
            <form method="post" action="/pwCheck.do" class="text-left form-validate">              
              <div class="form-group-material">
                <input id="login-password" type="password" name="loginPassword" required data-msg="Please enter your password" class="input-material">
                <label for="login-password" class="label-material">Password</label>
              </div>
              <div class="form-group text-center"><input id="login" type="submit" class="btn btn-primary" value="완료"></a>
                <!-- This should be submit button but I replaced it with <a> for demo purposes-->
              </div>
            </form>
          </div>
          <div class="copyrights text-center">
            <p>Design by <a href="https://bootstrapious.com" class="external">Bootstrapious</a></p>
            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
          </div>
        </div>
      </div>
    </div>
   </div>
    <!-- JavaScript files-->
    <%@ include file="/layout/javaScriptFile.jsp" %>
    <!-- Main File-->
    <script src="/js/front.js"></script>
  </body>
</html>