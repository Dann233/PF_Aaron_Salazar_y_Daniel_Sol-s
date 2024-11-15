<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <% String mensaje=(String) request.getAttribute("mensaje"); %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Mis Clientes</title>
            <link rel="stylesheet" href="menu.css">
        </head>

        <body>
            <header class="header">
                <div class="menu container">
                    <a href="pagina.jsp" class="logo"> THEGC
                        <img src="imagen/navaja.png" alt="">
                    </a>

                    <input type="checkbox" id="menu" />
                    <label for="menu"></label>

                    <nav class="navbar">
                        <ul>
                            <li><a href="pagina.jsp">Inicio
                                    <img src="imagen/casa.png" alt="">
                                </a></li>
                            <li><a href="mis_clientes.jsp">Mis Clientes
                                    <img src="imagen/clientes.png" alt="">
                                </a></li>
                            <li><a href="mis_citas.jsp">Mis Citas
                                    <img src="imagen/calendario.png" alt="">
                                </a></li>
                        </ul>
                    </nav>
                </div>
                <div class="header-content container">
                    <div class="header-txt">
                        <h1>Mis Clientes GC</h1>
                        <p>Donde el Estilo se Encuentra con la Tradición</p>
                    </div>
                </div>
            </header>

            <div id="mensajeInformativo" style="display: none;"></div>

            <section class="search-form container">
                <form id="form_cliente" method="POST">


                    <div class="input-group">
                        <input type="text" placeholder="Digite la Cédula a buscar" id="cedula_buscada"
                            name="cedula_buscada">
                        <button class="btn-buscar" type="button" id="btn-buscar" name="btn-buscar" title="Buscar Cliente">
                            <img src='imagen/buscar(1).png' alt="Buscar" style="height: 20  px;vertical-align: middle;">
                        </button>
                    </div>



                    <input type="text" placeholder="Cédula" id="cedula" name="cedula" required>
                    <input type="text" placeholder="Primer Nombre" id="nombre1" name="nombre1" required>
                    <input type="text" placeholder="Segundo Nombre" id="nombre2" name="nombre2">
                    <input type="text" placeholder="Primer Apellido " id="apellido1" name="apellido1" required>
                    <input type="text" placeholder="Segundo Apellido" id="apellido2" name="apellido2">

                    <div class="action-buttons">
                        <button name="btn-agregar" id="btn-agregar" class="btn-agregar" type="button" title="Agregar Cliente al sistema">Agregar</button>
                        <button name="btn-actualizar" id="btn-actualizar" class="btn-actualizar"type="button" title="Actualiza los datos del Cliente">Actualizar</button>
                        <button name="btn-eliminar" id="btn-eliminar" class="btn-eliminar" type="button" title="Eliminar al Cliente del sistema">Eliminar</button>
                    </div>
                </form>
            </section>

            <section class="table-section container">
                <table>
                    <tbody id="tabla-clientes">
                        <jsp:include page="../Modelo/seleccionar_cliente.jsp" />
                    </tbody>
                </table>
            </section>

            <script src="../Controlador/mis_clientes.js"></script>

            <script>
                if (mensaje != null && !mensaje.isEmpty()) {
                    mostrarMensaje('<%= mensaje %>', 'exito');
                } 
            </script>
        </body>

        </html>