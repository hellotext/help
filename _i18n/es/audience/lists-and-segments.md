Las listas y los segmentos permiten organizar perfiles de cliente en audiencias. La diferencia es cómo un perfil pasa a formar parte del grupo y cómo cambia esa pertenencia.

Usa una **lista** cuando la pertenencia debe ser explícita y estable. Usa un **segmento** cuando la pertenencia debe seguir condiciones y actualizarse automáticamente a medida que cambian los datos del cliente.

## Comparación rápida

| | Lista | Segmento |
| --- | --- | --- |
| **Pertenencia** | Un perfil se agrega o elimina de forma deliberada. | Un perfil se incluye mientras cumple las condiciones del segmento. |
| **Actualizaciones** | Mediante una acción del equipo, una importación, una integración o un paso de una ruta. | Automáticamente después de que cambian propiedades o actividades relevantes. |
| **Conviene para** | Grupos cuya pertenencia tiene significado por sí misma. | Audiencias definidas por quiénes son los clientes o qué hacen actualmente. |
| **Ejemplos** | Un grupo importado, asistentes a un evento, una audiencia de prueba o perfiles elegidos para revisión. | Compradores recientes, clientes interesados en una categoría o suscriptores de una ubicación determinada. |

## Usa una lista para una pertenencia explícita

Una lista es un grupo fijo de perfiles de cliente. Un perfil permanece en ella hasta que una persona, una importación, una integración o un paso de una ruta lo agrega o elimina.

Las listas son útiles cuando importa la decisión de asignar un perfil al grupo. No están limitadas a audiencias pequeñas.

Elige una lista cuando necesites:

* Mantener unido un grupo después de terminar una importación.
* Conservar una audiencia de control de calidad (QA) o de prueba interna.
* Registrar la participación en un evento, programa, tienda o proceso operativo.
* Revisar un grupo seleccionado deliberadamente antes de usarlo en otra parte.
* Mantener la pertenencia aunque cambien las propiedades o la actividad reciente del cliente.

Por ejemplo, una lista llamada `Clientes VIP importados` conserva el registro de ese grupo. Una definición dinámica como “clientes que gastaron más de $500 en los últimos 90 días” corresponde a un segmento.

Sigue leyendo: [Crea y gestiona listas]({% link _audience/lists.md %}).

## Usa un segmento para una pertenencia basada en reglas

Un segmento es un grupo dinámico construido con condiciones. Hellotext evalúa propiedades del perfil, pertenencia a listas, información de suscripción y actividad rastreada compatible con el creador de segmentos. Luego actualiza la pertenencia a medida que cambian esos datos.

Elige un segmento cuando la pregunta comience con “¿Quiénes actualmente...?” Por ejemplo:

* Clientes que compraron durante un período determinado.
* Suscriptores de un país o ciudad determinados.
* Clientes que vieron o compraron productos de categorías seleccionadas.
* Clientes que no compraron durante un período reciente.
* Clientes que cumplen una combinación de condiciones de perfil y actividad.

El resultado depende de los datos que recibe Hellotext. Si una clasificación de producto puede estar en campos diferentes, como etiquetas, categorías, colecciones o propiedades personalizadas, elige los campos confiables para tu tienda conectada. No asumas que todas las integraciones los organizan de la misma manera.

La pertenencia se actualiza automáticamente, pero los cambios pueden demorar un momento en aparecer mientras Hellotext procesa los datos nuevos y recalcula el segmento.

Sigue leyendo: [Crea segmentos]({% link _audience/segments.md %}).

## Combina listas y segmentos en una audiencia

Cuando una campaña permite seleccionar una audiencia, puedes incluir listas y segmentos y usar otras listas o segmentos como exclusiones.

Por ejemplo, puedes incluir un segmento de compradores recientes y una lista de asistentes a un evento, y luego excluir una lista interna de prueba. Revisa la audiencia resultante antes de enviar, especialmente cuando se superponen varias inclusiones o exclusiones.

Usa una lista cuando quieras conservar un grupo. Usa un segmento cuando quieras que el grupo siga cumpliendo una regla.

## La pertenencia no concede consentimiento

Un perfil puede pertenecer a una lista o un segmento sin estar habilitado para recibir mensajes por todos los canales. Las listas y los segmentos organizan perfiles; no suscriben clientes ni anulan una baja.

Antes de usar una audiencia, confirma:

* Los perfiles pueden recibir mensajes por el canal que usarás.
* Los perfiles dados de baja, inválidos, bloqueados, internos o de prueba están excluidos cuando corresponde.
* Las condiciones dependen de propiedades y actividad presentes y confiables.
* El tamaño de la audiencia y algunos perfiles de muestra coinciden con lo que querías obtener.

Sigue leyendo: [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %}).

## Guías relacionadas

* [Resumen de audiencia y segmentación]({% link _audience/audience-overview.md %})
* [Entiende los perfiles de cliente]({% link _audience/customer-profiles.md %})
* [Crea y gestiona listas]({% link _audience/lists.md %})
* [Crea segmentos]({% link _audience/segments.md %})
* [Importa perfiles de cliente]({% link _audience/import-customer-profiles.md %})
* [A quién puedo escribirle: consentimiento y estado de suscripción]({% link _audience/consent-and-subscriber-status.md %})
