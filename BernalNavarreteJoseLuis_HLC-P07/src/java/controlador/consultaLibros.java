/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import data.BrokerCuenta;
import data.BrokerLibros;
import entidades.Cuenta;
import entidades.Libro;
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
@WebServlet(name = "consultaLibros", urlPatterns = {"/consultaLibros"})
public class consultaLibros extends HttpServlet {

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

        Cuenta c = (Cuenta) request.getSession().getAttribute("user");

        String user = c.getUsuario();

        BrokerLibros broker = new BrokerLibros();

        String anio = "0";
        
        String orden = "Descendente";
        
        try
        {
        
            anio = "" + request.getParameter("anio").toString();
            
           
        }
        catch(Exception Ex)
        {
            anio = null;

        }
        
        try
        {
        
            
            orden = request.getParameter("orden").toString();
        }
        catch(Exception Ex)
        {
            orden = "Descendente";
        }
        
        if(orden.equals("Descendente"))
        {
            orden = "desc";
        }
        else
        {
            orden = "asc";
        }

//        try {
//            System.out.println("\n" + request.getParameter("anio") );
//            
//            String anio = request.getAttribute("anio").toString();
//            
//            n = Integer.parseInt(anio);
//            
//            System.out.println("\n" + n);
//        } catch (Exception ex) {
//            System.out.println("\nAl catch");
//            n = 0;
//        }

        if (anio == null || anio.equals("")) { //si queremos todos los libros del usuario

            List<Libro> libros = broker.getAllBooks(user, orden);

            request.setAttribute("libros", libros);
            request.setAttribute("filtro", "no");

        }
        else
        {
            
            List<Libro> libros = broker.getBooksByYear(anio, user, orden);

            request.setAttribute("libros", libros);
            request.setAttribute("filtro", "si");
        }

        request.getRequestDispatcher("biblioteca.jsp").forward(request, response);

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
