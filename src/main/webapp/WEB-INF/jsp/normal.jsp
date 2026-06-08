<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String lang = (String) session.getAttribute("lang");
if (lang == null) lang = "en";
%>
<!DOCTYPE html>
<html data-bs-theme="light">
   <head>

    <title>Normal user</title>
    <jsp:include page="/components/common_css_js.jsp" />
   </head>

   <body class="nor-bg">
      <jsp:include page="/components/navbar.jsp" />
       <h1>welcome normal user</h1>

   </body>
</html>