<%-- 
    Document   : navbar
    Created on : Sep 9, 2019, 12:03:54 PM
    Author     : Srki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Nav-Bar</title>
      <script>           
    $(function(){
            $('a').each(function(){
                if ($(this).prop('href') === window.location.href) {
                    $(this).addClass('active'); $(this).parents('li').addClass('active');
                }
            });
        });
      </script>
</head>
<body>

  <div class="bg-primary one-edge-shadow">
    <nav class="navbar navbar-default  bg-transparent ">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <img alt="Food & Baverage Store" src="images/store.jpg" class="navbar-brand"/>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="true">
          <span><img src="images/burger.jpg" alt="X" width="40" height="40"/></span> 
          </button>  
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
              <li class="one-edge-shadow"><a href="products.jsp"><i class="fas fa-shopping-basket"></i> Shop </a></li>
            <li >
              <form class="navbar-form navbar-left">
                <div class="form-group form-inline">
                  <button id="loadFoodBtn" type="button" onclick="loadFood()" class="form-control btn btn-default"> <i class='fas fa-drumstick-bite'></i></button>
                  <input type="text"  id="txt1" onkeyup="search(this.value)" class="form-control one-edge-shadow" placeholder="Search for products...">
                  <button id="loadBeverageBtn" type="button" onclick="loadBeverage()" class="form-control btn btn-default"> <i class='fas fa-wine-bottle'></i></button>
                  <div id="search"></div>      
                </div>
              </form>
            </li>
            <%if(session.getAttribute("email")==null){%>
            <li class="one-edge-shadow" ><a href="login.jsp" > <i class="fas fa-sign-in-alt"></i> Sign in </a></li>
            <li class="one-edge-shadow" ><a class="page" href="register.jsp" > <i class="fas fa-user-plus"></i> Sign up </a></li>
            <%}else{%>
            <li ><a href="cart.jsp" id="myCart"> <i class="fas fa-shopping-cart"></i> My cart </a></li>
            <li ><a class="page" href="settings.jsp" ><i class="fas fa-tools"></i> <i class="fas fa-user-plus"></i> Account </a></li>
            <%}%>
            <li class="one-edge-shadow" ><a class="page"  href="discounts.jsp" > <i class="fas fa-bullhorn"></i> Discounts </a></li>
            <li class="one-edge-shadow" ><a class="page" href="contact.jsp" ><i class="fas fa-phone-square"></i> Contact us </a></li>
            <%if(session.getAttribute("email")!=null){%>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-user"></i> A <span class="caret whitesmokeClass"></span></a>
              <ul class="dropdown-menu">
                <li><a href="settings.jsp"> <i class="fas fa-wrench"></i> Settings</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="LogoutServlet"> <i class="fas fa-power-off"></i> Log out</a></li>
              </ul>  
            </li>
            <%}%>
          </ul>    
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-->
    </nav>
  </div> 
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"  crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>  
</body>
</html>
