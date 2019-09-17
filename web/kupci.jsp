<%-- 
    Document   : kupci
    Created on : Jun 12, 2019, 11:25:09 AM
    Author     : S
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entiteti.Kupac"%>
<%@page import="model.Usluge"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
function prikazi(str)
{
if (str.length==0)
{
document.getElementById("demo").innerHTML="";
return;
}
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState==4 && xmlhttp.status==200)
{
document.getElementById("demo").innerHTML=xmlhttp.responseText;
}
}
xmlhttp.open("GET","KupciServlet?unos="+str,true);
xmlhttp.send();
}
        </script>
        
        <title>Podaci o kupcima</title>
    </head>
    <body>
        <h1>Ovde je moguce pronaci kupce i izmeniti podatke o njima:</h1>
        <form action="KupacServlet" method="GET">
            Pretrazi listu kupaca: <input type="text" name="unos" id="txt1" onkeyup="prikazi(this.value)" />
            <button type="submit" name="button" value="button1">Unesi novog kupca</button><br>
            <br> <div id="demo"></div> <br>
            Odaberite kupca:
            <select name="kupac">
                    <%
                    ArrayList <Kupac> kupci = Usluge.vratiKupce("");
                    for (int i=0; i< kupci.size(); i++){
                    %>
                        <option value="<%=kupci.get(i).getIme()%>">
                        <%=kupci.get(i).getIme()%>
                        </option><%}%>
                </select><br> 
            <button type="submit" name="button" value="button2">Izmeni podatke</button>
            <button type="submit" name="button" value="button3">Ukloni kupca</button><br>
            Ime:<input type="text" name="ime" value="?"><br>
            Broj:<input type="text" name="broj" value="?"><br><br><br>
            <h3><a href="index.html">Vratite se na indeksnu stranicu<a/></h3>
        </form>    
    </body>
</html>
