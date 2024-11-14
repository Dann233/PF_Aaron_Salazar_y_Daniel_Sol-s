<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%

String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
String usuario = "root";
String clave = "Proverbios18.22";

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(URL, usuario, clave);
    
    
    String SQL = "CALL cargar_cedulas();";
    stmt = conn.prepareStatement(SQL);
    rs = stmt.executeQuery();
%>

<select id="cedula" name="cedula" aria-label="Seleccione la Cédula">
    <option value="">Seleccione la Cédula</option>
    
    <% 
    // Recorre los resultados y genera las opciones de manera dinámica
    while (rs.next()) { 
        String cedula = rs.getString("cedula");
        String nombre = rs.getString("nombre1") + " " + rs.getString("apellido1");
    %>
        <option value="<%= cedula %>"><%= cedula %> - <%= nombre %></option>
    <% 
    } 
    %>
</select>

<%
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Cerrar recursos
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}
%>
