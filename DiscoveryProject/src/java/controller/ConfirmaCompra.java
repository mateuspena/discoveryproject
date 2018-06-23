/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Cliente;
import negocio.Pagamento;
import negocio.Passagem;

/**
 *
 * @author mateus
 */
public class ConfirmaCompra extends HttpServlet {

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
        // Carregar dados da pesquisa.
        HashMap<String, Object> COMPRA = (HashMap<String, Object>) request.getSession().getAttribute("COMPRA");
        
        // Descartar estrutura de dados compra.
        request.getSession().setAttribute("COMPRA", null);
        
        // Obter dados da estrutura.
        Cliente clt     = (Cliente)request.getSession().getAttribute("cliente");  
        int cabine      = Integer.parseInt( COMPRA.get("Cabine").toString() );
        int pIdaCod     = Integer.parseInt( ((Object[])COMPRA.get("Ida"))[0].toString() );
        float pIdaValor = Float.parseFloat( ((Object[])COMPRA.get("Ida"))[1].toString() );
        
        int pVoltaCod       = 0;
        float pVoltaValor   = 0.0f;
        if ( (int)COMPRA.get("TipoViagem") == 1 )
        {
            pVoltaCod       = Integer.parseInt( ((Object[])COMPRA.get("Volta"))[0].toString() );
            pVoltaValor     = Float.parseFloat( ((Object[])COMPRA.get("Volta"))[1].toString() );
        }
        
        // Obter dados do formulário.
        String numCard  = request.getParameter("NumCartao");                                 
        String codCard  = request.getParameter("CodCartao");                                 
        String idaDataVencimento   = request.getParameter("Ida_DataVencimento");                
        int idaQtdParcelas         = (request.getParameter("Ida_QtdParcelas") != null ) 
                                        ? Integer.parseInt( request.getParameter("Ida_QtdParcelas") ) 
                                        : 1; 
        
        String voltaDataVencimento = null;
        int voltaQtdParcelas = 0;
        if ( (int)COMPRA.get("TipoViagem") == 1 )
        {
            voltaDataVencimento = request.getParameter("Volta_DataVencimento");                
            voltaQtdParcelas    = (request.getParameter("Volta_QtdParcelas") != null ) 
                                        ? Integer.parseInt( request.getParameter("Volta_QtdParcelas") ) 
                                        : 1;
        }
        
        // Instanciar objetos Passagem.
        Passagem ida = new Passagem(
            pIdaCod,
            cabine,
            new Pagamento(numCard, codCard, pIdaValor, idaDataVencimento, idaQtdParcelas),
            clt
        );
        
        Passagem volta = null;
        if ( (int)COMPRA.get("TipoViagem") == 1 )
            volta = new Passagem(
                pVoltaCod,
                cabine,
                new Pagamento(numCard, codCard, pVoltaValor, voltaDataVencimento, voltaQtdParcelas),
                clt
            );
        
        // Executar operaçao de compras.
        ida.confirmarCompra();
        if (volta!=null) volta.confirmarCompra();
        
        // Encaminhar para página de perfil.
        response.sendRedirect("meuperfil.jsp");
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
