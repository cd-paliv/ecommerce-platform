# Administración de usuarios

### Modelo
La aplicación permite la creación de usuarios con diferentes roles. Los usuarios autenticados son los únicos que pueden acceder a las interfaces de administración del sistema. 

Cada usuario tiene los siguientes atributos:
- Nombre de usuario (debe ser único)
- Correo electrónico (debe ser único)
- Teléfono
- Contraseña
- Rol
- Fecha de ingreso a la cadena

### Validaciones
El modelo User incluye las siguientes validaciones:
- Validación de contraseña utilizando bcrypt con `has_secure_password`.
- Validación de presencia y unicidad para el nombre de usuario y correo electrónico.
- Validación de formato para el teléfono y correo electrónico.
- Validación de roles utilizando freeze para definir los roles permitidos (`admin`, `manager`, `employee`).

### Implementación
El modelo User define una relación con ventas y funciones para determinar el rol del usuario en un momento dado comparándolo con un string.

El controlador del user maneja las acciones relacionadas con los usuarios:
- `index`: Lista todos los usuarios con paginación.
- `show`: Muestra la información de un usuario específico.
- `new`: Muestra el formulario para crear un nuevo usuario.
- `edit`: Muestra el formulario para editar un usuario existente.
- `create`: Crea un nuevo usuario con los parámetros permitidos.
- `update`: Actualiza un usuario existente con los parámetros permitidos.
- `deactivate`: Desactiva un usuario poniendo el campo deactivated en true y cambiando la contraseña por un valor aleatorio generado con `SecureRandom.hex`.

### Autorización
El controlador utiliza `load_and_authorize_resource` de la gema cancancan, método que verifica los permisos del usuario loggeado para asegurarse que está autorizado a realizar la acción solicitada.

### Redirección
Se creó además la función handle_access_denied en el controller de la aplicación para redirigir a los usuarios a la página de inicio en caso de que no tengan permisos para acceder a una página específica.
```rb
def handle_access_denied(exception)
    if user_signed_in?
    redirect_to root_path, alert: "No estás autorizado para acceder a esta página"
    else
    redirect_to sessions_new_path, alert: "Debes iniciar sesión para acceder a esta página"
    end
end
```