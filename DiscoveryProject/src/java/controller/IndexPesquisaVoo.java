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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.*;


@WebServlet(name = "IndexPesquisaVoo", urlPatterns = {"/IndexPesquisaVoo"})
public class IndexPesquisaVoo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        // Capturar dados recebidos do formulário.
        int origem  = Integer.parseInt(request.getParameter("origem"));
        int destino = Integer.parseInt(request.getParameter("destino"));
        int tipo    = request.getParameter("tipo").equals("1") ? 1 : 2;     // IdaVolta: 1; SóIda: 2.
        int cabine  = request.getParameter("cabine").equals("1") ? 1 : 2;   // Econômica: 1; PrimeiraClasse: 2.      
        String dataIda     = request.getParameter("data_ida");
        String dataVolta   = request.getParameter("data_volta");                
                
        // Obter cidades envolvidas nas consultas.
        Cidade CidadeOrigem     = Cidade.consultaCidade(origem);
        Cidade CidadeDestino    = Cidade.consultaCidade(destino);
        
        // Obter programações para a data de ida especificada.
        ArrayList<Object[]> tIda = Programacao.pesquisarVoo(
            origem,
            destino,
            cabine,
            dataIda
        );
        
        // Obter programações para a data de volta especificada, se tipo for 1.
        ArrayList<Object[]> tVolta = null;
        if ( tipo == 1 )
        {
            tVolta = Programacao.pesquisarVoo(
                destino,
                origem,
                cabine,
                dataVolta
            );
        }
        
        // Instanciar estrutura de dados para COMPRA
        HashMap<String, Object> COMPRA = new HashMap<String, Object>();
        COMPRA.put("CidadeOrigem", CidadeOrigem);   // Objeto Cidade
        COMPRA.put("CidadeDestino", CidadeDestino); // Objeto Cidade
        COMPRA.put("Cabine", cabine);               // Inteiro
        COMPRA.put("TipoViagem", tipo);             // Inteiro
        COMPRA.put("DataIda", dataIda);             // String
        COMPRA.put("DataVolta", dataVolta);         // String
        COMPRA.put("tIda", tIda);                   // ArrayList<Object[]>
        COMPRA.put("tVolta", tVolta);               // ArrayList<Object[]>
        
        request.getSession().setAttribute("COMPRA", COMPRA);
        
        // Encaminhar requisição e dados da consulta para página destino.
        RequestDispatcher dispatcher = request.getRequestDispatcher("viagem.jsp");
        dispatcher.forward(request, response);    
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
