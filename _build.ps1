# Genera app-ios\index.html a partir de ..\Entreno.html anadiendo lo necesario para iOS.
# Ejecutar desde cualquier sitio:  powershell -File "C:\Users\borjao\Desktop\Entreno\app-ios\_build.ps1"
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$src  = Join-Path $root 'Entreno.html'
$dst  = Join-Path $PSScriptRoot 'index.html'
$enc  = [Text.UTF8Encoding]::new($false)

$t = [IO.File]::ReadAllText($src, $enc)

$headAdd = @'
<link rel="manifest" href="manifest.webmanifest">
<link rel="apple-touch-icon" sizes="180x180" href="icon-180.png">
<link rel="icon" type="image/png" sizes="192x192" href="icon-192.png">
<meta name="apple-mobile-web-app-title" content="Entreno">
<meta name="format-detection" content="telephone=no">
'@

$swReg = @'

/* ---- instalacion como app (PWA) ---- */
if('serviceWorker' in navigator){
  window.addEventListener('load',function(){
    navigator.serviceWorker.register('sw.js').catch(function(){});
  });
}
if(navigator.storage&&navigator.storage.persist) navigator.storage.persist().catch(function(){});
'@

if ($t -notmatch 'manifest\.webmanifest') {
  $t = $t -replace '(?s)(<title>.*?</title>)', ('$1' + "`n" + $headAdd)
}
if ($t -notmatch 'serviceWorker') {
  $t = $t -replace '(?s)(load\(\); render\(\);)', ($swReg + "`n" + '$1')
}

[IO.File]::WriteAllText($dst, $t, $enc)
Write-Host ("index.html generado: {0:N0} bytes" -f (Get-Item $dst).Length)
