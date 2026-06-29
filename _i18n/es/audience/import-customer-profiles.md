Importa perfiles de cliente cuando necesitas llevar datos existentes de clientes a Hellotext antes de lanzar audiencias, campañas, playbooks, rutas o flujos del Inbox.

Los datos importados pueden hacer que Hellotext sea útil más rápido, pero también necesitan revisión. Un archivo o integración puede crear perfiles, actualizar propiedades del perfil, organizar clientes en listas y marcar perfiles como suscritos cuando confirmas que tienen consentimiento.

Esta es una guía de producto para operar Hellotext. No reemplaza una revisión legal o de cumplimiento para los países y canales que usas.

## Elige el camino correcto

Usa una **importación desde un servicio** cuando los datos de tus clientes ya viven en una integración de comercio o servicio compatible, como Shopify, Wix, WooCommerce, VTEX o Mercado Libre.

Usa una **importación desde archivo** cuando tienes datos de clientes en una planilla, exportación de CRM u otra fuente que puedas guardar como CSV o TXT.

Si la fuente de datos sigue conectada y debería actualizarse con el tiempo, prefiere una integración. Si la importación es una migración o limpieza puntual, un archivo puede ser suficiente.

## Prepara el archivo

Para importaciones desde archivo:

- Usa un archivo CSV o TXT.
- Mantén un perfil de cliente por fila.
- Usa la primera fila como encabezados claros, por ejemplo `first_name`, `last_name`, `phone`, `email`, `birthday`, `city`, `loyalty_tier` o `consent_source`.
- Incluye al menos un identificador confiable cuando sea posible, como teléfono o email.
- Usa formatos consistentes para fechas, teléfonos, dinero y valores booleanos.
- Quita filas de prueba, internas, inválidas, dadas de baja o duplicadas antes de importar cuando puedas.
- Guarda la fuente de consentimiento, fuente de importación o fecha de importación como propiedades del perfil si tu equipo necesitará ese contexto después.

Si el archivo mezcla clientes que dieron consentimiento con clientes cuyo consentimiento es desconocido, separa el archivo antes de importar. Es más seguro importar perfiles inciertos como no confirmados que marcar todo el archivo como suscrito.

## Sube el archivo

Desde **Audiencia**, inicia una importación de clientes y elige si quieres importar desde un servicio conectado o subir un archivo.

Cuando subes un archivo, Hellotext acepta archivos CSV y TXT. Si la primera fila contiene nombres de columnas, deja activa la opción de usar la primera fila como encabezados para que el mapeo sea más claro.

Si Hellotext no puede leer el archivo, revisa:

- Tipo de archivo no compatible.
- Archivo vacío.
- Encabezados faltantes.
- Problemas de codificación. Guardar el archivo como UTF-8 suele ayudar.
- Problemas de formato, como comillas sin cerrar.
- Tabulaciones en lugar de un archivo separado por comas o punto y coma.
- Archivos más grandes que el límite de carga.

## Mapea columnas a propiedades del perfil

Después de subir el archivo, revisa cada columna y elige qué propiedad del perfil de cliente debería actualizar.

Mapea solo las columnas que quieres que Hellotext importe. Las columnas sin mapear se omiten.

Mapeos comunes incluyen:

- Nombre completo, nombre o apellido.
- Teléfono.
- Email.
- Cumpleaños u otra fecha.
- Empresa, ciudad, nivel de fidelidad, categoría preferida, idioma o cualquier propiedad personalizada que uses para segmentación y personalización.
- Tags o etiquetas si tu cuenta las usa como propiedades del perfil.

Cada propiedad del perfil solo puede mapearse una vez en la misma importación. Si dos columnas apuntan a la misma propiedad, elige la columna más limpia o combina los datos antes de importar.

Para columnas de fecha, teléfono local o dinero, revisa el formato, país o moneda adicional antes de continuar.

## Confirma consentimiento

Hellotext pregunta si los clientes importados dieron consentimiento para promociones de marketing.

Elige **suscrito** solo cuando los perfiles importados tienen consentimiento claro para el canal que vas a usar. Si el archivo contiene consentimiento mezclado o incierto, importa esos perfiles como no confirmados o separa el archivo en importaciones distintas.

Antes de enviar a perfiles importados, confirma:

- A qué canal aplica el consentimiento.
- De dónde viene el consentimiento.
- Si los perfiles dados de baja fueron excluidos o mapeados correctamente.
- Si el remitente, cuenta de WhatsApp o canal está listo.
- Si el primer envío debería ir a una audiencia de prueba más pequeña.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Organiza los perfiles importados

Al final de la importación, puedes agregar los perfiles de cliente importados a una o más listas.

Usa una lista cuando quieres un grupo fijo para revisión, QA, una primera campaña o un playbook de seguimiento. Por ejemplo, crea una lista llamada `Import Shopify - junio 2026` o `Import VIP para revisar` para que tu equipo pueda encontrar esos perfiles después.

También puedes elegir si la importación debe actualizar propiedades existentes del perfil con los datos nuevos.

- Déjalo desactivado cuando el archivo importado pueda estar incompleto o sea más viejo que los datos que ya existen en Hellotext.
- Actívalo cuando el archivo importado sea la fuente de verdad y deba reemplazar valores existentes.

## Después de iniciar la importación

Las importaciones corren en segundo plano. No necesitas dejar abierta la página de importación.

Cuando termine la importación, revisa:

- Cuántos perfiles de cliente fueron importados.
- Si alguna fila tuvo errores.
- Si los perfiles quedaron en las listas esperadas.
- Si teléfonos, emails, fechas y propiedades personalizadas se ven correctas.
- Si los segmentos que dependen de las propiedades importadas se actualizaron como esperabas.
- Si algunos perfiles de prueba pueden usarse de forma segura en una campaña, playbook o ruta.

Puede haber errores cuando un valor es inválido, falta, está duplicado o está asignado a otro perfil de cliente. Corrige el archivo fuente y vuelve a importar las filas corregidas si hace falta.

## Usa perfiles importados con cuidado

Antes de usar perfiles importados en un lanzamiento:

- Abre algunos perfiles importados y confirma que los datos se ven correctos.
- Revisa que el estado de suscripción coincida con tu decisión de consentimiento.
- Crea una lista o segmento pequeño de prueba antes de enviar masivamente.
- Prueba las etiquetas de personalización contra las propiedades importadas.
- Confirma que el playbook, ruta, campaña o flujo del Inbox esperado usa los datos importados correctamente.

Si estás importando solo para enriquecer perfiles, no envíes inmediatamente. Primero verifica que los datos importados mejoran segmentación, personalización, ruteo o reportes.

## Guías relacionadas

- [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
- [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
- [Listas vs. segmentos]({% link _audience/lists-and-segments.md %})
- [Crea y gestiona listas]({% link _audience/lists.md %})
- [Crea segmentos]({% link _audience/segments.md %})
- [Etiquetas de personalización]({% link _audience/personalization-tags.md %})
- [Verifica tus datos y señales después de configurar]({% link _integrations/verify-data-and-signals.md %})
