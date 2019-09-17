/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Helper;
import model.Product;

/**
 *
 * @author Srki
 */
@WebServlet(name = "ProductsServlet", urlPatterns = {"/ProductsServlet"})
public class ProductsServlet extends HttpServlet {
        
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            String input = request.getParameter("input"); 
            ArrayList<Product> products = Helper.getProducts(input);
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet: Products Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            /*
            if(products.size()==1){
               Product fProduct = products.get(0);
            out.println("<h3>" + fProduct.getProductName() +" "+ "<img src='"+fProduct.getImage()+"' alt='"+fProduct.getImage().substring(7)+"' height='42' width='42'>");
            }else if(products.size()==2){
                Product fProduct = products.get(0);
                Product sProduct = products.get(1);
                out.println("<h3>" + fProduct.getProductName() +" "+ "<img src='"+fProduct.getImage()+"' alt='"+fProduct.getImage().substring(7)+"' height='42' width='42'>");
                out.println("<h3>" + sProduct.getProductName() +" "+ "<img src='"+sProduct.getImage()+"' alt='"+sProduct.getImage().substring(7)+"' height='42' width='42'>");
            }else if(products.size()>=3){
                Product fProduct = products.get(0);
                Product sProduct = products.get(1);
                Product tProduct = products.get(2);
                out.println("<button class='btn-block' type='button' onclick='compare()'>"+fProduct.getProductName()  + "<img src='"+fProduct.getImage()
                        +"' alt='"+fProduct.getImage().substring(7)+"' height='30' width='30'></button>");
                out.println("<button class='btn-block' type='button' onclick='compare()'>"+ sProduct.getProductName() + "<img src='"+sProduct.getImage()+"' alt='"+sProduct.getImage().substring(7)+"' height='30' width='30'></button>");
                out.println("<button class='btn-block' type='button' onclick='compare()'>"+ tProduct.getProductName() + "<img src='"+tProduct.getImage()+"' alt='"+tProduct.getImage().substring(7)+"' height='30' width='30'></button>");
            }*/
            int pMax;
            pMax = products.size();
            if(pMax>3)pMax=3;
            for(int p=0; p<pMax; p++)
                out.println("<button class='btn-block productBtn' type='button' id='btn"+products.get(p).getProductId()+"'>"+products.get(p).getProductName()  + "<img src='"+products.get(p).getImage()
                        +"' alt='"+products.get(p).getImage().substring(7)+"' height='30' width='30'></button>");
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
