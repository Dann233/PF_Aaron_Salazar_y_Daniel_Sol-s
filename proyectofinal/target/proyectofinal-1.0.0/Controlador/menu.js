// Abrir modal "Registrar Cita"
document.querySelector('.navbar ul li:nth-child(1) a').addEventListener('click', function (e) {
    e.preventDefault();
    //document.getElementById('modal').style.display = 'flex';
});

// Redirigir a ProcesosClientes.html al hacer clic en "Buscar Cita"
document.querySelector('.navbar ul li:nth-child(2) a').addEventListener('click', function (e) {
    e.preventDefault();
    window.location.href = 'ProcesosCliente.html';
});

// Abrir modal "Mis Citas"
document.querySelector('.navbar ul li:nth-child(3) a').addEventListener('click', function (e) {
    e.preventDefault();
    //document.getElementById('modalMisCitas').style.display = 'flex';
});

// Funciones para cerrar los modales específicos
function closeMisCitasModal() {
    document.getElementById('modalMisCitas').style.display = 'none';
}

function closeBuscarModal() {
    document.getElementById('modalBuscarCita').style.display = 'none';
}

function buscarCita() {
    const idCita = document.getElementById('idCita').value;

    if (idCita >= 1) {
        document.getElementById('detalleCitaBody').innerHTML = `
            <tr>
                <td>${idCita}</td>
                <td><!-- Aquí irá la cédula real --></td>
                <td><!-- Aquí irá la fecha real --></td>
            </tr>
        `;
        document.getElementById('modalBuscarCita').style.display = 'none';
        document.getElementById('modalDetalleCita').style.display = 'flex';
    } else {
        alert("El ID de la cita debe ser un número mayor o igual a 1.");
    }
}

function closeDetalleModal() {
    document.getElementById('modalDetalleCita').style.display = 'none';
}

/*
// Evento para cerrar el modal "Registrar Cita" y abrir el modal de fecha
document.querySelector('#modal .modal-buttons button[type="submit"]').addEventListener('click', function(e) {
    e.preventDefault();
    document.getElementById('modal').style.display = 'none';
    document.getElementById('modalDate').style.display = 'flex';
});
*/

function closeModalDate() {
    document.getElementById('modalDate').style.display = 'none';
}

function closeModal() {
    document.getElementById('modal').style.display = 'none';
}

function submitForm(actionType) {
    const form = document.getElementById('form_cliente');

    
    switch (actionType) {
        case 'insertar':
            form.action = '../Modelo/insertar_cliente.jsp';
            break;
        case 'actualizar':
            form.action = '../Modelo/actualizar_cliente.jsp';
            break;
        case 'eliminar':
            form.action = '../Modelo/eliminar_cliente.jsp';
            break;
    }

    
    form.submit();
}

function buscarCliente() {
    var cedula = document.getElementById("cedula_buscada").value;
    if (!cedula) {
        alert("Por favor, ingrese una cédula para buscar.");
        return;
    }

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "../Modelo/buscar_cliente.jsp?cedula_buscada=" + encodeURIComponent(cedula), true);
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
           
            document.getElementById("tabla-clientes").innerHTML = xhr.responseText;
        }
    };

    xhr.send(); 
}


document.querySelector(".btn-buscar").addEventListener("click", buscarCliente);
