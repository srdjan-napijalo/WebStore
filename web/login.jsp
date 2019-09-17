<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
             
        $(function(){
        $('#destination').load('navbar.jsp');
                  });       
          
      </script>
    </head>
    <body>
        <div id="destination"></div>
        
        <div class="container" >
                <div class="row">
                  <div class="col-lg 12">
                        <form class="form-horizontal one-edge-shadow" role="form" action="LoginServlet" method="POST" id="mojaForma">
                            <span id="pozdrav"><%if((request.getAttribute("hello")!=null)){%>
                                <hr>
				<%=(request.getAttribute("hello"))%>	
                                
				<hr>	    
                                            <%}%>
                                </span> 
                <h2>Sign in: </h2>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email: </label>
                    <div class="col-sm-9">
                        <input type="email" id="email" placeholder="Email" class="form-control one-edge-shadow" name= "email" value="${fn:escapeXml(param.mail)}" required">
                    </div>
                </div> 
                
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password: </label>
                    <div class="col-sm-9">
            <input type="password" id="password" name="password" placeholder="Password" class="form-control one-edge-shadow" value="${fn:escapeXml(param.pw)}" required=""
            pattern="(?=.*\d)(?=.*[a-z]).{6,}" title="Must contain at least one number and one (lowercase) letter, and at least 6 or more characters">
                    </div>
                </div>
                
                 <button type="submit" class="btn btn-warning center-block one-edge-shadow" > <i class="fas fa-sign-in-alt"></i> Sign in </button>
                 
                 <div class="form-group">
                     <div class="col-sm-12 white">
                         <%if(request.getAttribute("comment")!=null){%>
                         <%=request.getAttribute("comment")%><%}%>
                     </div>
                    <div class="col-sm-12" id="regDiv"><label> Not registered yet?<a href="registracija.jsp"> Sign up!</a> </label>
                        
                    </div>
                </div> 
                
                </form>
	 </div>
                     <div id="productName"></div>
   </div>
</div>
                      
        
        
        
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"  crossorigin="anonymous"></script>
      <script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>  
        
</body>
</html>
