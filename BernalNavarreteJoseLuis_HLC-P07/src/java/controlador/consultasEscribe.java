/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import data.BrokerEscribe;
import entidades.Escribe;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.*;
import com.google.gson.Gson;
import data.BrokerAutor;
import entidades.Autor;
import java.util.ArrayList;

/**
 *
 * @author alumno
 */
@WebServlet(name = "consultasEscribe", urlPatterns = {"/consultasEscribe"})
public class consultasEscribe extends HttpServlet {

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
        
        try
        {
            
            if(request.getAttribute("insercion") != null)
            {
                request.setAttribute("insercion", request.getAttribute("insercion"));

            }
            
            String isbn = request.getParameter("isbn");
            
            BrokerEscribe broker = new BrokerEscribe();
            
            List<Escribe> listado = broker.getAllData(isbn);
            
            Gson jsonEscritores = new Gson();
            
            request.setAttribute("autores", jsonEscritores.toJsonTree(listado));

//            for (int i = 0; i < listado.size(); i++) {
//                System.out.println("\n" + listado.get(i).getId().getCodigoAutor());
//            }

            BrokerAutor bokerAutor = new BrokerAutor();
            
            List<Autor> listaAutoresNoParticipantes = bokerAutor.getAllAutores();
            
            for (int i = 0; i < listado.size(); i++) {
                
                for (int j = 0; j < listaAutoresNoParticipantes.size(); j++) {
                    
                    if(listaAutoresNoParticipantes.get(j).getCodigo() == listado.get(i).getId().getCodigoAutor())
                    {
                        listaAutoresNoParticipantes.remove(j);
                        break;
                    }
                }
            }
            
            request.setAttribute("noParticipantes", listaAutoresNoParticipantes);
            
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
