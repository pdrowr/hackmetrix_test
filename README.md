# Hackmetrix Test

Este proyecto de prueba consiste en elaborar un ABM con Auth hecho en Rails 6, para optar al puesto de Desarrollador Backend en Hackmetrix

### Instalación

Clonar el repositorio desde github:

`git clone https://github.com/pdrowr/hackmetrix_test.git`

Construir la aplicación usando `Docker`:

`docker-compose build`

Levantar la base de datos:

`docker-compose up -d database`

Levantar el servidor:

`docker-compose up`

Visitar: `http://localhost:3000`

### Arquitectura

`ruby: 2.7.1`

`rails: 6.0.3.2`

### Endpoints

```BASE_URL = http://hackmetrix-test.herokuapp.com/api/v1```

##### Registrar un nuevo usuario:


###### URL:
```/auth  #POST```

###### Payload
```
{
    "email": "email@mail.com", # New user's email
    "password": "$#12345678.." # New user's Password
}
```

##### Loguear un usuario existente:

###### URL

```/auth/sign_in  #POST```

###### Payload

```
{
    "email": "email@mail.com", # Existing user's email
    "password": "$#12345678.." # Existing user's password
}
```

##### Crear Tasks: (Autenticación requerida)

###### URL

`/admin/tasks #POST`

###### Payload

```
{
    "task": {
        "title": "Task Title",
        "name": "Task Name",
        "user_id": "1"
    }
}
```

##### Actualizar Tasks: (Autenticación requerida)

###### URL

`/admin/tasks/:task_id #PUT`

###### Payload

```
{
    "task": {
        "title": "Task Title to Update",
        "name": "Task Name to Update"
    }
}
```

##### NOTA: Sólo los usuarios con rol `admin` pueden crear tasks, tomar esto en cuenta a la hora te autenticarse.

##### Ver Tasks asociados a un usuario.

###### URL

`/client/tasks #GET`


### Usuarios para pruebas
La aplicación cuenta con 3 usuarios predefinidos, uno para cada rol (```role_1, role_2, admin```) a continuación se describen las credenciales correspondientes a cada uno de ellos:

##### Usuario con rol: `role_1`

```
id: 1 # to make a relation with Task
email: role_1@default.com
password: #12345#
```

##### Usuario con rol: `role_2`

```
id: 2 # to make a relation with Task
email: role_2@default.com
password: #12345#
```

##### Usuario con rol: `admin`

```
id: 3 # to make a relation with Task
email: admin@default.com
password: #12345#
```

### Loguearse a la aplicación

Para loguearse y poder consumir los endpoints restringidos por autenticación, es necesario seguir los siguientes pasos:


- Hacer request al endpoint de `sign_in` (especificado más arriba) bien con las credenciales de un usuario de los que ya existen en la aplicación, o bien con algún usuario registrado manualmente consumiendo el endpoint `auth`

- Obtener los Headers necesarios para autenticar el usuario, los mismos son devueltos en el endpoint de `sign_in`, los header son:
  - access-token
  - client
  - uid

![Example](https://i.ibb.co/GQpJMDM/image.png)

- Una vez obtenidos los Headers necesarios, estos se deben agregar al siguiente request, de otra manera, estaríamos haciendo el request sin un usuario autenticado.
