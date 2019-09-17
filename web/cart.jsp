<%@page import="model.Helper"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%Product f = Helper.getFood("").get((int)(Math.random()*(Helper.getFood("").size())));%>
<%Product b = Helper.getBeverage("").get((int)(Math.random()*(Helper.getBeverage("").size())));%>
<!DOCTYPE html>
  <html>
    <head>
      <meta charset="UTF-8">
      <title>Sign in</title>
      <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
      <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
      <link rel="stylesheet" type="text/css" href="styles/products.css">
      <script src="https://kit.fontawesome.com/c7b4130ebf.js"></script>   
      <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="scripts/search.js"></script>  
      <script>
              localStorage.clear();
                window.parentPage= true;       
       // window.onload = function() {
        //  start();
         // addListeners1();
         // };   
        localStorage.clear();
        $(function(){
        $('#destination').load('navbar.jsp');
                  });       
          
      </script>
    </head>
    <body>
        <div id="destination"></div>
        
                    <div id="leftSearch" class="one-edge-shadow">
                <h3> Best offer for today: </h3> <h2> <%=f.getProductName()%> </h2>
                <span><img src="<%=f.getImage()%>" alt="<%=f.getImage()%>" width="65" height="65"/></span>
                <h3><s class="red"><%=f.getPrice()%>$ </s><div class="white" id="discountTimer"></div> <strong><u> <%=f.getFinalPrice()%> $  </u><strong> <button type="button" id="<%=f.getProductId()%>" class="cart btn badge">
                        <i class="fas fa-cart-plus"></i></button></h3><br>
                <h4>Type: <%=f.getFood().getType()%> product</h4>
                <h4>Weight: <%=f.getFood().getWeight()%> g</h4>
                <h5>Description: <em> <%=f.getDescription()%></em></h5>
                <h5>Origin: <strong><%=f.getOrign()%></strong></h5>
                <h5>Bar-code: # <%=f.getBarCode()%></h5>
            </div>
            
            <div id="nameSpace">
               <div id="foodName" class="one-edge-shadow" ></div>
               <div id="productName" class="one-edge-shadow"><%=session.getAttribute("product")%></div>
               <div id="beverageName" class="one-edge-shadow" ></div>
            </div>
            <div id="rightSearch" class="one-edge-shadow">
                <h3> Best offer for today: </h3> <h2> <%=b.getProductName()%> </h2>
                <span><img src="<%=b.getImage()%>" alt="<%=b.getImage()%>" width="65" height="65"/></span>
                <h4><s class="white"><%=b.getPrice()%>$</s></h4><h3><%=b.getFinalPrice()%> $ <button type="button" id="<%=b.getProductId()%>" class="cart btn badge">
                        <i class="fas fa-cart-plus"></i></button></h3><br>
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
