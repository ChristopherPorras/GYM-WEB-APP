
-- Inserts for the Roles table
INSERT INTO [db_aaaf3a_gymproyect2].[dbo].[Roles] ([Id], [Nombre], [Descripcion]) VALUES
(1, 'Administrador', 'Tiene acceso a todos los módulos y funcionalidades del sistema'),
(2, 'Entrenador', 'Puede crear y gestionar rutinas, asistir a los clientes en sus entrenamientos'),
(3, 'Recepcionista', 'Puede agendar citas y gestionar la atención al cliente'),
(4, 'Usuario', 'Tiene acceso a su perfil, rutinas y puede registrar sus entrenamientos');

-- Sample Inserts for the Ejercicios table
INSERT INTO [db_aaaf3a_gymproyect2].[dbo].[Ejercicios] ([Nombre], [Tipo], [Descripcion], [Peso], [Tiempo], [AMRAP]) VALUES
('Sentadilla', 'Fuerza', 'Ejercicio para el tren inferior', 80, NULL, 10),
('Press de Banca', 'Fuerza', 'Ejercicio para el pecho y triceps', 60, NULL, 8),
('Burpees', 'Cardio', 'Ejercicio de cuerpo completo', NULL, 30, 15),
('Peso Muerto', 'Fuerza', 'Ejercicio para la espalda y piernas', 100, NULL, 6);

-- Sample Inserts for the Equipos table
INSERT INTO [db_aaaf3a_gymproyect2].[dbo].[Equipos] ([Nombre], [Descripcion], [GrupoMuscular], [Cantidad], [Disponibilidad]) VALUES
('Mancuernas', 'Pesas de mano', 'Brazos', 20, 1),
('Cinta de Correr', 'Máquina de cardio', 'Piernas', 5, 1),
('Banco de Pesas', 'Banco para ejercicios con pesas', 'Pecho', 10, 1),
('Bicicleta Estática', 'Máquina de cardio', 'Piernas', 10, 1);
