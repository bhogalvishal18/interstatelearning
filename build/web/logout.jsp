<%-- 
    Document   : logout
    Created on : Jan 8, 2019, 11:03:28 AM
    Author     : Vishal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   session.invalidate();
    response.sendRedirect("/");
    return; // <--- Here. 
%>