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
        try
        {
            String isbn = request.getParameter("isbn");
            
            broker = new BrokerEscribe();
            
            Escribe es = new Escribe();
            
            EscribeId id = new EscribeId();
            
            id.setCodigoAutor(456);
            
            id.setIsbn(isbn);
            
            id.setNumero(3);
            
            es.setId(id);
            
            es.setBeneficioAutor(80.0f);
            
            broker.insertElement(es);
            
            broker = new BrokerEscribe();
            
            List<Escribe> listado = broker.getAllData(isbn);
            
            Gson jsonEscritores = new Gson();

            request.setAttribute("autores", jsonEscritores.toJsonTree(listado));
            
            request.setAttribute("isbn", isbn);

//            for (int i = 0; i < listado.size(); i++) {
//                System.out.println("\n" + listado.get(i).getId().getCodigoAutor());
//            }
            
        }
        catch(Exception ex)
        {
            
        }
        
        request.getRequestDispatcher("escritores.jsp").forward(request, response);
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
