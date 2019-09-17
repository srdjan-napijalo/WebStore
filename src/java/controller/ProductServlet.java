/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.Helper;
import model.Product;
import model.Seen;

/**
 *
 * @author Srki
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
             
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.valueOf(request.getParameter("id"));
        Product p = Helper.getProductById(id);
        try (PrintWriter out = response.getWriter()) {
                 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>"+p.getProductName()+"</h2><span><img src='"+p.getImage()+"'"
                    + " alt='"+p.getImage()+"' width='65' height='65' /></span><h3>"+p.getPrice()+" $</h3><br>");
            if(p.getBeverage()!=null)
            out.println("<h4>Type: "+p.getBeverage().getType()+" beverage</h4>"
                    + "<h4>Volume: "+p.getBeverage().getVolume()+" ml</h4>"
                    + "<h4>Alcohol: "+p.getBeverage().getAlcohol()+" % </h4>");
            else if(p.getFood()!=null)
            out.println("<h4>Type: "+p.getFood().getType()+ " product</h4>"
          + "<h4>Weight: "+p.getFood().getWeight()+" g</h4>");
            out.println("<h5>Description: <em> "+p.getDescription()+" </em></h5>" +
            "<h5>Origin: <strong>"+p.getOrign()+" </strong></h5>" +
            "<h5>Bar-code: # "+p.getBarCode()+" </h5>");
      /*  
        String email;
        HttpSession session = request.getSession();
        
        if(session.getAttribute("email")!=null){
        email = request.getSession().getAttribute("email").toString();
        Customer customer = Helper.getCustomers(email).get(0);
        
           if(!Helper.getSeen(customer.getCustomerId(), p.getProductId()).isEmpty()){
           Seen seen = Helper.getSeen(customer.getCustomerId(), p.getProductId()).get(0);
           seen.setTimesSeen(seen.getTimesSeen()+1);
           seen.setLastTimeSeen(new Date());
           Helper.seenUpdate(seen);
           }}else{ 
                if(Helper.getSeen(7, p.getProductId()).isEmpty())
                Helper.seen(Helper.getCustomers("unregistered@customers.com").get(0), p);
                 else {
                Seen seen = Helper.getSeen(7, p.getProductId()).get(0);
                seen.setTimesSeen(seen.getTimesSeen()+1);
                seen.setLastTimeSeen(new Date());
                Helper.seenUpdate(seen);
            }}*/
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
