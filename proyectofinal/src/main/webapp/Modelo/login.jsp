<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    if (request.getMethod().equals("POST")) {
        String entrada_usuario = request.getParameter("usuario");
        String entrada_clave = request.getParameter("clave");

        boolean camposVacios = entrada_usuario == null || entrada_usuario.trim().isEmpty() || entrada_clave == null || entrada_clave.trim().isEmpty();

        if (camposVacios) {
            // Si los campos están vacíos, asignar mensaje y redirigir a index.jsp
            
            response.sendRedirect("../index.jsp");
            request.setAttribute("mensaje", "Verifique que los campos no estén vacíos.");
        } else {
            String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
            String nombreUsuarioDB = "root";
            String claveUsuarioDB = "Proverbios18.22";  

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(URL, nombreUsuarioDB, claveUsuarioDB);

                String SQL = "{CALL autenticacion(?, ?)}";
                stmt = conn.prepareCall(SQL);
                stmt.setString(1, entrada_usuario);
                stmt.setString(2, entrada_clave);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    // Si la autenticación es exitosa
                   
                    response.sendRedirect("../Vista/pagina.jsp");
                    String nombreUsuario = rs.getString("usuario");
                    session.setAttribute("mensajeBienvenida", "¡Bienvenido, " + nombreUsuario + "!");
                } else {
                    // Si las credenciales son incorrectas, asignar mensaje y redirigir
                    
                    response.sendRedirect("../index.jsp");
                    request.setAttribute("mensaje", "Usuario o contraseña incorrectos.");
                }
            } catch (SQLException e) {
               
                response.sendRedirect("../index.jsp");
                request.setAttribute("mensaje", "Error de SQL: " + e.getMessage());
            } catch (ClassNotFoundException e) {
                
                response.sendRedirect("../index.jsp");
                request.setAttribute("mensaje", "Error: Controlador JDBC no encontrado.");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
%>
