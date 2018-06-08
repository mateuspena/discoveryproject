/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Cliente;

/**
 *
 * @author Gilmar
 */
@WebServlet(name = "AlterarCadastro", urlPatterns = {"/AlterarCadastro"})
public class AlterarCadastro extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String editar = request.getParameter("modificar");
            if (editar.equals("Editar")){
            
                String cpf = request.getParameter("cpfAlterar");

                Cliente cliente = new Cliente(cpf);
                if (cliente.buscarCliente()){
                    RequestDispatcher dispatcher = request.getRequestDispatcher("AlterarCliente.jsp");
                    request.getSession().setAttribute("cliente", cliente);
                    dispatcher.forward(request, response);
                }
                else {
                    response.sendRedirect("login.jsp");
                 }
                
            }
            if (editar.equals("Alterar")){
                
               String nome=request.getParameter("nome");
               String cpf=request.getParameter("cpf");
               String telefone=request.getParameter("telefone");
               String email=request.getParameter("email");
               String senha = request.getParameter("senha");
               String data = request.getParameter("data");
              
            if(senha.isEmpty()){
                senha = "";
            }
               Cliente a = new Cliente(cpf,nome,telefone,email,senha, data);
               a.preencherData();
               if(a.atualizarCliente()){
                    RequestDispatcher dispatcher = request.getRequestDispatcher("meuperfil.jsp");
                    request.getSession().setAttribute("cliente", a);
                    dispatcher.forward(request, response);
               }
                else {
                   RequestDispatcher dispatcher = request.getRequestDispatcher("AterarCadastro.jsp");
                   request.getSession().setAttribute("cliente", a);
                   dispatcher.forward(request, response);
               }
            }         
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
