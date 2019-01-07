/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bhogal;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author Vishal
 */
public class EditProfileDetail extends HttpServlet {

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
            out.println("<title>Servlet EditProfileDetail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProfileDetail at " + request.getContextPath() + "</h1>");
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
        String user=request.getParameter("username");
        String sess=request.getParameter("session");
        String firstname=request.getParameter("firstname");
        String lastname=request.getParameter("lastname");
        String address=request.getParameter("address");
        String country=request.getParameter("country");
        String stateslist=request.getParameter("stateslist");
        String city=request.getParameter("city");
        String pincode=request.getParameter("pincode");
        String mobile=request.getParameter("mobile");
        if(user!=null)
        {
             String baseurl="";
                    try
              {
     Properties prop = new Properties();
     //name=prop.load(getClass().getResourceAsStream()); 
     String path=this.getClass().getClassLoader().getResource("").getPath();
     InputStream stream = new FileInputStream(path+"/property/URL.properties");
     prop.load(stream);
    baseurl=prop.getProperty("baseurl");
    System.out.println(baseurl);
    
    //start
     StringBuffer sb = new StringBuffer();
      
          String url_path=baseurl+"/rest/user/updateprofile";
        System.out.println(url_path);
String urlParameters  = "username="+user+"&session_id="+sess+"&firstname="+firstname+"&lastname="+lastname+"&address="+address+"&city="+city+"&state="+stateslist+"&country="+country+"&pincode="+pincode+"&mobile_no="+mobile;
byte[] postData       = urlParameters.getBytes(StandardCharsets.UTF_8 );
int    postDataLength = postData.length;

URL    url            = new URL( url_path );
HttpURLConnection conn= (HttpURLConnection) url.openConnection();           
conn.setDoOutput( true );
conn.setInstanceFollowRedirects( false );
conn.setRequestMethod( "POST" );
conn.setRequestProperty( "Content-Type", "application/x-www-form-urlencoded"); 
conn.setRequestProperty( "charset", "utf-8");
conn.setRequestProperty( "Content-Length", Integer.toString( postDataLength ));
conn.setUseCaches( false );
try( DataOutputStream wr = new DataOutputStream( conn.getOutputStream())) {
   wr.write( postData );
}
        DataInputStream input = new DataInputStream( conn.getInputStream() ); 



for( int c = input.read(); c != -1; c = input.read() ) 
sb.append((char)c ); 
input.close(); 
               


 Object obj = new JSONParser().parse(sb.toString()); 
          
        // typecasting obj to JSONObject 
        JSONObject jo = (JSONObject) obj; 
          
        // getting firstName and lastName 
        String result = (String) jo.get("result"); 
       
        if(result.equals("true"))
        {
        String username = (String) jo.get("username"); 
        
        
       
 
HttpSession sessions = request.getSession(false);
sessions.setAttribute("session", sess);
sessions.setAttribute("username", username);
       response.sendRedirect("editprofile");
        }
        }catch(Exception e)
        {
            System.out.println(e);
        }
        
        
       // processRequest(request, response);
    }

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
