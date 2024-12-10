# Administración de ventas

La aplicación permite registrar las ventas realizadas y los productos vendidos. Para ello, se implementa una interfaz de administración con las siguientes acciones:

- **Listar ventas**: Presenta una lista de todas las ventas realizadas.
- **Asentar venta**: Permite la creación de una nueva venta. Cada venta tiene una fecha y hora de realización, y permite agregar productos vendidos a la misma. Cada producto vendido tiene una cantidad y un precio de venta.
- **Cancelar venta**: Permite la cancelación de una venta realizada. Al cancelarse una venta, se devuelve el stock de los productos vendidos para que queden disponibles nuevamente. Las ventas canceladas no se eliminan de la base de datos.

## Atributos de las ventas
Las ventas deben contienen los siguientes datos:
- Productos vendidos, con cantidad y precio de venta
- Total de la venta
- Empleado que realizó la venta
- Cliente

## Implementación

### Modelo Sale
- **Estados**: Una venta puede estar en estado pending, completed o canceled.
- **Relaciones**: Una venta tiene muchos elementos de venta (`sale_items`), que representan los productos vendidos en la venta.

### Modelo SaleItem
- **Relaciones**: Un sale_item pertenece a una venta (`sale`) y a un producto.
- **Validaciones**:
  - quantity: Debe estar presente y ser mayor que 0.
  - price: Debe estar presente y ser mayor o igual a 0.
  - quantity_available: Verifica que la cantidad vendida no sea mayor que el stock disponible del producto.

### Controlador SalesController
- **Acciones**:
  - `index`: Lista todas las ventas ordenadas por fecha de actualización.
  - `show`: Muestra los detalles de una venta.
  - `checkout`: Completa una venta, reduciendo el stock de los productos vendidos y creando una nueva venta pendiente para el usuario.
  - `cancel`: Cancela una venta, restaurando el stock de los productos vendidos.

### Controlador SaleItemsController
- **Acciones**:
  - `create`: Añade un producto al carrito de la venta pendiente del usuario.
  - `destroy`: Elimina un producto del carrito de la venta pendiente del usuario.

### Método ApplicationController
El método `current_sale` gestiona la venta pendiente del usuario:
- Si el usuario está logueado, busca una venta pendiente asociada al usuario o crea una nueva.
- Si el usuario no está logueado, busca una venta pendiente asociada a la sesión o crea una nueva.

