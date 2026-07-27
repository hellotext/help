- **[Qué medimos cada mes](#qué-medimos-cada-mes)**
- **[Componentes de facturación](#componentes-de-facturación)**
- **[Fórmula de facturación](#fórmula-de-facturación)**
- **[Ejemplos de cálculo](#ejemplos-de-cálculo)**
- **[Cómo leer tu factura](#cómo-leer-tu-factura)**
- **[Preguntas frecuentes](#preguntas-frecuentes)**

## Qué medimos cada mes

Aplicamos una regla única: pagas solo el monto mayor entre estos cuatro conceptos del mes (no se suman):

1. **Piso del plan**
2. **Tarifa por performance** (**2–5 %**) sobre ingresos atribuidos
3. **Costo de SMS** (según país/plan)
4. **Tarifa variable por mensajes** (**US $ 2/1.000**) — solo si es mayor a los tres anteriores

## Componentes de facturación

### 1) Tarifa por performance (2–5 %)

% aplicado a ingresos atribuidos a mensajes, campañas, playbooks, rutas o interacciones elegibles de Hellotext. Escalas por plan: **5 %** (Starter), **4 %** desde **US$ 2.000** (Small), **3 %** desde **US$ 10.000** (Grow), **2,5 %** desde **US$ 30.000** (Pro) y **2 %** desde **US$ 100.000** (Enterprise).

> **Atribución:** Hellotext evalúa evidencia de origen elegible y precedencia de fuentes. Las ventanas por defecto son de 24 horas para una entrega elegible u otra evidencia pasiva, y de siete días desde un clic o interacción elegible. La configuración de la cuenta puede ser diferente. Consulta [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}).

### 2) Mensajes multicanal con IA (fair‑use)

Incluidos sin costo cuando **piso**, **% performance** o **SMS** son mayores que la tarifa variable. Si todos son menores, se aplica US $ 2 por cada 1.000 mensajes. Nunca se cobran ambos: se factura el mayor. 

### 3) SMS por país

Costos por mensaje en moneda local; participan de la regla “pagas solo el mayor”. Ver tabla en [Explicación de tarifas](https://www.hellotext.com/precios#sms) para valores vigentes. 

### 4) Piso del plan

Mínimo mensual del plan. Si el resto de los conceptos es menor, pagas el piso; si alguno es mayor, pagas ese. 

## Fórmula de facturación

_Cargo Hellotext del mes = máx { Piso del plan, Tarifa por performance, 
Costo de SMS, Tarifa variable (US$ 2/1.000) }_

<div class="note">
<strong>Nota:</strong> la tarifa variable solo aplica si es la mayor del mes; no se suma a ningún otro concepto. 
</div>

## Ejemplos de cálculo

**Escenario 1: Mes con buen performance (Starter)**

* Ingresos atribuidos: **US$ 2.000** → 5 % = **US$ 100**
* Mensajes multicanal: **10.000** → **US$ 20** (variable)
* SMS: **US$ 0**
* Piso: **US$ 0**
  **Pagas a Hellotext:** **US$ 100** (mayor). **WhatsApp (Meta):** aparte. 

**Escenario 2: Mes de poco performance y alto volumen (Small)**

* % performance: **US$ 30**
* Mensajes multicanal: **50.000** → **US$ 100** (variable)
* SMS: **US$ 0**
* Piso Small: **US$ 74**
  **Pagas a Hellotext:** **US$ 100** (la variable es la mayor).

**Escenario 3: SMS domina**

* % performance: **US$ 60**
* Mensajes multicanal: **40.000** → **US$ 80** (variable)
* **SMS: US$ 150**
* Piso Small: **US$ 74**
  **Pagas a Hellotext:** **US$ 150** (SMS). *Variable no aplica.* 

**Escenario 4: Piso domina**

* % performance: **US$ 0**
* Mensajes multicanal: **10.000** → **US$ 20** (variable)
* SMS: **US$ 0**
* **Piso Small: US$ 74**
  **Pagas a Hellotext:** **US$ 74** (piso). *Variable no aplica.* 

## Cómo leer tu factura

* **Concepto cobrado:** verás uno de los cuatro (piso / performance / SMS / tarifa variable).
* **WhatsApp (Meta):** figura en tu factura de Meta, no en la de Hellotext.
* **Detalle de volumen:** el panel de actividad muestra mensajes enviados e ingresos atribuidos del período. 

## Preguntas frecuentes

**¿Qué son las ventas atribuidas a Hellotext?**

Son las ventas que cumplen la metodología de atribución publicada de Hellotext. La decisión usa evidencia elegible, precedencia de fuentes, identidad del cliente y del pedido, y la ventana por defecto aplicable: 24 horas para una entrega elegible o evidencia pasiva, o siete días desde un clic o interacción elegible. Una fuente de marketing externa reconocida tiene precedencia. Consulta [Cómo atribuimos las ventas]({% link _analytics-reporting-attribution/sales-attribution.md %}).

**¿Dónde veo las tarifas de SMS y los países disponibles?**

En la tabla de Tarifas de SMS por país de [Explicación de tarifas](https://www.hellotext.com/precios).

Se cobran en moneda local y entran en la regla del monto mayor. 

**¿Qué incluye cada plan además del precio?**

Miembros, acceso a playbooks, niveles de soporte y historial de actividad, más funciones avanzadas en planes superiores (Grow/Pro/Enterprise).
