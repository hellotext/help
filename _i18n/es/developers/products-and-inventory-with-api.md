Los productos y variantes le dan a Hellotext el contexto de catálogo necesario para entender vistas de productos, carritos, pedidos, recomendaciones y playbooks relacionados con productos.

La API pública de Productos sincroniza registros del catálogo. La cantidad y disponibilidad de stock en tiempo real son otro asunto: el endpoint público actual de productos no expone un campo específico de cantidad o disponibilidad de inventario.

Usa la [referencia de la API](https://www.hellotext.com/api#products) para consultar los contratos completos de productos y variantes. Esta guía explica cómo mantener una identidad estable y cómo se diferencia la disponibilidad de inventario de la sincronización del catálogo.

## Antes de comenzar

Prepara:

- Un token privado de autorización para la API guardado en tu backend.
- Un nombre de origen estable, como `custom_store`.
- Referencias permanentes de productos y variantes en tu sistema de comercio.
- SKU únicos cuando tu catálogo los utilice.
- URLs públicas para los productos y sus imágenes.
- Precios y códigos de moneda ISO 4217.
- Categorías, colecciones, etiquetas, marca y descripciones útiles para búsqueda y recomendaciones.

Define qué registro es el producto principal y cuáles son sus variantes comprables antes de la primera sincronización. No cambies ese modelo entre importaciones.

## 1. Elige una identidad estable para cada producto

Usa estos campos de forma consistente:

- `source`: el sistema propietario del catálogo, como `custom_store`.
- `reference`: el identificador permanente del producto o variante en ese origen.
- `sku`: el SKU del sistema de comercio cuando exista.

No uses el nombre, la URL, el precio o la posición del producto en una importación como identidad. Esos valores pueden cambiar.

Hellotext puede recuperar y actualizar productos por ID, referencia o SKU. De todos modos, guarda el ID de Hellotext devuelto; es el identificador más seguro para eventos y artículos de pedidos posteriores.

## 2. Crea un producto y sus variantes

Crea el producto principal con las variantes conocidas en ese momento:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/products \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Championes Everyday",
    "reference": "product-100",
    "source": "custom_store",
    "brand": "Acme",
    "url": "https://shop.example.com/products/everyday-sneakers",
    "image_url": "https://shop.example.com/images/everyday-sneakers.jpg",
    "price": {
      "amount": 89.90,
      "currency": "USD"
    },
    "categories": ["Calzado"],
    "collection": ["Uso diario"],
    "tags": ["Comodidad"],
    "variants": [
      {
        "name": "Championes Everyday / Negro / 42",
        "reference": "variant-100-black-42",
        "sku": "SKU-100-BLK-42",
        "price": {
          "amount": 89.90,
          "currency": "USD"
        }
      }
    ]
  }'
```

El `name` del producto es obligatorio. Usa una URL de imagen accesible públicamente porque Hellotext necesita descargarla.

Guarda los IDs devueltos para el producto y sus variantes. Consulta [Crear un producto](https://www.hellotext.com/api#create_a_product) para ver todos los campos compatibles.

## 3. Actualiza el registro existente cuando cambie el catálogo

No crees un producto nuevo porque cambió su precio, nombre, imagen, URL, categoría o etiquetas.

Actualiza el producto existente por su ID de Hellotext, referencia o SKU:

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/attribution/products/product-100 \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "price": {
      "amount": 79.90,
      "currency": "USD"
    },
    "tags": ["Comodidad", "Oferta"]
  }'
```

Conserva el `source` y la `reference` originales. Usa los endpoints específicos de variantes para crear o actualizar variantes individuales en lugar de volver a crear el producto principal.

Consulta [Actualizar un producto](https://www.hellotext.com/api#update_a_product) y [Variantes de productos](https://www.hellotext.com/api#product_variants).

## 4. Entiende el límite del inventario

Actualmente, la API pública de Productos no incluye un campo compatible para:

- Cantidad actual en stock.
- Cantidad disponible para vender.
- Estado disponible o agotado.
- Saldos de inventario por ubicación.

No agregues valores como `stock`, `quantity` o `available` dentro de `metadata` o propiedades personalizadas esperando que Hellotext los use en playbooks que dependen del inventario. La metadata no se convierte automáticamente en una señal de inventario compatible.

Las integraciones compatibles de comercio y ERP pueden permitir que Hellotext consulte la disponibilidad directamente en el origen. Si una tienda propia necesita Alerta de Reposición, urgencia por poco stock u otro flujo que dependa de disponibilidad en tiempo real, conecta un origen de inventario compatible o confirma con Hellotext el camino de integración antes del lanzamiento.

No elimines un producto solamente porque está agotado temporalmente. La eliminación corresponde a un producto que ya no debería permanecer en el catálogo activo de Hellotext.

## 5. Registra actividad con el ID del producto

Hellotext.js registra automáticamente la URL de la página, pero no puede deducir qué producto del catálogo representa. Envía `product.viewed` explícitamente:

```javascript
await Hellotext.track('product.viewed', {
  object: 'PRODUCT_ID',
})
```

Usa el ID de la variante cuando el cliente haya elegido una variante específica y ese detalle sea relevante para el evento.

En carritos y pedidos, reutiliza los mismos IDs de productos o variantes. No crees registros separados para la actividad del navegador, los artículos del carrito y los artículos del pedido.

Consulta [Seguimiento de eventos]({% link _developers/tracking-events.md %}) y la [referencia de eventos de productos](https://www.hellotext.com/api#track_product_events).

## 6. Diseña una sincronización segura del catálogo

Una sincronización confiable debería:

1. Leer los productos modificados en el sistema de origen.
2. Encontrarlos mediante el ID de Hellotext guardado o la referencia estable del origen.
3. Crear únicamente productos que no existan.
4. Actualizar los campos modificados en los productos existentes.
5. Crear o actualizar variantes por separado.
6. Conservar un mapeo entre los IDs del origen y los IDs de Hellotext.
7. Registrar errores de validación sin guardar el token de autorización.

Para catálogos grandes, procesa lotes limitados y conserva el cursor o punto de control. Un lote fallido debe poder continuar sin volver a crear los productos que ya se sincronizaron correctamente.

## 7. Verifica la calidad del catálogo

Prueba un producto principal con al menos una variante:

- El origen y la referencia coinciden con tu sistema de comercio.
- Los SKU son únicos y corresponden a las variantes correctas.
- El nombre, URL, imagen, marca, categorías, colección y etiquetas son útiles.
- El precio y la moneda coinciden con la tienda.
- Una vista de producto se resuelve con el mismo producto.
- Un pedido de prueba utiliza el mismo ID de producto o variante.
- Ningún playbook que dependa del inventario se habilita hasta que la disponibilidad en tiempo real tenga un origen compatible.

Si aparecen duplicados o errores de validación, usa [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %}).

## Guías relacionadas

- [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %})
- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Crea y registra pedidos con la API]({% link _developers/orders-with-api.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Playbook Alerta de Reposición]({% link _journeys/back-in-stock-pounce.md %})
