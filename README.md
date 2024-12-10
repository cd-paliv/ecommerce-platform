# README

## Descripción del Proyecto
Este proyecto es una aplicación de gestión de productos y ventas para una cadena de tiendas. Permite a los empleados gestionar productos, registrar ventas y manejar el stock de manera eficiente.

## Ruby y Rails Versiones
- Ruby: 3.3.5
- Rails: 8.0.0

## Configuración
1. Clonar el repositorio
2. Instalar las dependencias
3. Crear la base de datos
4. Precompilar los assets
5. Iniciar el servidor

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
rails assets:precompile
rails s
```

### Inicialización de la bd
El archivo `seeds.rb`contiene los datos necesarios para inicializar la bd con categorías, talles, colores, usuarios y productos.

## Usuarios de Prueba
Se crea un usuario para cada rol:
- Administrador: `admin@avivas.com` / `admin`
- Gerente: `man@avivas.com` / `man`
- Empleado: `emp@avivas.com` / `emp`

# Base de Datos
## Decisiones de diseño
- Manejo de imágenes: se utilizó la gema `ActiveStorage` para almacenar las imágenes de los productos.
- Borrado lógico: se utiliza la gema `Paranoia` para realizar borrados lógicos de productos.
- Roles y permisos: se implementan roles como un atributo string de los usuarios, y se utilizan la gema `cancancan` para gestionar los permisos.

## Modelo de Base de Datos
El modelo de base de datos se encuentra en el archivo [schema.rb](db/schema.rb).

El modelo conceptual define las mismas entidades y relaciones actualmente en el schema.
![Diagrama de Base de Datos](docs/images/db.svg)

# Documentación
La documentación detallada de cada parte del proyecto se encuentra en la carpeta `docs`, junto con el enunciado del trabajo.

- [Storefront](docs/storefront.md)
- [Administración de usuarios](docs/user-mgmt.md)
- [Administración de productos](docs/product-mgmt.md)
- [Administración de ventas](docs/sale-mgmt.md)