<%-- 
    Document   : movement
    Created on : Aug 21, 2019, 10:23:07 PM
    Author     : Srki
--%>

<%@page import="java.util.Set"%>
<%@page import="model.Purchase"%>
<%@page import="model.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Settings</title>        		
			<link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
                        <link rel="stylesheet" type="text/css" href="styles/products.css">
                        <link rel="stylesheet" href="styles/bootstrap.css" type="text/css">
                        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
			<script src="https://kit.fontawesome.com/c7b4130ebf.js"></script>	
       		<script>
    window.parentPage = true;                
    localStorage.clear();
                    

    $(function(){              
     $('#destination').load('navbar.jsp');
 });     
		</script>

		</head>
		<body>
		<div id="destination">
			
		</div>

                   
   


		<div class="container" id="space"> 
			<div class="row">
				<div class="col-lg 12">
					<div id="mainDiv">
                                            <%
                                                ArrayList <Purchase> purchases = Helper.getPurchasesByCustomer(Helper.getCustomers(session.getAttribute("email").toString()).get(0));
                                                 if(session.getAttribute("msg")!=null){%> 
                                                <h3><%=session.getAttribute("msg")%></h3>
                                                <%session.removeAttribute("msg");}%>
                                                <select id="movement" class="form-control">
                                                    <option value="0" disabled selected>Purchase</option>
                                                    <%for(int i=0; i<purchases.size();i++){%>
                                                    <option value= '<%=i+1%>' > 
                        <%=purchases.get(i).getCustomer().getFirstName()+" "+purchases.get(i).getCustomer().getLastName()+" "
                        +purchases.get(i).getProduct().getProductName()+" "+purchases.get(i).getProduct().getPrice()+" "
                         +purchases.get(i).getTimeOfPurchase()%></option>
                                                    <%}%>
                                                </select>
                                                <button type="button" class="btn-warning btn-block" onclick="cancel()">Cancel</button>
					</div>
				</div>	
			</div>
		</div>  
                                                <script>
                                                    var cancel = function(){
                                                        console.log("STILL WORKING ON IT");
                                                       /* var selection = document.getElementById("movement").value;
                                                        if(selection == 0)return;
                                                        else
                                                         window.location.href="SettingsServlet?selection="+selection;*/
                                                    };
                                                </script>
                                                 
		</body>
	</html>
