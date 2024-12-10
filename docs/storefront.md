# Storefront

Parte pública de la aplicación. Consiste del home, listado de productos y vista de producto.

### Home - GET /
La página principal del Storefront.

### Listado de productos - GET /products/
Muestra una lista de todos los productos disponibles, con paginado. Los productos eliminados no son mostrados en el listado. Cada producto incluye:
- Imagen (first)
- Nombre
- Precio
- Stock disponible
- Botón para ver detalles de producto

### Vista de producto - GET /products/:id
Permite ver más en detalle los datos de un producto expecífico. Incluye:
- Imagenes
- Nombre
- Descripción
- Categorías
- Stock disponible

## Detalles adicionales
El storefront puede ser accedido por cualquiera. Con sesión iniciada o no.