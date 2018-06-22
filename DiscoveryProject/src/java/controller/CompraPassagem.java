/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Cidade;

/**
 *
 * @author mateus
 */
public class CompraPassagem extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Carregar dados da estrutura de compra.
        HashMap<String, Object> COMPRA = (HashMap<String, Object>) request.getSession().getAttribute("COMPRA");
        
        // Extrair lista de programações de Ida e pegar valor da programação selecionada.
        ArrayList<Object[]> tIda = (ArrayList<Object[]>) COMPRA.remove("tIda");
        int pIda    = Integer.parseInt( request.getParameter("select_ida") );
        float vIda  = 0.0f;
        for (int i=0; i< tIda.size(); i++)
            if ( pIda == (int)tIda.get(i)[0] ) 
            {
                vIda = (float)tIda.get(i)[4];
                break;
            }
        COMPRA.put("ProgIda", pIda);
        COMPRA.put("ValorIda", vIda);
        
        // Extrair lista de programações de Volta e pegar valor da programação selecionada.
        ArrayList<Object[]> tVolta = (ArrayList<Object[]>) COMPRA.remove("tVolta");
        int pVolta      = 0;
        float vVolta    = 0.0f;
        if ( tVolta!=null && (int)COMPRA.get("TipoViagem")==2 ) {
            pVolta      = request.getParameter("select_volta")!=null ? Integer.parseInt( request.getParameter("select_volta") ) : 0;
            if ( request.getParameter("select_volta")!=null )
                for (int i=0; i< tVolta.size(); i++)
                    if ( pVolta == (int)tVolta.get(i)[0] ) 
                    {
                        vVolta = (float)tVolta.get(i)[4];
                        break;
                    }
            
            COMPRA.put("ProgVolta", pVolta);
            COMPRA.put("ValorVolta", vVolta);
        }        
        
        request.getSession().setAttribute("COMPRA", COMPRA);
                
        // Verificar se usuário esta conectado.
        // Se sim, encaminhar para página "compras.jsp".
        // Se não, encaminhar para página "login.jsp".
        if ( request.getSession().getAttribute("cliente") != null )
            response.sendRedirect("compras.jsp");
        else
            response.sendRedirect("login.jsp");
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
