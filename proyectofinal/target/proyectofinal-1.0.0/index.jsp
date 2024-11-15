<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="Vista/login.css">
            <title>Login GC</title>
        </head>

        <body>

            <div class="login-box">

                <div class="login-container">
                    <div class="login-header">
                        <header>The Gentleman’s Club</header>
                        <h2>Inicio Sesión</h2>
                    </div>

                    <form id="form_login" method="POST" action="Modelo/login.jsp">
                        <div class="input-box">
                            <input type="text" class="input-field" id="usuario" name="usuario" placeholder="Usuario"
                                autocomplete="off" required>
                        </div>
                        <div class="input-box">
                            <input type="password" class="input-field" id="clave" name="clave" placeholder="Contraseña"
                                autocomplete="off" required>
                        </div>
                        <div class="input-submit">
                            <button name="submit-btn" id="submit-btn" class="submit-btn" type="submit" title="Ingresar al Sistema">Ingresar</button>
                        </div>
                    </form>

                    

                </div>
            </div>

            <script src="Controlador/login.js"></script>

           
        </body>

        </html>