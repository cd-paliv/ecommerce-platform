# Administración de productos

La aplicación permite a los empleados gestionar los productos, su stock y su precio. Para ello, se implementa una interfaz de administración con las siguientes acciones:

- **Listar productos**: Presenta una lista de todos los productos existentes (y NO ELIMINADOS).
- **Agregar producto**: Permite la creación de un nuevo producto.
- **Modificar producto**: Permite la modificación de un producto existente.
- **Eliminar producto**: Permite la eliminación de un producto existente. El borrado es lógico, actualizando el stock a 0 y estableciendo deleted_at`.

## Atributos de los productos

Los productos tienen los siguientes atributos:
- Nombre
- Descripción
- Precio unitario
- Stock disponible
- Imágenes (al menos una)
- Categoría
- Talle (opcional)
- Color (opcional)
- Fecha de ingreso al inventario
- Fecha de última modificación
- Fecha de baja (si fue eliminado)

## Implementación

### Modelo Product

- **Gema `paranoid`**: Utilizada para el borrado lógico de productos. Esto se logra con `acts_as_paranoid`, que añade el campo `deleted_at` y evita eliminar registros físicamente.
- **Gema `activestorage`**: Utilizada para el manejo de imágenes adjuntas a los productos.
- **Relaciones**: Un producto tiene muchas categorías (`has_and_belongs_to_many :categories`) y puede tener un talle y un color opcionales (`belongs_to :size, optional: true` y `belongs_to :color, optional: true`).
- **Validaciones**: Se asegura la presencia de `name`, `price`, `stock` e `images`.

### Baja lógica
El método destroy fue modificado para que en lugar de aplicar Product.destroy!, se ejecute `@product.update!(stock: 0, deleted_at: Time.now)`, realizando una baja lógica. Estos productos no son mostrados en el listado de productos, y para ser vistos se debe ejecutar en consola `Product.with_deleted`.