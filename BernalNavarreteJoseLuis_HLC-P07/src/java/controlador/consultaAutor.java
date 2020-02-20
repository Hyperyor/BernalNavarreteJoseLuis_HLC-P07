/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import data.BrokerAutor;
import data.BrokerEscribe;
import entidades.Autor;
import entidades.Escribe;
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
@WebServlet(name = "consultaAutor", urlPatterns = {"/consultaAutor"})
public class consultaAutor extends HttpServlet {

    private boolean datosCorrectos;
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
        //String url = "";
        
        
        
        String isbn="";
        try
        {
            
            String update = request.getParameter("update");
            
            String codStr = request.getParameter("codigo");
            
            isbn = request.getParameter("isbn");
            
            BrokerAutor broker = new BrokerAutor();
            
            Float beneficio = 0f;
            
            int cod = 0;
            
            if(update.equals("si"))
            {
                String name = request.getParameter("nombre");
                
                String ben = request.getParameter("beneficio");
                
                try
                {
                    
                    beneficio = Float.parseFloat(ben);
                    
                    comprobarDatosCorrectos(name, beneficio);
                    
                    cod = Integer.parseInt(codStr);
                }
                catch(Exception ex)
                {
                    
                    datosCorrectos = false;
                }
                
                if(datosCorrectos)
                {
                    //hacemos el update
                    System.out.println("\nhacemos update");
                    broker.updateAutor(cod, name, beneficio);
                    System.out.println("\nTerminamos update");
                    request.setAttribute("updateCorrecto", "si");
                }
                else
                {
                    request.setAttribute("updateCorrecto", "no");
                }
            }
            else
            {
                request.setAttribute("updateCorrecto", "si");
            }
            broker = new BrokerAutor();
            cod = Integer.parseInt(codStr);
            System.out.println("\nTomamos datos");
            List<Autor> listado = broker.getAutor(cod);
            
            request.setAttribute("autor", listado.get(0));
            System.out.println("\nDevolvemos d");
//            for (int i = 0; i < listado.size(); i++) {
//                System.out.println("\n" + listado.get(i).getId().getCodigoAutor());
//            }
            //url = "datosAutor.jsp";
        }
        catch(Exception ex)
        {
            //url = "datosAutor.jsp";
        }
        
        request.setAttribute("isbn", isbn);
        
        request.getRequestDispatcher("datosAutor.jsp").forward(request, response);
    }
    
    private void comprobarDatosCorrectos(String name, Float beneficio)
    {
        if(beneficio > 0 && !name.equals(""))
        {
            datosCorrectos = true;
        }
        else
        {
            datosCorrectos = false;
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
