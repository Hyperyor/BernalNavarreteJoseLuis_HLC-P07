/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import data.BrokerCuenta;
import entidades.Cuenta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hyperior
 */
@WebServlet(name = "consultaLogin", urlPatterns = {"/consultaLogin"})
public class consultaLogin extends HttpServlet {

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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String user = req.getParameter("user");
        String pass = req.getParameter("pass");

        BrokerCuenta broker = new BrokerCuenta();

        List<Cuenta> cuenta = broker.getCuenta(user, pass);

        req.setAttribute("resultado", cuenta);
        System.out.println("\nredireccionamos");
        req.getRequestDispatcher("login.jsp").forward(req, resp);
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String user = req.getParameter("user");
        String pass = req.getParameter("pass");

        BrokerCuenta broker = new BrokerCuenta();

        List<Cuenta> cuenta = broker.getCuenta(user, pass);

        if (cuenta.isEmpty()) {
            req.getSession().setAttribute("inicio", 0);
            //System.out.println("\n esta vacio");
        } else {
            req.getSession().setAttribute("inicio", 1);
        }

        req.getSession().setAttribute("resultado", cuenta);
        //req.setAttribute("resultado", cuenta);
        System.out.println("\nredireccionamos");
        req.getRequestDispatcher("login.jsp").forward(req, resp);
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
