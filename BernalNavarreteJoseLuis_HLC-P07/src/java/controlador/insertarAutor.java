/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import data.BrokerEscribe;
import entidades.Escribe;
import entidades.EscribeId;
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
 * @author alumno
 */
@WebServlet(name = "insertarAutor", urlPatterns = {"/insertarAutor"})
public class insertarAutor extends HttpServlet {

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
        
        BrokerEscribe broker;
        String cod;
        int codAut = 0;
        String isbn = "";
        String num = "";
        try
        {
            System.out.println("\nEntramos en insertarautor");
            
            isbn = request.getParameter("isbn");
            
            
            num = request.getParameter("cantidad");
            
            
            int n = Integer.parseInt(num);
            
            String beneficio = request.getParameter("beneficio");
            
            Float f = Float.parseFloat(beneficio);
            
            try
            {
                cod = request.getParameter("codigo");
                
            }
            catch(Exception Ex)
            {
                cod = "";
            }
            
            if(!cod.equals(""))
            {
                codAut = Integer.parseInt(cod);
            }
            
//            System.out.println("\nCodigo del autor: " + codAut);
//            System.out.println("\nISBN del libro: " + isbn);
//            System.out.println("\nNumero de autor que escribe el libro: " + n);
//            System.out.println("\nBeneficio del autor: " + f);
            
            broker = new BrokerEscribe();
            
            Escribe es = new Escribe();
            
            EscribeId id = new EscribeId();
            
            id.setCodigoAutor(codAut);
            
            id.setIsbn(isbn);
            
            id.setNumero(n);
            
            es.setId(id);
            
            es.setBeneficioAutor(f);
            
            broker.insertElement(es);
            
            System.out.println("\nInsercion con exito");
            
            request.setAttribute("insercion", "correcta");
            
        }
        catch(Exception ex)
        {
            System.out.println("\nsaltamos al catch");
            
            request.setAttribute("insercion", "incorrecta");
        }
        
        request.getRequestDispatcher("consultasEscribe?isbn=" + isbn).forward(request, response);
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
