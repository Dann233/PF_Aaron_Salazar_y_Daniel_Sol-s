<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.net.URLEncoder" %>
<% 
//Por medio de la cedula buscada, al presionar el boton de eliminar, se envia a este archivo y se ejecuta la sentencia SQL
String entrada_idcita = request.getParameter("idcita");


String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22";  

Connection conn = null;
CallableStatement  pstmt = null;
String mensaje = ""; 

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);

    String SQL = "CALL eliminar_cita(?)";
    pstmt = conn.prepareCall(SQL);
    pstmt.setString(1, entrada_idcita);

    int filaActualizada = pstmt.executeUpdate();

    if (filaActualizada > 0) {
        mensaje = "La cita se ha eliminado correctamente";
        response.sendRedirect("../Vista/mis_citas.jsp");
    } else {
        mensaje = "Hubo un error al eliminar la cita";
    }
} catch (SQLException e) {
    mensaje = "Hubo un error en la Base de Datos.";
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    mensaje = "No se encontro el conector a la Base de Datos";
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

response.sendRedirect("../Vista/mis_citas.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
%>
