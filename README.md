# bienestar_medico_crud
API de gestión de servicios médicos de bienestar virtual

Integración con

 - `CI`
 - `Drone 1.x`
 - `bienestar_medico_crud master/develop`

## Requerimientos
Go version >= 1.9.

## Preparación
Para usar el API, usar el comando:

 - `go get github.com/planesticud/bienestar_medico_crud`

## Ejecución
Definir los valores de las siguientes variables de entorno:

 - `BIENESTAR_MEDICO_HTTP_PORT`: Puerto asignado para la ejecución del API
 - `BIENESTAR_MEDICO_CRUD__PGUSER`: Usuario de la base de datos
 - `BIENESTAR_MEDICO_CRUD__PGPASS`: Clave del usuario para la conexión a la base de datos  
 - `BIENESTAR_MEDICO_CRUD__PGURLS`: Host de conexión
 - `BIENESTAR_MEDICO_CRUD__PGDB`: Nombre de la base de datos
 - `BIENESTAR_MEDICO_CRUD__SCHEMA`: Esquema a utilizar en la base de datos

## Ejemplo
BIENESTAR_MEDICO_HTTP_PORT=9019 BIENESTAR_MEDICO_CRUD__PGUSER=user BIENESTAR_MEDICO_CRUD__PGPASS=password BIENESTAR_MEDICO_CRUD__PGURLS=localhost BIENESTAR_MEDICO_CRUD__PGDB=bd BIENESTAR_MEDICO_CRUD__SCHEMA=schema_new bee run

## Modelo BD
![image](https://github.com/planesticud/bienestar_medico_crud/blob/master/modelo_bienestar_medico_crud.png).
