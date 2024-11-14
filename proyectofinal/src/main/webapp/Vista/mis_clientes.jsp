
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

        <section class="search-form container">
            <form id="form_cliente" method="POST" action="../Modelo/insertar_cliente.jsp">
            <input type="text" placeholder="Digite la Cédula a buscar">
            <button class="btn-buscar" type="submit">
                <img src='imagen/buscar(1).png' alt="Buscar"
                    style="height: 24px; vertical-align: middle;">
            </button>
            <input type="text" placeholder="Cédula" id="cedula" name="cedula" required>
            <input type="text" placeholder="Primer Nombre" id="nombre1" name="nombre1" required>
            <input type="text" placeholder="Segundo Nombre" id="nombre2" name="nombre2">
            <input type="text" placeholder="Primer Apellido " id="apellido1" name="apellido1" required>
            <input type="text" placeholder="Segundo Apellido" id="apellido2" name="apellido2">

            <div class="action-buttons">
                <button type="button" onclick="closeModal()">Cancelar</button>
                <button type="submit"><i class="fas fa-plus"></i>Agregar</button>
                <button type="button" onclick="btns_clientes('proyectofinal/src/main/webapp/Modelo/actualizar_cliente.jsp')">Actualizar</button>
                <button type="button" onclick="btns_clientes('Modelo/eliminar_cliente.jsp')">Eliminar</button>
            </div>
        </form>
        </section>

        <section class="table-section container">
            <jsp:include page="../Modelo/seleccionar_cliente.jsp" />
        </section>

        <script src="/proyectofinal/src/main/webapp/Controlador/menu.js"></script>

    </body>

    </html>