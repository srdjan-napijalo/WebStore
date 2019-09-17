
var search = function(str)
{
if (str.length===0)
{
document.getElementById("search").innerHTML="";
return;
}
xmlhttp=new XMLHttpRequest();
xmlhttp.onreadystatechange=function()
{
if (xmlhttp.readyState===4 && xmlhttp.status===200)
{
document.getElementById("search").innerHTML=xmlhttp.responseText;
}
};
xmlhttp.open("GET","ProductsServlet?input="+str,true);
xmlhttp.send();
};