<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<% 

String entrada_cedula = request.getParameter("cedula_buscada");
String entrada_nombre1 = request.getParameter("nombre1");
String entrada_nombre2 = request.getParameter("nombre2");
String entrada_apellido1 = request.getParameter("apellido1");
String entrada_apellido2 = request.getParameter("apellido2");

String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22";  

Connection conn = null;
CallableStatement  pstmt = null;
String mensaje = "";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);

    String SQL = "CALL actualizar_cliente(?, ?, ?, ?, ?);";
    pstmt = conn.prepareCall(SQL);
    pstmt.setString(1, entrada_cedula);
    pstmt.setString(2, entrada_nombre1);
    pstmt.setString(3, entrada_nombre2);
    pstmt.setString(4, entrada_apellido1);
    pstmt.setString(5, entrada_apellido2);
   

    int filaActualizada = pstmt.executeUpdate();

    if (filaActualizada > 0) {
        mensaje = "El cliente se ha actualizado correctamente";
        request.setAttribute("mensaje", mensaje);
        response.sendRedirect("../Vista/mis_clientes.jsp");
    } else {
        mensaje = "Hubo un error al eliminar el cliente";
    }
} catch (SQLException e) {
    request.setAttribute("mensaje", "Error en la Base de Datos");
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    request.setAttribute("mensaje", "No se encontro el conector a la Base de Datos");
    e.printStackTrace();
} finally {
    if (pstmt != null) {
        try { 
            pstmt.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (conn != null) {
        try { 
            conn.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
