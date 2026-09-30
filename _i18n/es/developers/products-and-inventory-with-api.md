Los productos y variantes le dan a Hellotext el contexto de catálogo necesario para entender vistas de productos, carritos, pedidos, recomendaciones y misiones relacionadas con productos.

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

El token, los productos y sus variantes deben pertenecer al mismo negocio. La creación y actualización requieren una suscripción activa. Guarda el secreto sólo en tu backend; el ID público del negocio usado por Hellotext.js no sustituye al token.

Para preparar la autorización, abre **Ajustes → Autorizaciones → Crear un token nuevo**. La figura muestra únicamente el nombre de un borrador ficticio, sin crear ni revelar un secreto.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Nombre ficticio de token de autorización para una tienda propia, sin guardar ni mostrar un secreto.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 558px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/custom-store-integration/token-es-mobile.png 2x" width="748" height="480" />
        <img src="/images/developers/custom-store-integration/token-es.png" srcset="/images/developers/custom-store-integration/token-es.png 2x" style="width: auto; margin: 0 auto;" width="1080" height="524" loading="lazy" decoding="async" alt="Nombre ficticio de token de autorización para una tienda propia, sin guardar ni mostrar un secreto." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Borrador real en un negocio ficticio: no crea ni muestra un token. Conserva el secreto sólo en tu backend.</figcaption>
</figure>

## 1. Elige una identidad estable para cada producto

Usa estos campos de forma consistente:

- `source`: el sistema propietario del catálogo, como `custom_store`.
- `reference`: el identificador permanente del producto o variante en ese origen.
- `sku`: el SKU del sistema de comercio cuando exista.

No uses el nombre, la URL, el precio o la posición del producto en una importación como identidad. Esos valores pueden cambiar.

Hellotext puede recuperar y actualizar productos por ID, referencia o SKU. De todos modos, guarda el ID público de Hellotext devuelto; es el identificador más seguro para eventos y artículos de pedidos posteriores. `reference` identifica el producto en tu sistema; no es ese ID público.

Una referencia puede repetirse en distintos orígenes. Los endpoints de consulta y actualización no incluyen un selector de `source` para resolver esa ambigüedad: usa el ID conservado y comprueba el origen en la respuesta. Mantén los SKU únicos en tu integración; no uses cambios de mayúsculas para distinguir referencias o SKU.

En **Ajustes → Objetos → Productos → Editar**, contrasta nombre, referencia, SKU y origen. El producto ficticio «Agenda semanal» de la figura tiene referencia `PRODUCT-GUIDE-1001` y SKU `GUIDE-PLANNER`; son datos de catálogo, no evidencia de stock o actividad del cliente.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Editor real del producto ficticio Agenda semanal con referencia PRODUCT-GUIDE-1001, SKU GUIDE-PLANNER y origen custom_store.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 521px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/products-and-inventory-with-api/identity-es-mobile.png 2x" width="778" height="786" />
        <img src="/images/developers/products-and-inventory-with-api/identity-es.png" srcset="/images/developers/products-and-inventory-with-api/identity-es.png 2x" style="width: auto; margin: 0 auto;" width="1006" height="786" loading="lazy" decoding="async" alt="Editor real del producto ficticio Agenda semanal con referencia PRODUCT-GUIDE-1001, SKU GUIDE-PLANNER y origen custom_store." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">Datos de catálogo del producto ficticio existente en borrador y sin eventos. La referencia y el SKU no son el ID público del producto ni una señal de inventario.</figcaption>
</figure>

## 2. Crea un producto y sus variantes

Crea el producto principal con las variantes conocidas en ese momento:

```bash
curl --request POST \
  --url https://api.hellotext.com/v1/attribution/products \
  --header "Authorization: Bearer $HELLOTEXT_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "name": "Zapatillas Everyday",
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
        "name": "Zapatillas Everyday / Negro / 42",
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

El `name` del producto es obligatorio. Usa una URL de imagen accesible públicamente porque Hellotext necesita descargarla. Las URLs `shop.example.com` del ejemplo son marcadores: reemplázalas por URLs reales antes de usarlo.

Una creación correcta de producto devuelve HTTP 201 y el objeto; una validación fallida devuelve HTTP 422 con errores. Conservar el producto no registra una vista, compra ni consentimiento de un cliente. Comprueba la respuesta y vuelve a consultar `GET /v1/attribution/products/:id` antes de avanzar.

La colección `variants` de la respuesta puede incluir primero una representación de la variante predeterminada del propio producto. Conserva los IDs del padre y de sus variantes sin volver a crear ese primer registro. Para agregar una variante posteriormente, usa `POST /products/:product_id/variants` bajo `/v1/attribution`; para consultar, actualizar o eliminar una variante existente, usa `/v1/attribution/variants/:id`.

Guarda los IDs devueltos para el producto y sus variantes. Consulta [Crear un producto](https://www.hellotext.com/api#create_a_product) para ver todos los campos compatibles.

## 3. Actualiza el registro existente cuando cambie el catálogo

No crees un producto nuevo porque cambió su precio, nombre, imagen, URL, categoría o etiquetas.

Actualiza el producto existente preferentemente por su ID público conservado. En la URL siguiente, `PRODUCT_ID` es un marcador que debes reemplazar por ese ID:

```bash
curl --request PATCH \
  --url https://api.hellotext.com/v1/attribution/products/PRODUCT_ID \
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

Al actualizar el padre, omite `variants` cuando no quieras modificar sus variantes. **Enviar `variants: []` elimina las variantes existentes del catálogo**; no es una lista neutra ni una manera de dejar todo igual. No supongas que reenviar la lista original actualiza cada variante existente: usa su endpoint y su ID.

`price.amount` es un importe decimal, no centavos ni unidades de stock; especifica `price.currency`. Consulta de nuevo el producto o variante para comprobar el importe y, si corresponde, `converted_amount` y `converted_currency`. No presupongas que un precio nuevo se aplica a todas las variantes o corrige pedidos ya registrados.

En el editor ES, **Cantidad** y **Cantidad convertida** representan aquí importes monetarios. La figura conserva USD 44.95 y su equivalente USD 44.95; abrir el control no guarda un cambio de precio ni informa cuántas unidades están disponibles.

<figure class="ht-editorial-visual ht-editorial-visual--screenshot" aria-label="Control real de importe USD 44.95 y cantidad convertida USD 44.95 de un producto ficticio.">
  <div class="ht-editorial-visual__stage">
    <div class="ht-editorial-visual__image-frame" style="width: fit-content; max-width: 489px; margin: 0 auto;">
      <picture>
        <source media="(max-width: 470px)" srcset="/images/developers/products-and-inventory-with-api/price-es-mobile.png 2x" width="714" height="300" />
        <img src="/images/developers/products-and-inventory-with-api/price-es.png" srcset="/images/developers/products-and-inventory-with-api/price-es.png 2x" style="width: auto; margin: 0 auto;" width="942" height="300" loading="lazy" decoding="async" alt="Control real de importe USD 44.95 y cantidad convertida USD 44.95 de un producto ficticio." />
      </picture>
    </div>
  </div>
  <figcaption class="ht-editorial-visual__caption">En esta interfaz, Cantidad es un importe monetario. El control se abrió sin guardar; no representa unidades de stock ni un cambio de precio.</figcaption>
</figure>

Consulta [Actualizar un producto](https://www.hellotext.com/api#update_a_product) y [Variantes de productos](https://www.hellotext.com/api#product_variants).

## 4. Entiende el límite del inventario

Actualmente, la API pública de Productos no incluye un campo compatible para:

- Cantidad actual en stock.
- Cantidad disponible para vender.
- Estado disponible o agotado.
- Saldos de inventario por ubicación.

No agregues valores como `stock`, `quantity` o `available` dentro de `metadata` o propiedades personalizadas esperando que Hellotext los use en misiones que dependen del inventario. La metadata no se convierte automáticamente en una señal de inventario compatible.

Un valor predeterminado de disponibilidad para un catálogo propio tampoco demuestra stock real. Verifica la disponibilidad contra el sistema que administra existencias.

Las integraciones compatibles de comercio y ERP pueden permitir que Hellotext consulte la disponibilidad directamente en el origen. Si una tienda propia necesita Alerta de Reposición, urgencia por poco stock u otro flujo que dependa de disponibilidad en tiempo real, conecta un origen de inventario compatible o confirma con Hellotext el camino de integración antes del lanzamiento.

No elimines un producto solamente porque está agotado temporalmente. La eliminación corresponde a un producto que ya no debería permanecer en el catálogo activo de Hellotext.

## 5. Registra actividad con el ID del producto

En el SDK publicado `@hellotext/hellotext` 2.6.0, la inicialización es asíncrona y no envía automáticamente `page.viewed`. Espera a que termine, registra cada navegación una sola vez y envía `product.viewed` con el producto correcto. El SDK incluye el contexto de URL y sesión; no puede deducir qué producto del catálogo representa esa página.

Si tu integración ya inicializa Hellotext.js y registra la navegación, no repitas esas llamadas; agrega sólo la vista del producto. `PUBLIC_BUSINESS_ID` y `PRODUCT_ID` son marcadores de IDs del mismo negocio:

El ejemplo usa `await` dentro de un módulo JavaScript o una función `async`.

```javascript
await Hellotext.initialize('PUBLIC_BUSINESS_ID')
await Hellotext.track('page.viewed')
await Hellotext.track('product.viewed', {
  object: 'PRODUCT_ID',
})
```

Usa el ID de la variante cuando el cliente haya elegido una variante específica y ese detalle sea relevante para el evento.

En carritos y pedidos, reutiliza los mismos IDs de productos o variantes. No crees registros separados para la actividad del navegador, los artículos del carrito y los artículos del pedido.

En tracking desde el backend, envía el perfil o la sesión del mismo negocio; si envías ambos, la sesión debe estar previamente asociada a ese perfil. La sesión del navegador no implica consentimiento para mensajes. Conserva la fecha real del evento con `tracked_at` cuando corresponda: segundos Unix o ISO 8601 con zona horaria, no milisegundos.

La respuesta de tracking `status: received` confirma recepción; no devuelve un ID nuevo de producto ni demuestra procesamiento, aparición en un reporte o ejecución de una misión. Verifica después el evento y su objeto en la actividad del perfil correcto. No envíes la misma vista desde el navegador y el backend.

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

Para catálogos grandes, procesa lotes limitados y conserva el cursor o punto de control del listado paginado. Reconcilia `source`, `reference`, SKU y los IDs guardados en tu sistema; no asumas un filtro de origen no documentado en el listado.

La API no expone una clave general de idempotencia. Si una creación vence por timeout o pierde su respuesta, su resultado es incierto: consulta o reconcilia antes de repetir el `POST`. Un lote fallido debe poder continuar sin volver a crear los productos que ya se sincronizaron correctamente. Corrige errores de validación antes de reintentar y evita llamadas paralelas que intenten crear la misma identidad.

## 7. Verifica la calidad del catálogo

Prueba un producto principal con al menos una variante en un negocio de prueba aislado, con datos ficticios y misiones inactivas. Consulta el padre y cada variante por API y contrasta los datos visibles en **Ajustes → Objetos → Productos → Editar**:

- El origen y la referencia coinciden con tu sistema de comercio.
- Los SKU son únicos y corresponden a las variantes correctas.
- El nombre, URL, imagen, marca, categorías, colección y etiquetas son útiles.
- El precio y la moneda coinciden con la tienda.
- Una vista de producto se resuelve con el mismo producto.
- Un pedido de prueba utiliza el mismo ID de producto o variante.
- Ninguna misión que dependa del inventario se habilita hasta que la disponibilidad en tiempo real tenga un origen compatible.

Si aparecen duplicados o errores de validación, usa [Soluciona una integración propia]({% link _developers/troubleshoot-custom-integration.md %}).

## Guías relacionadas

- [Sincronización del catálogo de productos]({% link _integrations/product-catalog-sync.md %})
- [Integra una tienda propia con Hellotext]({% link _developers/custom-store-integration.md %})
- [Crea y registra pedidos con la API]({% link _developers/orders-with-api.md %})
- [Seguimiento de eventos]({% link _developers/tracking-events.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
- [Misión Alerta de Reposición]({% link _journeys/back-in-stock-pounce.md %})
