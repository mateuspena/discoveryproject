/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
        int CidadeOrigem    = Integer.parseInt(request.getParameter("origem"));
        int CidadeDestino   = Integer.parseInt(request.getParameter("destino"));
        int TipoViagem  = request.getParameter("tipo").equals("1") ? 1 : 2;     // IdaVolta: 1; SóIda: 2.
        int Cabine      = request.getParameter("cabine").equals("1") ? 1 : 2;   // Econômica: 1; PrimeiraClasse: 2.     
        
        // Obter cidades envolvidas nas consultas.
        Cidade city = null;
        
        city = Cidade.consultaCidade(CidadeOrigem);
        Object[] cOrigem = {
            city.getIdCidade(),
            city.getCidade()
        };
        request.setAttribute("cOrigem", cOrigem);
        
        city = Cidade.consultaCidade(CidadeDestino);
        Object[] cDestino = {
            city.getIdCidade(),
            city.getCidade()
        };
        request.setAttribute("cDestino", cDestino);
        
        // Obter lista de programações com a Data de Ida especificada.
        ArrayList<Object[]> tIda = Programacao.pesquisarVoo(
            CidadeOrigem,
            CidadeDestino,
            Cabine,
            request.getParameter("data_ida")
        );
        request.setAttribute("tIda", tIda);
        
        // Verificar se consulta envolve a volta.
        // Se sim, pesquisar programações com a Data de Volta especificada.
        if ( TipoViagem == 1 )
        {
            ArrayList<Object[]> tVolta = Programacao.pesquisarVoo(
                CidadeDestino,
                CidadeOrigem,
                Cabine,
                request.getParameter("data_volta")
            );  
            
            request.setAttribute("tVolta", tVolta);
        }
        
        // Especificar detalhes adicionais de filtro da consulta.
        request.setAttribute("TipoViagem", TipoViagem);
        request.setAttribute("Cabine", Cabine);
        
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
