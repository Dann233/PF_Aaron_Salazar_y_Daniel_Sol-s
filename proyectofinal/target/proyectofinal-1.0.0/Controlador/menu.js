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


document.addEventListener('DOMContentLoaded', function () {
    const buscarBtn = document.getElementById('btn-buscar');
    const editarBtn = document.getElementById('btn-actualizar');
    const eliminarBtn = document.getElementById('btn-eliminar');
    const agregarBtn = document.getElementById('btn-agregar');

   
    buscarBtn.addEventListener('click', function () {
        const cedulaBuscada = document.getElementById('cedula_buscada').value.trim();
        if (cedulaBuscada === '') {
            alert('Por favor, ingrese una cédula para buscar.');
            return;
        }
        fetch(`../Modelo/buscar_cliente.jsp?cedula_buscada=${cedulaBuscada}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Ocurrió un problema al realizar la búsqueda.');
                }
                return response.json(); N
            })
            .then(data => {
                if (data) {
                   
                    const form_cliente = document.getElementById('form_cliente');
                    form_cliente.querySelector('#cedula').value = data.cedula;
                    form_cliente.querySelector('#nombre1').value = data.nombre1;
                    form_cliente.querySelector('#nombre2').value = data.nombre2;
                    form_cliente.querySelector('#apellido1').value = data.apellido1;
                    form_cliente.querySelector('#apellido2').value = data.apellido2;
                } else {
                    alert('Cliente no encontrado');
                }
            })
            .catch(error => {
                console.error('Error en la búsqueda:', error);
                document.getElementById('mensaje').innerHTML = '<p>Ocurrió un error en la búsqueda.</p>';
            });
    });

    // Evento de actualización
    editarBtn.addEventListener('click', function (event) {
        console.log('Editar botón clickeado');
        const form_cliente = document.getElementById('form_cliente');
        if (!validarCampos(form_cliente)) {
            console.log('Campos no válidos');
            alert('Por favor, llene todos los campos antes de editar.');
            event.preventDefault();
        } else {
            console.log('Campos válidos, enviando formulario');
            form_cliente.action = '../Modelo/actualizar_cliente.jsp';
            form_cliente.submit();
        }
    });

    // Evento de eliminación
    eliminarBtn.addEventListener('click', function (event) {
            const cedulaBuscada = document.getElementById('cedula_buscada').value.trim();
            if (cedulaBuscada === '') {
                alert('Por favor, ingrese una cédula para eliminar.');
                event.preventDefault();
                return;
            }
            const form_cliente = document.getElementById('form_cliente');
            form_cliente.action = '../Modelo/eliminar_cliente.jsp';
            form_cliente.submit();
        });
    

    // Evento de agregar
    agregarBtn.addEventListener('click', function (event) {
        console.log('Agregar botón clickeado');
        const form_cliente = document.getElementById('form_cliente');
        if (!validarCampos(form_cliente)) {
            console.log('Campos no válidos');
            alert('Por favor, llene todos los campos antes de agregar.');
            event.preventDefault();
        } else {
            console.log('Campos válidos, enviando formulario');
            form_cliente.action = '../Modelo/insertar_cliente.jsp';
            form_cliente.submit();
        }
    });

    function validarCampos(formulario) {
        const cedula = formulario.querySelector('#cedula').value.trim();
        const nombre1 = formulario.querySelector('#nombre1').value.trim();
        const apellido1 = formulario.querySelector('#apellido1').value.trim();
        return cedula !== '' && nombre1 !== '' && apellido1 !== '';
    }
});
