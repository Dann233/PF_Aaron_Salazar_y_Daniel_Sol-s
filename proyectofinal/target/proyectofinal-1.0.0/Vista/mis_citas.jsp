<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mis Citas</title>
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
                    <h1>Mis Citas GC </h1>
                    <p>Donde el Estilo se Encuentra con la Tradición</p>
                </div>
            </div>
        </header>

        <section class="search-form container">
            <form id="form-cita" method="POST">
                <label for="id_cita"></label>
                <div class="input-group">
                    <input type="text" id="id_cita" placeholder="Digite el número de cita a buscar">
                    <button class="btn-buscar">
                        <img src='/Vista/imagen/buscar(1).png' alt="Buscar"
                            style="height: 24px; vertical-align: middle;">
                    </button>
                </div>


                <label for="cedula" class="form-label"></label>
                <div class="input-group">
                    <jsp:include page="../Modelo/cargar_cedulas.jsp" />
                    <button class="btn-buscar">
                        <img src='imagen/buscar(1).png' alt="Buscar" style="height: 24px; vertical-align: middle;">
                    </button>
                </div>


                <label for="fecha-cita" class="form-label">Fecha de Cita</label>
                <input type="date" id="fecha-cita" name="fecha-cita" placeholder="Fecha de la Cita"
                    aria-label="Fecha de la Cita">


                <label for="hora-cita" class="form-label">Hora de Cita</label>
                <input type="time" id="hora-cita" name="hora-cita" placeholder="Hora de la Cita"
                    aria-label="Hora de la Cita">

                <div class="action-buttons">
                    <button class="btn-actualizar">Editar</button>
                    <button class="btn-eliminar">Eliminar</button>
                    <button class="btn-agregar">Agregar</button>
                </div>
            </form>
        </section>

        <section class="table-section container">
            <jsp:include page="../Modelo/seleccionar_cita.jsp" />
        </section>

        <script src="../Controlador/menu.js"></script>

    </body>

    </html>