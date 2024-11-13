<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mis Clientes</title>
        <link rel="stylesheet" href="Vista/menu.css">
    </head>

    <body>
        <header class="header">
            <div class="menu container">
                <a href="menu.jsp" class="logo"> THEGC
                    <img src="<%= request.getContextPath() %>/Vista/imagen/navaja.png" alt="">
                </a>

                <input type="checkbox" id="menu" />
                <label for="menu"></label>

                <nav class="navbar">
                    <ul>
                        <li><a href="menu.jsp">Inicio
                                <img src="<%= request.getContextPath() %>/Vista/imagen/casa.png" alt="">
                            </a></li>
                        <li><a href="mis_clientes.jsp">Mis Clientes
                                <img src="<%= request.getContextPath() %>/Vista/imagen/clientes.png" alt="">
                            </a></li>
                        <li><a href="mis_citas.jsp">Mis Citas
                                <img src="<%= request.getContextPath() %>/Vista/imagen/calendario.png" alt="">
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

        <section class="search-form container">
            <input type="text" placeholder="Digite la Cédula a buscar">
            <button class="btn-buscar">
                <img src='<%= request.getContextPath() %>/Vista/imagen/buscar(1).png' alt="Buscar" style="height: 24px; vertical-align: middle;">
            </button>



            <input type="text" placeholder="Cédula">
            <input type="text" placeholder="Primer Nombre">
            <input type="text" placeholder="Segundo Nombre">
            <input type="text" placeholder="Primer Apellido ">
            <input type="text" placeholder="Segundo Apellido">





            <div class="action-buttons">
                <button class="btn-editar">Editar</button>
                <button class="btn-eliminar">Eliminar</button>
                <button class="btn-agregar">Agregar</button>
            </div>
        </section>

        <section class="table-section container">
            <table>
                <thead>
                    <tr>
                        <th>Cédula</th>
                        <th>Primer Nombre</th>
                        <th>Segundo Nombre</th>
                        <th>Primer Apellido</th>
                        <th>Segundo Apellido </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>

                    </tr>
                    <tr>

                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>

                    </tr>
                </tbody>
            </table>
        </section>

        <script src="/proyectofinal/src/main/webapp/Controlador/menu.js"></script>

    </body>

    </html>