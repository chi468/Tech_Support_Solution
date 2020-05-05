<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <%@include file="/layout/head.jsp" %>
  </head>
  <body> 
    <div class="page">
      <!-- navbar-->
      <%@include file="/layout/header.jsp" %>
    <div class="page login-page">
      <div class="container">
        <div class="form-outer text-center d-flex align-items-center">
          <div class="form-inner">
            <div class="logo text-uppercase"><span>&nbsp;&nbsp;&nbsp;Login&nbsp;</span><strong class="text-primary">&nbsp;check	&nbsp;&nbsp;&nbsp;</strong></div>
            <p>로그인 후 이용해주세요<br> 세션이 만료되었거나 로그인하지 않았습니다.</p>
                       

              <div class="form-group text-center"><a href="/index.jsp" class="btn btn-primary" value="">로그인 페이지로 이동</a>
                <!-- This should be submit button but I replaced it with <a> for demo purposes-->
              </div>
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