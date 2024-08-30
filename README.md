
# Proyecto de Gestión de Gimnasio

Este proyecto es una aplicación web diseñada para la gestión integral de un gimnasio. Proporciona funcionalidades tanto para administradores como para entrenadores, permitiéndoles gestionar usuarios, roles, ejercicios y rutinas. Los usuarios pueden registrarse, iniciar sesión y acceder a sus rutinas de ejercicios personalizadas.

## Tecnologías Utilizadas

- **Backend**: ASP.NET Core
- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Base de Datos**: SQL Server
- **ORM**: Entity Framework Core
- **Autenticación**: JWT (JSON Web Tokens)

## Arquitectura del Proyecto

El proyecto sigue el patrón de arquitectura Modelo-Vista-Controlador (MVC), lo que facilita la separación de responsabilidades y mejora la escalabilidad. A continuación, se describen los componentes principales del proyecto:

- **Modelo**: Representa las entidades de la base de datos y la lógica de negocio. Entity Framework Core se encarga de la interacción con la base de datos SQL Server.
- **Vista**: Implementada con HTML, CSS y Bootstrap, esta capa gestiona la presentación y la interacción con el usuario, utilizando JavaScript para funcionalidades dinámicas.
- **Controlador**: Recibe las solicitudes del usuario, interactúa con el modelo y selecciona la vista adecuada para devolverla al usuario.

## Estructura del Proyecto

```plaintext
GYM-APP/ 
│ 
├── MVC/ 
│ ├── Controllers/    # Controladores de la aplicación 
│ ├── Models/         # Modelos y entidades 
│ ├── Views/          # Vistas (HTML, CSS, JS) 
│ └── wwwroot/        # Archivos estáticos 
├── DataBaseGym.sql   # Script SQL para la base de datos 
├── inserts_gymproyect2.sql # Archivo SQL con inserts para las tablas del proyecto
└── README.md         # Documentación del proyecto
```

## Instrucciones de Instalación

1. **Configurar la base de datos**:
   - Ejecuta el script `DataBaseGym.sql` en tu servidor SQL Server para crear la base de datos necesaria.
   - Configura la cadena de conexión en el archivo `appsettings.json` de tu proyecto. Ejemplo de cadena de conexión:
     ```json
     "ConnectionStrings": {
        "DefaultConnection": "Server=YOUR_SERVER_NAME;Database=db_aaaf3a_gymproyect2;User Id=YOUR_USERNAME;Password=YOUR_PASSWORD;Trusted_Connection=False;MultipleActiveResultSets=True;"
     }
     ```
   - Reemplaza `YOUR_SERVER_NAME`, `YOUR_USERNAME` y `YOUR_PASSWORD` con tus credenciales y configuración del servidor SQL Server.

2. **Restaurar dependencias**:
   - Asegúrate de que todas las dependencias del proyecto están instaladas ejecutando:
     ```bash
     dotnet restore
     ```

3. **Compilar el proyecto**:
   - Compila el proyecto utilizando:
     ```bash
     dotnet build
     ```

4. **Ejecutar la aplicación**:
   - Inicia la aplicación con el siguiente comando:
     ```bash
     dotnet run
     ```

5. **Migraciones de la base de datos (opcional)**:
   - Para realizar migraciones adicionales, usa los comandos:
     ```bash
     dotnet ef migrations add NombreDeLaMigracion
     dotnet ef database update
     ```

## Inserts en la Base de Datos

Para agregar datos iniciales en las tablas `Roles`, `Ejercicios` y `Equipos`, utiliza los siguientes comandos SQL:

```sql
-- Inserts para la tabla Roles
INSERT INTO [db_aaaf3a_gymproyect2].[dbo].[Roles] ([Id], [Nombre], [Descripcion]) VALUES
(1, 'Administrador', 'Acceso total a todos los módulos y funcionalidades del sistema'),
(2, 'Entrenador', 'Gestión de rutinas y asistencia a los clientes'),
(3, 'Recepcionista', 'Gestión de citas y atención al cliente'),
(4, 'Usuario', 'Acceso a perfil, rutinas y registro de entrenamientos');

-- Inserts para la tabla Ejercicios
INSERT INTO [db_aaaf3a_gymproyect2].[dbo].[Ejercicios] ([Nombre], [Tipo], [Descripcion], [Peso], [Tiempo], [AMRAP]) VALUES
('Sentadilla', 'Fuerza', 'Ejercicio para el tren inferior', 80, NULL, 10),
('Press de Banca', 'Fuerza', 'Ejercicio para pecho y triceps', 60, NULL, 8),
('Burpees', 'Cardio', 'Ejercicio de cuerpo completo', NULL, 30, 15),
('Peso Muerto', 'Fuerza', 'Ejercicio para espalda y piernas', 100, NULL, 6);

-- Inserts para la tabla Equipos
INSERT INTO [db_aaaf3a_gymproyect2].[dbo].[Equipos] ([Nombre], [Descripcion], [GrupoMuscular], [Cantidad], [Disponibilidad]) VALUES
('Mancuernas', 'Pesas de mano', 'Brazos', 20, 1),
('Cinta de Correr', 'Máquina de cardio', 'Piernas', 5, 1),
('Banco de Pesas', 'Banco para ejercicios con pesas', 'Pecho', 10, 1),
('Bicicleta Estática', 'Máquina de cardio', 'Piernas', 10, 1);
```

También puedes encontrar estos inserts en el archivo `inserts_gymproyect2.sql` adjunto al proyecto.

## Documentación de la API

La documentación de la API está disponible en Swagger. Una vez que la aplicación esté en ejecución, accede a la documentación en la siguiente URL:

```
http://localhost:[puerto]/swagger/index.html
```

## Contribuciones

Las contribuciones son bienvenidas. Si deseas contribuir al proyecto, abre un issue o envía un pull request.

## Licencia

Este proyecto está bajo la Licencia MIT. Para más detalles, consulta el archivo LICENSE.md.
