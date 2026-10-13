Los emails miden 640 px de ancho por defecto, con 24 px de margen interno a cada lado, así que el área de contenido mide 592 px. Sube cada imagen al doble del ancho con el que se muestra, para que se vea nítida en teléfonos y pantallas de alta densidad. La altura la defines tú: el email respeta la proporción de tu imagen y nunca la recorta.

## Cómo calcular el tamaño de una imagen

El ancho con el que se muestra una imagen es el ancho del contenido multiplicado por el ancho que configuras en el bloque de imagen. Dentro de una celda de tabla, resta también el margen interno izquierdo y derecho de la celda, que es de 12 px cada uno por defecto. Sube la imagen al doble del resultado.

En el teléfono, las imágenes se reducen para caber en la pantalla, pero nunca se muestran más grandes que su ancho mostrado.

## Bloques de imagen

Estos tamaños asumen el ancho predeterminado del email, 640 px.

| Imagen | Se muestra a | Sube al menos |
| --- | --- | --- |
| A todo el ancho (100 %) | 592&nbsp;px | 1200&nbsp;px de ancho |
| A la mitad del ancho (50 %) | 296&nbsp;px | 600&nbsp;px de ancho |
| Ancho personalizado (10–100 %) | 592&nbsp;px × tu % | El doble de ese ancho |

## Galerías de imágenes

No existe un bloque de galería aparte. Arma una galería con una tabla (hasta 6 columnas y 12 filas) y coloca una imagen en cada celda.

| Columnas iguales | Cada imagen se muestra a | Sube al menos |
| --- | --- | --- |
| 2 columnas | 272&nbsp;px | 550&nbsp;px de ancho |
| 3 columnas | Unos 173&nbsp;px | 350&nbsp;px de ancho |
| 4 columnas | 124&nbsp;px | 250&nbsp;px de ancho |

- Usa la misma proporción para todas las imágenes de una fila, por ejemplo todas cuadradas o todas 4:5. Cada celda respeta la proporción de su imagen, así que mezclar formas produce filas desparejas.
- Las tablas mantienen sus columnas en el teléfono, por lo que las imágenes de galerías de 3 o 4 columnas se ven pequeñas en móvil.

## Bloques de productos

Las imágenes de productos vienen del catálogo de tu tienda conectada, así que su tamaño se ajusta en el catálogo, no en el email. El email muestra cada imagen de producto con el ancho indicado abajo y conserva su proporción.

| Bloque de productos | Se muestra a | Sube al menos |
| --- | --- | --- |
| Cuadrícula, estilo por defecto | 276&nbsp;px | 600 × 600&nbsp;px |
| Cuadrícula, tamaño personalizado | 48–160&nbsp;px | El doble del tamaño elegido |
| Lista, miniatura por defecto | 88&nbsp;px | 176&nbsp;px |
| Lista, miniatura más grande | 160&nbsp;px | 320 × 320&nbsp;px |

- **Cuadrícula** muestra los productos en dos columnas, que se apilan en el teléfono. Cada imagen ocupa el ancho de su tarjeta, salvo que configures un tamaño de imagen menor en el estilo de la tarjeta.
- **Lista** muestra una miniatura junto a los datos del producto.
- Las fotos cuadradas de 600 × 600 px o más funcionan en ambos diseños. Mantén la misma proporción en todo el catálogo para que las filas de la cuadrícula queden alineadas.
- Centra el producto con márgenes parejos y usa un fondo liso o blanco. Las tarjetas pueden redondear las esquinas de la imagen hasta 40 px, así que evita detalles justo en los bordes.

## Logo

El logo del tema se muestra con hasta 200 px de ancho y 80 px de alto. Sube un PNG con fondo transparente al doble de esa medida, hasta 400 × 160 px. Un logo horizontal, por ejemplo de 400 × 100 px, es el que mejor encaja.

## Requisitos del archivo

- **Formatos:** PNG, JPG, GIF o WebP.
- **Tamaño:** hasta 5 MB por imagen. Intenta que pesen menos de 300 KB para que el email abra rápido.

## Si cambias el ancho del email

El ancho del email se puede configurar entre 320 y 1200 px en el tema. Vuelve a calcular con el nuevo ancho:

- El área de contenido es el ancho del email menos 48 px.
- Una imagen a todo el ancho mide lo mismo que el área de contenido.
- Una imagen de producto en cuadrícula mide la mitad del área de contenido menos 20 px. Por ejemplo, 256 px en un email de 600 px y 356 px en uno de 800 px.

Después, sube la imagen al doble del ancho mostrado.

## Guías relacionadas

- [Crea una campaña]({% link _campaigns/creating-a-campaign.md %})
- [Buenas prácticas para campañas]({% link _campaigns/campaign-best-practices.md %})
- [Popup de Sitio Web]({% link _captures/website-popup.md %})
