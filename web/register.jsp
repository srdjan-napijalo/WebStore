<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
  <html>
    <head> 
    	<title>Register page</title>   
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
        <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
        <link rel="stylesheet" href="styles/products.css" type="text/css">
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="https://kit.fontawesome.com/c7b4130ebf.js"></script> 
                <script src="scripts/search.js"></script>
                <script src="scripts/register.js"></script>
        <script>
     
    $(function(){
        $('#destination').load('navbar.jsp');
                  }); 
                  
       window.onload = function() {
            selectItems();
            addListeners();
          };   
              
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
    <div id="destination">  
    </div>

        <div class="container" >
            <div class="row">
                <form class="form one-edge-shadow" onsubmit="return validate()" action="RegisterServlet" role="form" id="myForm" method="POST">
                        <h2>Sign up! </h2>
                        <div class="form-group">
                            <label for="firstName" class="col-lg-3">First Name: <span class="hintSpan white"></span></label>
                            <input type="text" name="firstName" id="firstName" placeholder="..." value="${fn:escapeXml(param.fName)}" class="form-control one-edge-shadow" autofocus>
                            <span id="fNameHint" class="white"></span>
                        </div>
                        <div class="form-group">
                        <label for="lastName" class="col-lg-3">Last Name:  <span class="hintSpan white"></span> </label>
                        <input type="text" name="lastName" id="lastName" placeholder="..." value="${fn:escapeXml(param.lName)}" class="form-control one-edge-shadow">
                        <span id="lNameHint" class="white"></span>
                    </div>
                        <div class="form-group">
                            <div class="form-group">
                                <label for="eMail" class="col-lg-3">Email:  <span class="hintSpan white"></span> </label>
                                <input type="email" id="eMail" placeholder="..." value="${fn:escapeXml(param.mail)}" class="form-control one-edge-shadow" name= "eMail">
                                <span id="emailHint" class="white"></span>
                                <div>
                                    <span class="white"><%if(request.getAttribute("comment")!=null){%>
                                     <%=request.getAttribute("comment")%><%}%></span> 
                                </div>
                                <div>
                                    <span class="white"><%if(request.getAttribute("comment2")!=null){%>
                                    <%=request.getAttribute("comment2")%><%}%></span>
                            </div>
                        </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-lg-3" >Password:  <span class="hintSpan white"></span> </label>
                            <input type="password" name="password" id="password"  placeholder="..." class="form-control one-edge-shadow">
                            <span id="pwHint" class="white"></span>
                        </div>
                           
                        
                            <div class="form-group">
                        <label for="password" class="col-lg-3" >Confirm password:  <span class="hintSpan white"></span> </label>
                        <input type="password" id="password2" placeholder="..." class="form-control one-edge-shadow">
                        <span id="pw2Hint" class="white"></span>
                    </div>
                            <div id="infoSpan" class="white"></div>
                             <div class="form-group">
                                <label for="birthYear" class="col-lg-3">Date of birth: </label>
                                    <div class="form-group form-inline">
                                <select id="birthYear" name="birthYear" class="form-control one-edge-shadow">
                                    <option value="1995" selected disabled>Year</option>
                                </select>
                                <select id="birthMonth" name="birthMonth" class="form-control one-edge-shadow" >
                                    <option value="0" disabled selected>Month</option>
                                    <option value="1">January</option>
                                    <option value="2">February</option>
                                    <option value="3">March</option>
                                    <option value="4">April</option>
                                    <option value="5">May</option>
                                    <option value="6">Jun</option>
                                    <option value="7">July</option>
                                    <option value="8">August</option>
                                    <option value="9">September</option>
                                    <option value="10">October</option>
                                    <option value="11">November</option>
                                    <option value="12">December</option>
                                </select>
                                <select id="birthDay" name="birthDay" class="form-control one-edge-shadow">
                                    <option value=30 disabled selected>Day</option>
                                </select>
                             </div>
                            </div>
                                <div class="form-group col-lg-12">
                                     <div class="row">
                                            <label class="radio-inline badge" id="genBtn"><strong><i class="fas fa-redo"></i></strong></label>
                                            <label >Gender : </label>
                                            <label class="radio-inline badge" id="fBtn"><strong>F</strong></label>
                                            <input type="radio" id="femRadio"  name="gender" value="fem">
                                            <label class="radio-inline badge" id="mBtn"><strong>M</strong></label>
                                            <input type="radio" id="maleRadio" name="gender" value="male">   
                                     </div>
                              </div>
                <button type="submit" class="btn btn-warning center-block one-edge-shadow" > <i class="fas fa-user-plus"></i> Sign up! </button>
                <div id="regDiv">Already registered?<a href="prijava.jsp"> Sign in!</a> </div>     
                 </form>
             </div>
        </div>           
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"  crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>  
</body>
</html>
