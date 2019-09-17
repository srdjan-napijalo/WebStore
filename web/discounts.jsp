<%-- 
    Document   : contact
    Created on : Sep 10, 2019, 4:49:42 PM
    Author     : Srki
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Helper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList <Product> products = Helper.getProducts("");%>
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
        <script src="scripts/product.js"></script>
        <script>
             //LOAD NAVBAR
              $(function(){
        $('#destination').load('navbar.jsp');
                  });      
        </script>
        <title>Discounts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div id="destination"></div>
        <div id="mainDiv">
        <h1> Best offer for today: </h1>
        <%for(int i=0; i<products.size();i++)
            if(products.get(i).getDiscount() != 0){%>
        <div class="product one-edge-shadow">
             <h2> <%=products.get(i).getProductName()%> </h2>
<span><img src="<%=products.get(i).getImage()%>" alt="<%=products.get(i).getImage()%>" width="65" height="65"/></span>
<h3><s class="red"><%=products.get(i).getPrice()%>$ </s><div class="discountTimer"></div>
    <strong><u> <%=products.get(i).getFinalPrice()%> $  </u><strong> <button type="button" id="<%=products.get(i).getProductId()%>" class="cart btn badge">
                        <i class="fas fa-cart-plus"></i></button></h3><br>
                        <%if(products.get(i).getFood()!=null){%>
                        <h4>Type: <%=products.get(i).getFood().getType()%> product</h4>
                        <h4>Weight: <%=products.get(i).getFood().getWeight()%> g</h4>
                        <%}else if(products.get(i).getBeverage()!=null){%>    
                        <h4>Type: <%=products.get(i).getBeverage().getType()%> beverage</h4>
                        <h4>Volume: <%=products.get(i).getBeverage().getVolume()%> ml</h4>
                        <h4>Alcohol: <%=products.get(i).getBeverage().getAlcohol()%> %</h4>   
                    <%}%>
                <h5>Description: <em> <%=products.get(i).getDescription()%></em></h5>
                <h5>Origin: <strong><%=products.get(i).getOrign()%></strong></h5>
                <h5>Bar-code: # <%=products.get(i).getBarCode()%></h5>
            </div>
            <%}%>
        </div>
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"  crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>  
    </body>
</html>
