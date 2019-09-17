<%-- 
    Document   : prodaja
    Created on : Jun 12, 2019, 11:25:30 AM
    Author     : S
--%>


<%@page import="entiteti.Proizvod"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entiteti.Kupac"%>
<%@page import="model.Usluge"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stranica za prodaju</title>
    </head>
    <body>
            
        <h1>Ovde mozete prodati proizvode kupcima: </h1><br>
            <form action="ProdajaServlet" method="GET">
                
                <select name="kupac">
                    <%
                    ArrayList <Kupac> kupci = Usluge.vratiKupce("");
                    for (int i=0; i< kupci.size(); i++){
                    %>
                        <option value="<%=kupci.get(i).getIme()%>">
                        <%=kupci.get(i).getIme()%>
                        </option><%}%>
                </select><br>
                <select name="proizvod">
                    <%
                    ArrayList <Proizvod> proizvodi = Usluge.vratiProizvode("");
                    for (int i=0; i< proizvodi.size(); i++){
                    %>
                        <option value="<%=proizvodi.get(i).getNaziv()%>">
                        <%=proizvodi.get(i).getNaziv()%> 
                        </option><%}%>
                </select>
                <button type="submit" name="button" value="button1">
                Prodaj proizvod kupcu</button>
            </form>
                
                
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"  crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>              
    </body>
</html>
