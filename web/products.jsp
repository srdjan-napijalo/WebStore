<%-- 
    Document   : proizvodi
    Created on : Jun 12, 2019, 11:25:19 AM
    Author     : S
--%>
<%@page import="model.Product"%>
<%@page import="model.Helper"%>
<%@page import="java.util.ArrayList"%>
<%Product f = Helper.getFood("").get((int)(Math.random()*(Helper.getFood("").size())));%>
<%Product b = Helper.getBeverage("").get((int)(Math.random()*(Helper.getBeverage("").size())));%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
        <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="styles/products.css" type="text/css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="https://kit.fontawesome.com/c7b4130ebf.js"></script> 
        <script src="scripts/search.js"></script>
        <script src="scripts/products.js"></script> 

    
<%if(session.getAttribute("email")!=null){%>
 <script>
       $(document).on("click", ".cart", function(e){
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState===4 && xmlhttp.status===200)
{
document.getElementById("myCart").value= 10;
}
};
xmlhttp.open("GET","CartServlet?id="+e.target.id);
xmlhttp.send();
        });   
</script>
 <%}else{%>
 <script>
 $(document).on("click", ".cart", function(e){
        window.location.href="login.jsp?";
        });   
 </script>
 <%}%>
        
        <title>Podaci o proizvodima</title>
    </head>
    <body>
        <div id="destination"></div>
        
            <div id="leftSearch" class="one-edge-shadow">
                <h3> Best offer for today: </h3> <h2> <%=f.getProductName()%> </h2>
                <span><img src="<%=f.getImage()%>" alt="<%=f.getImage()%>" width="65" height="65"/></span>
                <h3 class="red"><%=f.getPrice()%>$  <button type="button" id="<%=f.getProductId()%>" class="cart btn badge">
                        <i class="fas fa-cart-plus"></i></button></h3><br>
                <h4>Type: <%=f.getFood().getType()%> product</h4>
                <h4>Weight: <%=f.getFood().getWeight()%> g</h4>
                <h5>Description: <em> <%=f.getDescription()%></em></h5>
                <h5>Origin: <strong><%=f.getOrign()%></strong></h5>
                <h5>Bar-code: # <%=f.getBarCode()%></h5>
            </div>
            
            <div id="nameSpace">
               <div id="foodName" class="one-edge-shadow" ></div>
               <div id="productName" class="one-edge-shadow"></div>
               <div id="beverageName" class="one-edge-shadow" ></div>
            </div>
            <div id="rightSearch" class="one-edge-shadow">
                <h3> Best offer for today: </h3> <h2> <%=b.getProductName()%> </h2>
                <span><img src="<%=b.getImage()%>" alt="<%=b.getImage()%>" width="65" height="65"/></span>
                <h4 class="white"><%=b.getPrice()%>$</h4>
                <button type="button" id="<%=b.getProductId()%>" class="cart btn badge"> <i class="fas fa-cart-plus"></i></button>
                <br>
                <h4>Type: <%=b.getBeverage().getType()%> beverage</h4>
                <h4>Volume: <%=b.getBeverage().getVolume()%> ml</h4>
                <h4>Alcohol: <%=b.getBeverage().getAlcohol()%> %</h4>
                <h5>Description: <em> <%=b.getDescription()%></em></h5>
                <h5>Origin: <strong><%=b.getOrign()%></strong></h5>
                <h5>Bar-code: # <%=b.getBarCode()%></h5>      
            </div>
     
            
            
            
        


      <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"  crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>  
    </body>
</html>

