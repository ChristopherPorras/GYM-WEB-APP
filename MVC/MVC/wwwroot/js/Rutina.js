document.addEventListener('DOMContentLoaded', function () {
    const API_BASE = "https://localhost:7280/api/";
    const API_RUTINA_CREATE = API_BASE + "Rutina/CreateRutina";
    const API_EJERCICIOS_GETALL = API_BASE + "Ejercicio/sp_ObtenerTodosLosEjercicios";
    const API_USUARIOS_SEARCH = API_BASE + "User/SearchByName";
    const API_SEND_PDF = API_BASE + "Rutina/SendRutinaPdf";
    const entrenadorCorreo = localStorage.getItem('userEmail');
    let ejerciciosPorDia = {};

    // Variable para almacenar los datos de la rutina para el PDF y el correo
    let rutinaParaPdf = null;

    // Colocar el correo del entrenador en el input
    document.getElementById('entrenadorCorreo').value = entrenadorCorreo;

    // Cargar la lista de ejercicios desde la base de datos
    fetch(API_EJERCICIOS_GETALL)
        .then(response => response.json())
        .then(data => {
            const exerciseSelect = document.getElementById('exerciseSelect');
            if (exerciseSelect) {
                data.forEach(ejercicio => {
                    const option = document.createElement('option');
                    option.value = ejercicio.ejercicioId;
                    option.textContent = ejercicio.nombre;
                    exerciseSelect.appendChild(option);
                });
            }
        })
        .catch(error => console.error('Error al cargar los ejercicios:', error));

    // Buscar cliente por nombre
    document.getElementById('clientSearch').addEventListener('input', function () {
        const query = this.value.trim();
        if (query.length > 2) {
            fetch(API_USUARIOS_SEARCH + "?name=" + encodeURIComponent(query))
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al buscar clientes: ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    const suggestions = document.getElementById('suggestions');
                    suggestions.innerHTML = '';
                    if (data.length > 0) {
                        suggestions.style.display = 'block';
                        data.forEach(user => {
                            const li = document.createElement('li');
                            li.classList.add('list-group-item');
                            li.textContent = `${user.nombre} (${user.correoElectronico})`;
                            li.addEventListener('click', function () {
                                document.getElementById('clientSearch').value = user.nombre;
                                document.getElementById('clientEmail').value = user.correoElectronico;
                                suggestions.style.display = 'none';
                            });
                            suggestions.appendChild(li);
                        });
                    } else {
                        suggestions.style.display = 'none';
                    }
                })
                .catch(error => console.error('Error al buscar clientes:', error));
        } else {
            document.getElementById('suggestions').style.display = 'none';
        }
    });

    // Agregar ejercicio a la rutina del día seleccionado
    document.getElementById('addExercise').addEventListener('click', function () {
        const daySelect = document.getElementById('daySelect');
        const selectedDays = Array.from(daySelect.selectedOptions).map(option => option.value);
        const exerciseSelect = document.getElementById('exerciseSelect');

        if (!exerciseSelect) {
            Swal.fire('Error', 'El selector de ejercicios no está disponible.', 'error');
            return;
        }

        const exerciseId = exerciseSelect.value;
        const sets = document.getElementById('sets').value;
        const repeticiones = document.getElementById('repeticiones').value;
        const peso = document.getElementById('peso').value;

        if (!exerciseId || !sets || !repeticiones || !peso || selectedDays.length === 0) {
            Swal.fire('Error', 'Por favor, llena todos los campos antes de agregar un ejercicio.', 'error');
            return;
        }

        selectedDays.forEach(day => {
            if (!ejerciciosPorDia[day]) {
                ejerciciosPorDia[day] = [];
            }
            ejerciciosPorDia[day].push({ exerciseId, sets, repeticiones, peso });
        });

        actualizarVistaEjercicios();
    });

    function actualizarVistaEjercicios() {
        const exerciseList = document.getElementById('exerciseList');
        exerciseList.innerHTML = '';

        Object.keys(ejerciciosPorDia).forEach(day => {
            const dayHeader = document.createElement('h5');
            dayHeader.textContent = day;
            exerciseList.appendChild(dayHeader);

            ejerciciosPorDia[day].forEach((ejercicio, index) => {
                const ejercicioElement = document.createElement('div');
                const exerciseName = document.querySelector(`#exerciseSelect option[value="${ejercicio.exerciseId}"]`).textContent;
                ejercicioElement.textContent = `Ejercicio: ${exerciseName}, Sets: ${ejercicio.sets}, Repeticiones: ${ejercicio.repeticiones}, Peso: ${ejercicio.peso} kg`;
                exerciseList.appendChild(ejercicioElement);
            });
        });
    }

    // Manejar el envío del formulario para crear la rutina
    document.getElementById('rutinaForm').addEventListener('submit', function (e) {
        e.preventDefault();

        const clientEmail = document.getElementById('clientEmail').value;

        if (!clientEmail || Object.keys(ejerciciosPorDia).length === 0) {
            Swal.fire('Error', 'Por favor, asegúrate de que todos los campos obligatorios estén completos.', 'error');
            return;
        }

        rutinaParaPdf = Object.keys(ejerciciosPorDia).map(day => ({
            correoElectronico: clientEmail,
            entrenadorCorreo: entrenadorCorreo,
            medicionId: 1,
            fechaCreacion: new Date(),
            diaSemana: day,
            ejercicios: ejerciciosPorDia[day]
        }));

        Promise.all(rutinaParaPdf.map(rutinaData =>
            fetch(API_RUTINA_CREATE, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(rutinaData)
            })
        ))
            .then(responses => {
                if (responses.every(response => response.ok)) {
                    Swal.fire('Éxito', 'Las rutinas se han guardado correctamente.', 'success');
                    actualizarVistaEjercicios(); // Actualizar vista pero no reiniciar formulario
                } else {
                    throw new Error('Error al guardar algunas rutinas.');
                }
            })
            .catch(error => {
                console.error('Error al guardar las rutinas:', error);
                Swal.fire('Error', 'Hubo un problema al guardar las rutinas. Inténtalo de nuevo.', 'error');
            });
    });

    // Crear PDF y descargarlo manualmente
    document.getElementById('downloadPdf').addEventListener('click', function () {
        if (!rutinaParaPdf) {
            Swal.fire('Error', 'No hay rutinas disponibles para descargar. Guarda una rutina primero.', 'error');
            return;
        }

        crearPdf(document.getElementById('clientEmail').value);
    });

    // Enviar mensaje personalizado por correo electrónico
    document.getElementById('sendPdfByEmail').addEventListener('click', function () {
        if (!rutinaParaPdf) {
            Swal.fire('Error', 'No hay rutinas disponibles para enviar. Guarda una rutina primero.', 'error');
            return;
        }

        enviarMensajePorCorreo(document.getElementById('clientEmail').value); // Enviar el mensaje por correo sin adjuntar PDF
    });

    function crearPdf(clientEmail) {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
        doc.setFontSize(16);
        doc.text("Rutina de Ejercicios", 105, 20, null, null, 'center');
        doc.setFontSize(12);
        doc.text(`Cliente: ${clientEmail}`, 20, 30);
        doc.text(`Entrenador: ${entrenadorCorreo}`, 20, 40);

        let yOffset = 50;

        // Verifica si autoTable está disponible
        if (doc.autoTable) {
            const rows = Object.keys(ejerciciosPorDia).flatMap(day =>
                ejerciciosPorDia[day].map(ejercicio => [
                    day,
                    document.querySelector(`#exerciseSelect option[value="${ejercicio.exerciseId}"]`).textContent,
                    ejercicio.sets,
                    ejercicio.repeticiones,
                    ejercicio.peso
                ])
            );

            if (rows.length > 0) {
                doc.autoTable({
                    head: [['Día', 'Ejercicio', 'Sets', 'Repeticiones', 'Peso (kg)']],
                    body: rows,
                    startY: yOffset,
                    theme: 'striped',
                    headStyles: { fillColor: [41, 128, 185] },
                    alternateRowStyles: { fillColor: [245, 245, 245] },
                    tableLineColor: [44, 62, 80],
                    tableLineWidth: 0.1,
                    styles: { fontSize: 10 },
                    margin: { top: 50 }
                });
                yOffset = doc.lastAutoTable.finalY + 20;
            } else {
                doc.text("No se han agregado ejercicios a la rutina.", 20, yOffset);
            }
        } else {
            console.error('autoTable plugin no está disponible.');
        }

        doc.text(`IMC Comentario: ${document.getElementById('imcComentario').textContent}`, 20, yOffset);

        doc.save(`rutina_${clientEmail}.pdf`);
    }

    function enviarMensajePorCorreo(clientEmail) {
        const rutinaTexto = Object.keys(ejerciciosPorDia).map(day => {
            return `${day}:\n` + ejerciciosPorDia[day].map(ejercicio => {
                const exerciseName = document.querySelector(`#exerciseSelect option[value="${ejercicio.exerciseId}"]`).textContent;
                return `  - Ejercicio: ${exerciseName}, Sets: ${ejercicio.sets}, Repeticiones: ${ejercicio.repeticiones}, Peso: ${ejercicio.peso} kg`;
            }).join('\n');
        }).join('\n\n');

        const payload = {
            ToEmail: clientEmail,
            Subject: `Rutina Asignada por ${entrenadorCorreo}`,
            Message: `Estimado/a ${clientEmail},\n\nSe le ha asignado la siguiente rutina de ejercicios:\n\n${rutinaTexto}\n\n¡Esperamos que disfrute su entrenamiento!\n\nSaludos,\nSu equipo de acondicionamiento físico`
        };

        console.log('Enviando payload:', payload);

        fetch(API_SEND_PDF, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(payload)
        })
            .then(response => {
                if (response.ok) {
                    Swal.fire('Éxito', 'El mensaje ha sido enviado por correo.', 'success');
                } else {
                    return response.text().then(err => {
                        throw new Error(`Error al enviar el mensaje por correo: ${err}`);
                    });
                }
            })
            .catch(error => {
                console.error('Error al enviar el mensaje:', error);
                Swal.fire('Error', 'Hubo un problema al enviar el mensaje. Inténtalo de nuevo.', 'error');
            });
    }

    // Calcular el IMC del cliente
    document.getElementById('calcularIMC').addEventListener('click', function () {
        const altura = parseFloat(document.getElementById('altura').value);
        const peso = parseFloat(document.getElementById('pesoIMC').value);

        if (!isNaN(altura) && !isNaN(peso) && altura > 0 && peso > 0) {
            const alturaMetros = altura / 100;
            const imc = peso / (alturaMetros * alturaMetros);
            document.getElementById('resultadoIMC').value = imc.toFixed(2);

            let imcComentario = '';
            if (imc < 18.5) {
                imcComentario = 'Bajo peso';
            } else if (imc >= 18.5 && imc < 24.9) {
                imcComentario = 'Peso normal';
            } else if (imc >= 25 && imc < 29.9) {
                imcComentario = 'Sobrepeso';
            } else {
                imcComentario = 'Obesidad';
            }

            document.getElementById('imcComentario').textContent = `Estado según IMC: ${imcComentario}`;
        } else {
            Swal.fire('Error', 'Por favor, ingresa valores válidos para altura y peso.', 'error');
        }
    });
});
