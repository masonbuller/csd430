<%@page language="java" contentType="text/html"%>
<%
  String base = (String)application.getAttribute("base");
  String imageURL = (String)application.getAttribute("imageURL");
  %>
<style>
    .header {
      background: "<%=imageURL%>bg_header.gif"
    }
</style>
<div class="header">
  <div class="logo">
    <p>e-Shopping Center</p>
    </div>
  <div class="cart">
    <a class="link2" href="<%=base%>?action=showCart">Show Cart
      <img src="<%=imageURL%>cart.gif" border="0" alt=""/></a>
    </div>
  </div>