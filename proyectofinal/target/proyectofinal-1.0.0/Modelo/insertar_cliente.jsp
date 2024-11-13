<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<% 

//Al darle click al boton de insertar, captura los datos de los formularios e inserta los datos en la tabla por medio de una sentencia SQL
    String entrada_cedula = request.getParameter("cedula");
    String entrada_nombre1 = request.getParameter("nombre1");
    String entrada_nombre2 = request.getParameter("nombre2");
    String entrada_apellido1 = request.getParameter("apellido1");
    String entrada_apellido2 = request.getParameter("apellido2");

String URL ="jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22";  

Connection conn = null;
PreparedStatement stmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);

    String SQL = "CALL insertar_clientes(?, ?, ?, ?, ?)";
     stmt = conn.prepareCall(SQL);
     stmt.setString(1, entrada_cedula);
     stmt.setString(2, entrada_nombre1);
     stmt.setString(3, entrada_nombre2);
     stmt.setString(4, entrada_apellido1);  
     stmt.setString(5, entrada_apellido2);
     
    int filaInsertada = stmt.executeUpdate();

    if (filaInsertada > 0) {
        request.setAttribute("mensaje", "El paciente se ha eliminado correctamente!");
        response.sendRedirect(request.getContextPath() + "/menu.jsp");

   
    } else {
       
    }
} catch (SQLException e) {
    request.setAttribute("mensaje", "Error en la Base de Datos");
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    request.setAttribute("mensaje", "No se encontro el conector a la Base de Datos");
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
    

%>
