# Distribución de Herencias por Niveles de Consanguinidad en Prolog

Este repositorio contiene la implementación de un sistema en Prolog para distribuir una herencia de acuerdo con el grado de parentesco de los herederos. Los personajes y relaciones utilizados están inspirados en la famosa serie **"Game of Thrones"**. (La recomendamos bastante profe ;D)

## Descripción del Problema

Cuando una persona fallece, sus bienes se distribuyen entre los herederos de acuerdo con el nivel de consanguinidad:
- **Nivel 1**: Hijos, padres (30% de la herencia).
- **Nivel 2**: Hermanos, abuelos (20% de la herencia).
- **Nivel 3**: Tíos, primos (10% de la herencia).

**Restricción**: Si la herencia total supera el 100%, los porcentajes se ajustarán proporcionalmente para no exceder ese límite.

### Objetivos del Proyecto

1. Implementar un sistema en Prolog para distribuir la herencia según el grado de parentesco.
2. Utilizar las relaciones de parentesco para calcular la participación de cada heredero.
3. Asegurar que la herencia total no supere el 100%.

## Estructura del Código

### Parte 1: Relaciones Familiares

Se definen relaciones familiares básicas utilizando personajes de "Game of Thrones":
- `padre`, `madre` indican las relaciones de paternidad y maternidad.
- `hermano` indica una relación de hermandad.
- `abuelo` y `abuela` indican relaciones de abuelo/a.
- `tio` y `primo` indican relaciones de tío y primo.

### Parte 2: Nivel de Consanguinidad

El predicado `nivel_consanguinidad/3` determina el nivel de parentesco entre dos personas, donde el **Nivel 1** incluye padres, **Nivel 2** incluye hermanos y abuelos, y **Nivel 3** incluye tíos y primos.

### Parte 3: Distribución de la Herencia

El predicado `distribuir_herencia/2` distribuye la herencia entre los herederos según el nivel de parentesco y ajusta los porcentajes si la suma excede el 100%.

### Parte 4: Casos de Prueba

Se proporcionan tres casos de prueba:

1. **Caso 1**: Una herencia de $100,000 distribuida entre dos hijos, un hermano y un primo.
2. **Caso 2**: Una herencia de $250,000 distribuida entre un hijo, dos abuelos y tres tíos.
3. **Caso 3**: Una herencia de $150,000 distribuida entre una hija, dos hermanos y dos primos.

## Instalación y Uso

1. Clona el repositorio en tu máquina local.
   ```sh
   git clone https://github.com/tu-usuario/distribucion-herencia-prolog.git
Abre el archivo en tu entorno Prolog favorito, como SWI-Prolog.
Carga el archivo en Prolog.
prolog
Copiar código
?- [distribucion_herencia].
Ejecuta los casos de prueba utilizando el siguiente formato:
?- distribuir_herencia(100000, Distribucion).
La variable Distribucion te dará la repartición correspondiente.

## Ejemplos de Salida

1. **Caso 1**:
?- distribuir_herencia(100000, Distribucion).
Distribucion = [(30, 30000), (30, 30000), (20, 20000), (10, 10000)].
Dos hijos reciben $30,000 cada uno, el hermano recibe $20,000 y el primo $10,000.

2. **Caso 2**:
?- distribuir_herencia(250000, Distribucion).
Distribucion = [(30, 75000), (20, 50000), (20, 50000), (10, 25000), (10, 25000), (10, 25000)].
El hijo recibe $75,000, cada abuelo recibe $50,000, y cada tío recibe $25,000.

 3. **Caso 3**:
?- distribuir_herencia(150000, Distribucion).
Distribucion = [(30, 45000), (20, 30000), (20, 30000), (10, 15000), (10, 15000)].
La hija recibe $45,000, cada hermano recibe $30,000 y cada primo $15,000.

## Requerimientos
SWI-Prolog o cualquier otro intérprete de Prolog compatible.

## Autores
Este proyecto fue realizado por:

Samuel Arango Echeverri e
Isabella Hernández Posada
