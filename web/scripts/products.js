
// Set the date we're counting down to
var countDownDate = new Date("Sep 25, 2019 23:51:25").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  if(document.get("discountTimer")!==null)
  document.getElementById("discountTimer").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
     if(document.getElementById("discountTimer")!==null)
   countDownDate = new Date("Sep 18, 2020 15:36:33").getTime();
  }
}, 1000);

             //LOAD NAVBAR
              $(function(){
        $('#destination').load('navbar.jsp');
                  });       
  
    
              //add food btn listeners
              $(document).on("click", ".foodBtn", function(e){  
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState===4 && xmlhttp.status===200)
{
document.getElementById("foodName").innerHTML=xmlhttp.responseText;
}
};
xmlhttp.open("GET","ProductServlet?id="+e.target.id.substring(3));
xmlhttp.send();
});

            //add beverage list ->         btn listeners
 $(document).on("click", ".beverageBtn", function(e){  
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState===4 && xmlhttp.status===200)
{
document.getElementById("beverageName").innerHTML=xmlhttp.responseText;
}
};
xmlhttp.open("GET","ProductServlet?id="+e.target.id.substring(3));
xmlhttp.send();
});

                //add product list ->    btn listeners
 $(document).on("click", ".productBtn", function(e){  
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState===4 && xmlhttp.status===200)
{
document.getElementById("productName").innerHTML=xmlhttp.responseText;
}
};
xmlhttp.open("GET","ProductServlet?id="+e.target.id.substring(3));
xmlhttp.send();
});

                //AJAX SEARCH FOR FOOD
var loadFood= function(){
if (document.getElementById("txt1").value.length===0)
{
document.getElementById("search").innerHTML="";
return;
}
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState===4 && xmlhttp.status===200)
{
document.getElementById("leftSearch").innerHTML=xmlhttp.responseText;
}
};
xmlhttp.open("GET","FoodServlet?input="+document.getElementById("txt1").value);
xmlhttp.send();
};

//AJAX SEARCH FOR BEVERAGE
var loadBeverage= function(){
if (document.getElementById("txt1").value.length===0)
{
document.getElementById("search").innerHTML="";
return;
}
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState===4 && xmlhttp.status===200)
{
document.getElementById("rightSearch").innerHTML=xmlhttp.responseText;
}
};
xmlhttp.open("GET","BeverageServlet?input="+document.getElementById("txt1").value);
xmlhttp.send();
};
