<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<!--Archivo principal, al ser index, es el primero que lee el servidor Tomcat
Contiene la autenticación de usuarios al preguntar si se encuentran las credenciales en la Base de datos
de MySQL-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Vista/login.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <div class="formulario">
        <h1>Inicio Sesión</h1>
        <% 
            if (request.getMethod().equals("POST")) {
                String entrada_usuario = request.getParameter("usuario");
                String entrada_clave = request.getParameter("contrasena");

                boolean camposVacios = entrada_usuario == null || entrada_clave == null;

                if (camposVacios) {
        %>
        <div class="alert alert-warning" role="alert">
            Por favor, complete todos los campos.
        </div>
        <% 
                } else {
                    String URL = "jdbc:mysql://localhost:3306/barberia_solissalazar?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
                    String nombreUsuarioDB = "root";
                    String claveUsuarioDB = "Proverbios18.22";  

                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(URL, nombreUsuarioDB, claveUsuarioDB);

                        String SQL = "{CALL autenticacion(?, ?)}";
                        stmt = conn.prepareCall(SQL);
                        stmt.setString(1, entrada_usuario);
                        stmt.setString(2, entrada_clave);
                        rs = stmt.executeQuery();

                        if (rs.next()) {
                            String nombreUsuario = rs.getString("usuario");
                            session.setAttribute("mensajeBienvenida", "¡Bienvenido, " + nombreUsuario + "!");
                            response.sendRedirect("menu.jsp");
                        } else {
        %>
        <div class="alert alert-danger" role="alert">
            Usuario o contraseña incorrectos.
        </div>
        <% 
                        }
                    } catch (SQLException e) {
                        out.println("<div class='alert alert-danger'>Error de SQL: " + e.getMessage() + "</div>");
                        e.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        out.println("<div class='alert alert-danger'>Error: Controlador JDBC no encontrado.</div>");
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                }
            }
        %>
        <form action="<%= request.getContextPath() %>/index.jsp" method="post">
            <div class="perfil">
                <i class="fas fa-user-circle"></i>
            </div>
            <div class="usuario">
                <input type="text" id="textField" name="usuario" required placeholder=" ">
                <label for="textField" id="userlabel">Usuario</label>
                <i class="fa-solid fa-user"></i>
            </div>
            <div class="contrasena">
                <input type="password" id="passwordField" name="contrasena" required placeholder=" ">
                <label for="passwordField" id="passwordlabel">Clave</label>
                <i class="fa-solid fa-lock icon"></i>
                <i class="fa-solid fa-eye icon" id="togglePassword" style="cursor: pointer; display: none;"></i>
            </div>
            <input type="submit" value="Ingresar">
        </form>
    </div>
    <script src="<%= request.getContextPath() %>/Controlador/login.js"></script>
</body>

</html>
