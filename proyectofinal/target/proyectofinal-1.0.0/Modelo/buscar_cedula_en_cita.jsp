<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String entrada_cedula = request.getParameter("cedula");

    String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
    String nombreUsuario = "root";
    String nombreClave = "Proverbios18.22";
    Connection conn = null;
    CallableStatement stmt = null;
    ResultSet rs = null;

    String SQL = "CALL buscar_cedula_en_cita(?);";
    response.setContentType("application/json; charset=UTF-8");
%>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);
        stmt = conn.prepareCall(SQL);
        stmt.setString(1, entrada_cedula);
        rs = stmt.executeQuery();

        if (rs.next()) {
            String idcita = rs.getInt("idcita");
            String cedula = rs.getString("cedula_cliente");
            String fecha = rs.getString("fecha");
            String hora = rs.getString("hora");

            // Imprimir el JSON directamente
            out.print("{");
            out.print("\"idcita\": \"" + idcita + "\",");
            out.print("\"cedula\": \"" + cedula + "\",");
            out.print("\"fecha\": \"" + fecha + "\",");
            out.print("\"hora\": \"" + hora + "\"");
            out.print("}");
        } else {
            // Si no se encuentra la cita, devolver un objeto JSON vacío
            out.print("{}");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.print("{}"); // Error en la respuesta como JSON vacío
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
