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
            <div class="logo text-uppercase"><span>Technical</span><strong class="text-primary">Support</strong></div>
            <p>Solution의 발전을 위한 장소 <br> 기술지원 홈페이지</p>
            <form method="post" action="/login.do" class="text-left form-validate">
              <div class="form-group-material">
                <input id="login-userEmail" type="text" name="loginUserEmail" required data-msg="Please enter your userEmail" class="input-material">
                <label for="login-userEmail" class="label-material">User Email</label>
              </div>
              <div class="form-group-material">
                <input id="login-password" type="password" name="loginPassword" required data-msg="Please enter your password" class="input-material">
                <label for="login-password" class="label-material">Password</label>
              </div>
              <div class="form-group text-center"><input id="login" type="submit" class="btn btn-primary" value="Login"></a>
                <!-- This should be submit button but I replaced it with <a> for demo purposes-->
              </div>
            </form><a href="#" class="forgot-pass">아이디/비밀번호가 기억안나시나요?</a><small>아이디가 없으신가요? </small><a href="/views/register.jsp" class="signup">가입하기</a>
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
    <!-- Main File-->
    <script src="/js/front.js"></script>
  </body>
</html>