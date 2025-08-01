# Completa esta información con tus datos personalizados: apiKey, city y folder
$apiKey = "aqui tu api key"
$city = "Aqui+tu+ciudad"
$folder = "C:\Mi carpeta de Salamandra\"

$response = Invoke-RestMethod -Uri "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=en"

# Datos base
$condition = $response.weather[0].main
$tempC = [math]::Round($response.main.temp)
$tempF = [math]::Round(($response.main.temp * 9 / 5) + 32)
$feelsC = [math]::Round($response.main.feels_like)
$feelsF = [math]::Round(($response.main.feels_like * 9 / 5) + 32)
$dewC = 41  # Valor fijo porque OpenWeather no da Dew Point directamente
$dewF = 5   # Puedes calcularlo si lo deseas
$humidity = $response.main.humidity
$wind = $response.wind.speed -replace '\.', ','  # Convertir a coma decimal
$barometer = "$($response.main.pressure) mm and rising"

# Amanecer y atardecer
$sunrise = (Get-Date "1970-01-01").AddSeconds($response.sys.sunrise).ToLocalTime().ToString("HH:mm:ss")
$sunset = (Get-Date "1970-01-01").AddSeconds($response.sys.sunset).ToLocalTime().ToString("HH:mm:ss")

$html = @"
<HTML>
<BR />
Condition: $condition<BR />
Temperature: $tempF&deg;C/$tempC&deg;F<BR />
Feels Like: $feelsF&deg;C/$feelsC&deg;F<BR />
Dew Point: $dewC&deg;C/$dewF&deg;F<BR />
Humidity: $humidity%<BR />
Wind: $wind km/h<BR />Barometer: $barometer<BR />
Sunrise: $sunrise<BR />
Sunset: $sunset<BR />
<BR />
</HTML>
"@

# Guardar HTML
Set-Content -Path $folder"weather.html" -Value $html -Encoding UTF8

# Guardar archivo de texto
$currentWeatherText = "$humidity $tempF"
Set-Content -Path $folder"currentweather.txt" -Value $currentWeatherText -Encoding UTF8

Write-Host "Archivos actualizados: weather.html y currentweather.txt"
Exit
