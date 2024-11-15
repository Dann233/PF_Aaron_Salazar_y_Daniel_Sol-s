<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    
    String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
    String nombreUsuario = "root";
    String nombreClave = "Proverbios18.22";
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    
    String SQL = "CALL seleccionar_citas();";
%>

<table>
    <thead>
        <tr>
            <th>Número Cita</th>
            <th>Cédula</th>
            <th>Fecha</th>
            <th>Hora</th>
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
                    String id = rs.getString("idcita");
                    String cedula = rs.getString("cedula_cliente");
                    String fecha = rs.getString("fecha");
                    String hora = rs.getString("hora");
        %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= cedula %></td>
                        <td><%= fecha %></td>
                        <td><%= hora %></td>
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
