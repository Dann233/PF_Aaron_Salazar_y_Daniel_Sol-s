<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.net.URLEncoder" %>
<% 

//Al darle click al boton de insertar, captura los datos de los formularios e inserta los datos en la tabla por medio de una sentencia SQL
    String entrada_cedula = request.getParameter("cedula");
    String entrada_fecha = request.getParameter("fecha-cita");
    String entrada_hora = request.getParameter("hora-cita");

String URL ="jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22";  

Connection conn = null;
CallableStatement stmt = null;
String mensaje = ""; 

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);

    String SQL = "CALL insertar_cita(?, ?, ?)";
     stmt = conn.prepareCall(SQL);
     stmt.setString(1, entrada_cedula);
     stmt.setString(2, entrada_fecha);
     stmt.setString(3, entrada_hora);
    int filaInsertada = stmt.executeUpdate();

    if (filaInsertada > 0) {
        mensaje = "La cita fue agendada correctamente!";
    } else {
        mensaje = "Hubo un error al agendar la cita.";
    }
} catch (SQLException e) {
    mensaje = "Error en la Base de Datos: " + e.getMessage();
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    mensaje = "No se encontró el conector a la Base de Datos.";
    e.printStackTrace();
} finally {
    if (stmt != null) {
        try { 
            stmt.close(); 
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
