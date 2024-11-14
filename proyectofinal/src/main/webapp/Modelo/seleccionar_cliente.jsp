<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    
    String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
    String nombreUsuario = "root";
    String nombreClave = "Proverbios18.22";
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    
    String SQL = "CALL seleccionar_clientes();";
%>

<table>
    <thead>
        <tr>
            <th>Cédula</th>
            <th>Primer Nombre</th>
            <th>Segundo Nombre</th>
            <th>Primer Apellido</th>
            <th>Segundo Apellido</th>
        </tr>
    </thead>
    <tbody>
        <%
            try {
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);
                stmt = conn.prepareStatement(SQL);
                rs = stmt.executeQuery();

                
                while (rs.next()) {
                    String cedula = rs.getString("cedula");
                    String nombre1 = rs.getString("nombre1");
                    String nombre2 = rs.getString("nombre2");
                    String apellido1 = rs.getString("apellido1");
                    String apellido2 = rs.getString("apellido2");
        %>
                    <tr>
                        <td><%= cedula %></td>
                        <td><%= nombre1 %></td>
                        <td><%= nombre2 %></td>
                        <td><%= apellido1 %></td>
                        <td><%= apellido2 %></td>
                    </tr>
        <%
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                   
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </tbody>
</table>
