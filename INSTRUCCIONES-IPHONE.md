# Instalar la app en el iPhone

En iOS, Safari no puede abrir archivos locales, y la vista previa de la app Archivos no guarda datos
entre aperturas. La única vía que funciona bien es publicar la carpeta en una dirección web e instalarla
desde Safari como app. Suena a mucho, son 10 minutos una sola vez y después funciona sin cobertura,
con icono propio y a pantalla completa.

**Se publica solo el código de la app. Tus datos (series, peso, medidas) nunca salen del iPhone: viven
en el almacenamiento de Safari, no en internet.**

---

## Paso 1 · Publicar la carpeta en GitHub Pages (una sola vez)

1. Crea una cuenta gratis en <https://github.com> si no la tienes.
2. Arriba a la derecha, **+** → **New repository**.
   - Name: `entreno`
   - Marca **Public** (Pages gratis solo funciona en repositorios públicos).
   - Pulsa **Create repository**.
3. En la página del repositorio: **Add file** → **Upload files**.
4. Arrastra estos **6 archivos** de la carpeta `app-ios` (los archivos sueltos, no la carpeta):
   - `index.html`
   - `sw.js`
   - `manifest.webmanifest`
   - `icon-180.png`
   - `icon-192.png`
   - `icon-512.png`

   El archivo `_build.ps1` no hace falta subirlo, es solo para regenerar `index.html` en el PC.
5. Abajo, **Commit changes**.
6. Pestaña **Settings** → menú izquierdo **Pages**.
   - En *Source* elige **Deploy from a branch**.
   - Branch: **main**, carpeta **/ (root)**. **Save**.
7. Espera 1-2 minutos y recarga. Arriba aparecerá tu dirección:

   `https://TUUSUARIO.github.io/entreno/`

## Paso 2 · Instalarla en el iPhone

1. Abre esa dirección **en Safari** (no en Chrome: en iOS solo Safari instala apps correctamente).
2. Espera a que cargue del todo la primera vez, con datos o WiFi. Ahí se guarda para uso sin conexión.
3. Botón **Compartir** (el cuadrado con la flecha hacia arriba).
4. **Añadir a pantalla de inicio** → **Añadir**.
5. Cierra Safari y abre la app **desde el icono nuevo**.

## Paso 3 · Comprueba que todo está bien (30 segundos)

1. Abre la app desde el icono. Debe verse **a pantalla completa, sin la barra de Safari**. Si sale la barra
   de direcciones, no se instaló bien: repite el paso 2 desde Safari.
2. Ve a **Cuerpo** y escribe tu peso.
3. Cierra la app del todo (desliza hacia arriba en el selector de apps) y vuelve a abrirla desde el icono.
   El peso debe seguir ahí.
4. Pon el iPhone en **modo avión** y abre la app. Debe funcionar igual. Si funciona, ya la tienes offline
   para el gimnasio.

---

## Por qué hay que instalarla y no solo guardar el enlace

Esto es lo más importante de todo el documento. Safari **borra el almacenamiento de las webs que no
visitas en 7 días**. Si te limitas a guardar un marcador, un día abrirás la app y tu historial habrá
desaparecido.

Al añadirla a la pantalla de inicio, iOS la trata como una app instalada y esa limpieza automática **no
se le aplica**. De ahí que el paso 2 no sea opcional.

Aun así, entra en **Perfil → Descargar copia** una vez al mes y guarda ese archivo. Es tu seguro si
borras el icono, cambias de iPhone o restauras el teléfono.

---

## Actualizar la app cuando haya versión nueva

1. En la app: **Perfil → Copiar copia** (o Descargar copia) y guárdala.
2. En GitHub: **Add file → Upload files**, sube el `index.html` nuevo y confirma que **sustituye** al
   anterior (mismo nombre). **Commit changes**.
3. En el iPhone, abre la app con conexión y **ciérrala y ábrela dos veces**. El service worker se
   actualiza en la segunda apertura.
4. Tus datos se conservan, porque la dirección no cambia. Por eso esta vía es mejor que un archivo local:
   al no cambiar nunca la URL, el almacenamiento es siempre el mismo.

Si cambio la app en el PC, regenera `index.html` con:

```
powershell -ExecutionPolicy Bypass -File "C:\Users\borjao\Desktop\Entreno\app-ios\_build.ps1"
```

Ese script coge `..\Entreno.html` y le inyecta lo necesario para iOS, así que solo hay una versión
del código que mantener.

---

## Alternativa sin publicar nada

Si no quieres crear cuenta en GitHub, instala la app **Documents (de Readdle)**, gratuita:

1. Pasa `index.html` al iPhone (AirDrop desde el PC no; usa Telegram, WhatsApp a ti mismo o iCloud Drive).
2. Guárdalo en Documents.
3. Ábrelo dentro de Documents: tiene navegador propio y ejecuta el HTML.

Funciona, pero con dos pegas: no tienes icono en la pantalla de inicio ni pantalla completa, y el
almacenamiento depende de esa app, así que la copia de seguridad mensual pasa a ser obligatoria.
Para uso diario en el gimnasio, la vía de GitHub Pages es bastante mejor.
