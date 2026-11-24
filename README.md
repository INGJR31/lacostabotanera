# La Costa Botanera · Punto de venta

Programa oficial de **La Costa Botanera** (Tonalá, Chiapas · Tel. 966 106 0549).
Soporte técnico: **Ing. Fco Jared Lara Rguez · 918 125 5735**

La app vive en **GitHub Pages** (gratis) y los datos en **Supabase** (plan gratuito).
Se instala como app en tablets, celulares y computadoras, y **sigue funcionando si se va el internet**:
guarda todo en el dispositivo y lo sube solo cuando regresa la conexión.

---

## Qué hay en esta carpeta

| Archivo | Para qué sirve |
|---|---|
| `index.html` | El programa completo. |
| `config.js` | Datos de conexión a Supabase (URL y clave pública). |
| `sw.js` | Permite que la app abra sin internet. |
| `manifest.webmanifest` + `icon-*.png` | Para instalarla como app con el logo. |
| `supabase.js`, `jspdf.umd.min.js`, `qrcode.js` | Librerías incluidas (Supabase, PDF y QR), así no dependen de internet. |
| `schema.sql` | La base de datos: se pega una sola vez en Supabase. |

---

## Paso 1 · Crear el proyecto en Supabase

1. Entra a **supabase.com** y crea una cuenta (puede ser con la cuenta de Google del negocio).
2. **New project** → nombre `la-costa-botanera`, escribe una contraseña para la base de datos (guárdala) y elige la región más cercana.
3. Espera 1 o 2 minutos a que termine de crearse.

## Paso 2 · Crear la base de datos

1. En el menú de la izquierda entra a **SQL Editor** → **New query**.
2. Abre el archivo `schema.sql`, copia **todo** y pégalo.
3. Toca **Run**. Debe decir *Success*.

## Paso 3 · Crear la cuenta del negocio

Esta cuenta es la "llave" de los dispositivos: cada tablet o computadora entra con ella **una sola vez**.
Después, cada persona usa su nombre y PIN dentro del programa.

1. **Authentication → Users → Add user → Create new user**.
2. Escribe un correo (ej. `caja@lacostabotanera.com` o el Gmail del negocio) y una contraseña fuerte. Marca **Auto Confirm User**.
3. Ve a la configuración de **Authentication** (proveedores / *Sign In*) y **desactiva el registro de usuarios nuevos** (*Allow new users to sign up*). Así nadie más puede crear cuentas.

## Paso 4 · Copiar la URL y la clave pública

1. **Project Settings → API** (o *Data API* / *API Keys*).
2. Copia la **Project URL** (ej. `https://abcd1234.supabase.co`).
3. Copia la clave **anon** / **publishable** (la pública).
   ⚠️ **Nunca** uses la clave *service_role* ni la *secret*.
4. Pégalas en `config.js` (o déjalas vacías: el programa te las pedirá en pantalla la primera vez).

## Paso 5 · Publicar en GitHub Pages

1. Entra a **github.com** y crea una cuenta.
2. **New repository** → nombre `la-costa-botanera` → **Public** → *Create repository*.
3. Toca **uploading an existing file**, selecciona **los 14 archivos** y arrástralos a la página. Toca **Commit changes**.
4. Ve a **Settings → Pages** → *Source*: **Deploy from a branch** → Branch **main** y carpeta **/ (root)** → **Save**.
5. En 1 o 2 minutos aparece la dirección, por ejemplo:
   `https://TU-USUARIO.github.io/la-costa-botanera/`

> La página de GitHub es pública, pero los datos **no** están ahí: están en Supabase y solo entran los dispositivos con la cuenta del negocio.

## Paso 6 · Instalar en cada dispositivo

1. Abre la dirección en **Chrome** (Android o computadora) o **Edge**.
2. Si `config.js` está vacío, escribe la URL y la clave pública de Supabase.
3. **Conectar este dispositivo**: entra con el correo y contraseña de la cuenta del negocio (Paso 3).
4. Instala la app: menú de Chrome **⋮ → Instalar app** (o *Agregar a pantalla de inicio*). Queda con el logo como cualquier aplicación.
5. La primera vez en el negocio: crea al **administrador**, luego meseros, cajero, cocina y barra en **Administración → Personal y mesas**. El menú de ejemplo se carga solo.

## Paso 7 · Pasar los datos de la versión anterior (opcional)

1. En la versión anterior: **Soporte → Descargar respaldo** (o *Copiar respaldo*).
2. En la nueva: entra con la llave maestra → **Soporte → Restaurar** → pega el contenido → **Restaurar respaldo**.
   Los PIN se cifran solos la primera vez que alguien entra.

---

## Actualizar el programa

Cuando haya una versión nueva, sube el nuevo `index.html` (y lo que cambie) al repositorio con **Add file → Upload files**.
Los dispositivos la reciben solos; la app avisa *"Hay una versión nueva: recarga la página"*.

## Sin internet

- Si se va el internet, **se sigue trabajando normal**. Arriba aparece en rojo *"Sin internet · N guardados aquí"*.
- Al volver la conexión, todo se sube solo.
- La app abre aunque no haya internet (después de haberla abierto al menos una vez con internet).
- Mientras no haya internet, cada dispositivo trabaja con lo suyo: **cocina y barra reciben los pedidos cuando regresa la conexión**.

## Respaldos

El plan gratuito de Supabase **no hace respaldos automáticos**. El programa guarda respaldos en cada dispositivo
(cada 10 minutos, al cerrar turno y al irse el internet). Además, **una vez por semana** entra a
**Soporte → Descargar respaldo** y guarda el archivo en una memoria USB o en Google Drive.

> Los proyectos gratuitos de Supabase se pausan si pasan **una semana sin uso**. Si el negocio cierra más de 7 días,
> al regresar entra a supabase.com y toca **Restore project**.

## Seguridad

- Solo los dispositivos con la cuenta del negocio pueden leer o escribir datos.
- Los PIN se guardan cifrados. La llave maestra de soporte nunca se guarda tal cual.
- Todo movimiento queda en la bitácora con usuario, hora y motivo; la bitácora no se puede modificar.
- Si se pierde o roban una tablet: en Supabase cambia la contraseña de la cuenta del negocio y vuelve a conectar los dispositivos.

---

Programa oficial La Costa Botanera · Contactar a soporte: Ing. Fco Jared Lara Rguez · 918 125 5735
