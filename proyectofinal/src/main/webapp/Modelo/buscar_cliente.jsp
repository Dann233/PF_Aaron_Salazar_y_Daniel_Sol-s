<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    String entrada_cedula = request.getParameter("cedula_buscada");

    String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
    String nombreUsuario = "root";
    String nombreClave = "Proverbios18.22";
    Connection conn = null;
    CallableStatement stmt = null;
    ResultSet rs = null;

    String SQL = "CALL buscar_cliente(?);";
%>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);
        stmt = conn.prepareCall(SQL);
        stmt.setString(1, entrada_cedula);
        rs = stmt.executeQuery();

       
        if (rs.next()) {
            String cedula = rs.getString("cedula");
            String nombre1 = rs.getString("nombre1");
            String nombre2 = rs.getString("nombre2");
            String apellido1 = rs.getString("apellido1");
            String apellido2 = rs.getString("apellido2");

            
            out.print("{");
            out.print("\"cedula\": \"" + cedula + "\",");
            out.print("\"nombre1\": \"" + nombre1 + "\",");
            out.print("\"nombre2\": \"" + nombre2 + "\",");
            out.print("\"apellido1\": \"" + apellido1 + "\",");
            out.print("\"apellido2\": \"" + apellido2 + "\"");
            out.print("}");
        } else {
            // Si no se encuentra el cliente, devolver un objeto vacío
            out.print("{}");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.print("{}");
    } finally {
        // Cerrar las conexiones
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
