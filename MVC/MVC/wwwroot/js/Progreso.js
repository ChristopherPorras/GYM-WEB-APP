$(document).ready(function () {
    var userEmail = localStorage.getItem('userEmail');

    if (userEmail) {
        cargarProgreso(userEmail);
    } else {
        Swal.fire('Error', 'No se encontró el correo del usuario.', 'error');
    }

    // Función para cargar el progreso del usuario
    function cargarProgreso(email) {
        $.ajax({
            url: `/api/ProgresoUsuario/ObtenerProgreso/${email}`,
            method: 'GET',
            success: function (data) {
                console.log("Datos recibidos del API:", data);
                if (data && data.length > 0) {
                    actualizarTablaProgreso(data);

                    // Gráfico
                    var fechas = data.map(x => {
                        var fecha = new Date(x.fechaProgreso);
                        return fecha instanceof Date && !isNaN(fecha) ? fecha.toLocaleDateString() : 'Fecha inválida';
                    });
                    var pesos = data.map(x => x.peso);

                    Highcharts.chart('contenedor', {
                        chart: {
                            type: 'line',
                            backgroundColor: '#212529'
                        },
                        title: {
                            text: 'Progreso de Peso del Usuario',
                            align: 'left',
                            style: { color: 'white' }
                        },
                        xAxis: {
                            categories: fechas,
                            title: { text: 'Fecha', style: { color: 'white' } },
                            labels: { style: { color: 'white' } }
                        },
                        yAxis: {
                            title: { text: 'Peso (kg)', style: { color: 'white' } },
                            labels: { style: { color: 'white' } }
                        },
                        tooltip: {
                            style: { color: 'black' },
                            backgroundColor: 'black',
                        },
                        series: [{
                            name: 'Peso',
                            data: pesos,
                            color: 'white'
                        }]
                    });
                } else {
                    console.log("No hay datos, mostrando gráfico de ejemplo.");
                    Highcharts.chart('contenedor', {
                        chart: { type: 'line' },
                        title: { text: 'Progreso de Peso del Usuario', align: 'left' },
                        xAxis: {
                            categories: ['Semana 1', 'Semana 2', 'Semana 3', 'Semana 4'],
                            title: { text: 'Tiempo' }
                        },
                        yAxis: {
                            title: { text: 'Peso (kg)' },
                            min: 0
                        },
                        series: [{
                            name: 'Peso',
                            data: [60, 62, 65, 68]
                        }],
                        lang: {
                            noData: "Estamos emocionados por ver tu progreso, " + email + "!"
                        },
                        noData: {
                            style: { fontWeight: 'bold', fontSize: '16px', color: 'white', backgroundColor: '#212529' }
                        }
                    });
                }
            },
            error: function () {
                Swal.fire('Error', 'No se pudo cargar el progreso del usuario.', 'error');
            }
        });
    }

    // Función para actualizar la tabla de progreso
    function actualizarTablaProgreso(progresos) {
        var tbody = $('#tablaProgreso tbody');
        tbody.empty();

        progresos.forEach(function (progreso) {
            var fila = `
                <tr>
                    <td>${new Date(progreso.fechaProgreso).toLocaleDateString()}</td>
                    <td>${progreso.peso}</td>
                    <td>${progreso.masaMuscular}</td>
                    <td>${progreso.porcentajeGrasa}</td>
                    <td>
                        <button class="btn btn-warning btn-sm btnEditar" data-id="${progreso.id}" data-progreso='${JSON.stringify(progreso)}'>Editar</button>
                        <button class="btn btn-danger btn-sm btnEliminar" data-id="${progreso.id}">Eliminar</button>
                    </td>
                </tr>`;
            tbody.append(fila);
        });
    }

    // Manejar el evento de eliminar progreso desde la tabla
    $(document).on('click', '.btnEliminar', function () {
        var id = $(this).data('id');
        Swal.fire({
            title: '¿Estás seguro?',
            text: "¡No podrás revertir esto!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Sí, eliminarlo!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: `/api/ProgresoUsuario/EliminarProgreso/${id}`,
                    method: 'DELETE',
                    success: function () {
                        Swal.fire('Eliminado!', 'El progreso ha sido eliminado.', 'success');
                        cargarProgreso(userEmail);
                    },
                    error: function () {
                        Swal.fire('Error', 'No se pudo eliminar el progreso.', 'error');
                    }
                });
            }
        });
    });

    // Llenar el formulario con los datos del progreso seleccionado
    $(document).on('click', '.btnEditar', function () {
        var progreso = $(this).data('progreso');
        $('#progresoId').val(progreso.id);
        $('#fechaProgreso').val(progreso.fechaProgreso.split('T')[0]);
        $('#peso').val(progreso.peso);
        $('#masaMuscular').val(progreso.masaMuscular);
        $('#porcentajeGrasa').val(progreso.porcentajeGrasa);
    });

    // Manejar el formulario de crear/actualizar progreso
    $('#form-progreso').on('submit', function (e) {
        e.preventDefault();

        var id = $('#progresoId').val();
        var progreso = {
            CorreoElectronico: userEmail,
            FechaProgreso: $('#fechaProgreso').val(),
            Peso: parseFloat($('#peso').val()),
            MasaMuscular: parseFloat($('#masaMuscular').val()),
            PorcentajeGrasa: parseFloat($('#porcentajeGrasa').val())
        };

        if (id) {
            // Actualizar progreso
            progreso.ID = parseInt(id);
            $.ajax({
                url: '/api/ProgresoUsuario/ActualizarProgreso',
                method: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(progreso),
                success: function () {
                    Swal.fire('Éxito', 'Progreso actualizado correctamente', 'success');
                    cargarProgreso(userEmail);
                    $('#form-progreso')[0].reset();
                },
                error: function () {
                    Swal.fire('Error', 'No se pudo actualizar el progreso.', 'error');
                }
            });
        } else {
            // Crear progreso
            $.ajax({
                url: '/api/ProgresoUsuario/CrearProgreso',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(progreso),
                success: function () {
                    Swal.fire('Éxito', 'Progreso creado correctamente', 'success');
                    cargarProgreso(userEmail);
                    $('#form-progreso')[0].reset();
                },
                error: function () {
                    Swal.fire('Error', 'No se pudo crear el progreso.', 'error');
                }
            });
        }
    });
});
