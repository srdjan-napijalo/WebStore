/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Helper;

/**
 *
 * @author Srki
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
        
     
        
        String fName,lName, mail, pw ,  gender, birthDay, birthMonth, birthYear, date;
        
        fName = request.getParameter("firstName");
        lName = request.getParameter("lastName");
        mail = request.getParameter("eMail");
        pw = request.getParameter("password");
        gender = request.getParameter("gender");
        birthDay = request.getParameter("birthDay");
        birthMonth = request.getParameter("birthMonth");
        birthYear = request.getParameter("birthYear");
        date = birthYear+"-"+birthMonth+"-"+birthDay; 
        //if(date.equals("null"))date="1111-11-11";     
        RequestDispatcher rd;
        if(Helper.getCustomers(mail).isEmpty())
        {
            Customer c = new Customer();
            c.setFirstName(fName);
            c.setLastName(lName);
            c.setEmail(mail);
            c.setPassword(pw);
            c.setPurchases(0);
            c.setAccountBalance(BigDecimal.valueOf(100));
            Helper.insert(c);
            request.setAttribute("hello", "<strong>"+fName+" "+lName+ "</strong><em> has successfully registered!</em>");
            rd = request.getRequestDispatcher("login.jsp");
        }
            else{
          
            request.setAttribute("comment", " E-mail is already in use! ");
            request.setAttribute("komentar2", "To recover your account follow next <a href='ideja.html'>link.</a> ");
            request.setAttribute("mail",mail);
            request.setAttribute("fName", fName);
            request.setAttribute("lname", lName);
            request.setAttribute("gender", gender);  
            rd = request.getRequestDispatcher("register.jsp");
        }
        
        rd.forward(request, response);
        try (PrintWriter out = response.getWriter()) {
  
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
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
