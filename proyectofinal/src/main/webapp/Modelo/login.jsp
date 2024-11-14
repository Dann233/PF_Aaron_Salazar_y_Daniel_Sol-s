<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
        <% 
            if (request.getMethod().equals("POST")) {
                String entrada_usuario = request.getParameter("usuario");
                String entrada_clave = request.getParameter("clave");

                boolean camposVacios = entrada_usuario == null || entrada_clave == null;

                
                if (camposVacios) {
                    %>
                    <div class="alert alert-danger" role="alert">
                        Verifique que los campos no esten vacios.
                    </div>
                    <% 
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
                            String nombreUsuario = rs.getString("usuario");
                            session.setAttribute("mensajeBienvenida", "¡Bienvenido, " + nombreUsuario + "!");
                            response.sendRedirect("../Vista/pagina.jsp");
                        } else {
        %>
        <div class="alert alert-danger" role="alert">
            Usuario o contraseña incorrectos.
        </div>
        <% 
                        }
                    } catch (SQLException e) {
                        out.println("<div class='alert alert-danger'>Error de SQL: " + e.getMessage() + "</div>");
                        e.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        out.println("<div class='alert alert-danger'>Error: Controlador JDBC no encontrado.</div>");
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            }
        %>