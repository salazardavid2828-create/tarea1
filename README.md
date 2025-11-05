# Flask MySQL App

Pequeña aplicación Flask que guarda nombres de usuarios en una base de datos MySQL.

Requisitos
- Python 3.8+
- Dependencias en `requirements.txt` (Flask, mysql-connector-python, gunicorn)

Instalación
1. Crear y activar un entorno virtual (opcional pero recomendado):

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

2. Instalar dependencias:

```powershell
pip install -r .\requirements.txt
```

Variables de entorno
La aplicación puede leer la cadena de conexión desde `DATABASE_URL` o desde variables individuales.

Opción A — Usar `DATABASE_URL` (formato típico para servicios como Railway):

```
mysql://usuario:clave@host:puerto/base_de_datos
```

En PowerShell (sesión actual):

```powershell
$env:DATABASE_URL='mysql://usuario:clave@host:3306/mi_db'; python .\app.py
```

Opción B — Usar variables `MYSQL_*`:

```powershell
$env:MYSQL_HOST='localhost'; $env:MYSQL_USER='root'; $env:MYSQL_PASSWORD='tu_pass'; $env:MYSQL_DATABASE='mi_db'; $env:MYSQL_PORT='3306'; python .\app.py
```

Crear la base de datos (si no existe)
Si aún no tienes la base de datos, crea una y la tabla `usuarios` con el cliente `mysql` o MySQL Workbench:

```sql
CREATE DATABASE mi_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mi_db;
CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255)
);
```

Cómo funciona la app
- `GET /` — muestra la lista de usuarios y un formulario para agregar uno nuevo.
- `POST /agregar` — inserta el nombre en la tabla `usuarios` y redirige a `/`.
- `GET /db_status` — devuelve JSON con el estado de la conexión.

Notas
- En desarrollo la app crea la tabla `usuarios` si no existe.
- Para despliegue en producción, fija versiones en `requirements.txt` y no dejes credenciales en texto plano.

Problemas comunes
- Si obtienes errores de conexión, revisa que las variables de entorno estén bien y que el host/puerto sean accesibles desde tu máquina.

Si quieres, puedo:
- Añadir un script `init_db.py` para crear la base y poblarla con datos de ejemplo.
- Fijar versiones en `requirements.txt` usando `pip freeze`.
