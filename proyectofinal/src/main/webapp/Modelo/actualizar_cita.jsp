<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.net.URLEncoder" %>
<% 
String entrada_cita = request.getParameter("id_cita");
String entrada_cedula = request.getParameter("cedula");
String entrada_fecha = request.getParameter("fecha-cita");
String entrada_hora = request.getParameter("hora-cita");

int idcita = 0;
idcita = Integer.parseInt(entrada_cita);

String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22";  

Connection conn = null;
CallableStatement pstmt = null;
String mensaje = "";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);

    String SQL = "CALL actualizar_cita(?, ?, ?, ?);";
    pstmt = conn.prepareCall(SQL);
    pstmt.setString(1, entrada_cita);
    pstmt.setString(2, entrada_cedula);
    pstmt.setString(3, entrada_fecha);
    pstmt.setString(4, entrada_hora);
   
    int filaActualizada = pstmt.executeUpdate();

    if (filaActualizada > 0) {
        mensaje = "La cita se ha actualizado correctamente";
        request.setAttribute("mensaje", mensaje);
        response.sendRedirect("../Vista/mis_citas.jsp");
    } else {
        mensaje = "Hubo un error al actualizar el cliente";
    }
} catch (SQLException e) {
    mensaje = "Error en la Base de Datos";
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    mensaje = "No se encontró el conector a la Base de Datos";
    e.printStackTrace();
} finally {
    if (pstmt != null) {
        try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
    if (conn != null) {
        try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
}

%>
