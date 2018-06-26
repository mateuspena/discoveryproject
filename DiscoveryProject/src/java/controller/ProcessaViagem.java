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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Passagem;

/**
 *
 * @author mateus
 */
public class ProcessaViagem extends HttpServlet {

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
        String btn = request.getParameter("btn");
        
        if ( btn.equals("1") )              // Botão "Realizar Checkin"
        {
            Object[] row = Passagem.consultar( Integer.parseInt(request.getParameter("item")) );
            
            if ( row != null )
            {
                Passagem p = new Passagem(
                    Integer.parseInt( row[1].toString() ),      // Programação
                    Integer.parseInt( row[0].toString() )       // Cabine
                );
                
                ArrayList<Object[]> lst = p.getProgramacao().assentosDisponiveis( p.getCabine() );
                request.setAttribute("assentos", lst);
                request.setAttribute("passagem", row);
                request.setAttribute("item", request.getParameter("item") );
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("checkin.jsp");
                dispatcher.forward(request, response);
            }
            else 
                response.sendRedirect("minhasviagens.jsp");
        }
        else if ( btn.equals("2") )         // Botão "Cancelar"
        {
            Passagem p = new Passagem(
                Integer.parseInt( request.getParameter("item") )
            );
            
            p.cancelarPassagem();
            response.sendRedirect("minhasviagens.jsp");
        }
        else                                // Botão "Abrir Reclamação"
        {
            System.out.println("3");
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
