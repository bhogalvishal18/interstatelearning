/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bhogal;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vishal
 */
public class HandlingTree extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HandlingTree</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandlingTree at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
       
        JsonObject data = new Gson().fromJson(request.getReader(), JsonObject.class);
String user = data.get("user").getAsString();
String tree = data.get("tree").getAsString();
 String l = getServletContext().getRealPath("");
 String temp="chat.js";
        String file_name=l+user+"\\"+temp; 
        System.out.println(file_name);
        
        String st=null;
        try
        {
           
        
      File f = new File(l+user);
if (f.exists() && f.isDirectory()) {
   System.out.println(" folder exist");
     File p = new File(file_name);
     
     Write w=new Write();
     st=w.Treedata(tree);
    // System.out.println(st);
   if (p.exists()) {
         System.out.println(" file exist");
       p.delete();
       
       file_name =file_name.replace("\\", "/");
     System.out.println(file_name);
       try (FileWriter file = new FileWriter(file_name)) {
           file.write(st);
           file.flush();
       }
  
}
   
}else{
    
    f.mkdir();
      System.out.println(" folder not exist");
    Write w=new Write();
    st=w.Treedata(tree);
    System.out.println(st);
    file_name =file_name.replace("\\", "/");
     System.out.println(file_name);
          try (FileWriter file = new FileWriter(file_name)) {
              file.write(st);
              file.flush();
          }
}
        
       }catch(Exception e)
       {
        System.out.println("The exception of property file :"+e.toString());   
       }
     
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(user+"/chat.js"); 
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
