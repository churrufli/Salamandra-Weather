🌦 Solución alternativa para usar datos meteorológicos en Salamandra
Si Beautiful Weather no te funciona correctamente (como en mi caso), he creado una solución sencilla para Windows: un archivo .bat que ejecuta un script PowerShell (weather.ps1). Este script actualiza el archivo HTML que Salamandra usa para mostrar la temperatura y la humedad.

¿Cómo configurarlo?
Abre el archivo weather.ps1 con el Bloc de notas.

Sustituye:

AQUÍTUAPIKEY por tu API Key de openweathermap.org.

AQUÍTUCIUDAD por el nombre de tu ciudad. Si tu ciudad tiene espacios, usa el símbolo +.
(Ejemplo: New+York en lugar de New York)

FOLDER por tu carpeta donde alojarás estos ficheros

¿Qué hace?
Obtiene los datos actuales del tiempo (temperatura, humedad, etc.).

Actualiza automáticamente el archivo weather.html.

¿Cómo usarlo en Salamandra?
Antes de locutar la temperatura y humedad en una pauta:

Añade un evento de archivo ejecutable en tu programación.

Selecciona el archivo .bat para que se ejecute.
Unos minutos después añade la locución de la temperatura a la pauta o lánzala directamente.
También puedes ejecutar manualmente el archivo .bat cada vez que quieras obtener los datos

¡Y listo! Tendrás siempre los datos del tiempo actualizados justo antes de emitirse.

Saludos ☀️💨
