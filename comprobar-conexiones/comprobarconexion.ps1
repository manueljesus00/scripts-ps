# Comprobar conexión con listado de direcciones IP
# Se pueden indicar registros DNS también
# Indicar a continuación la ruta del listado de direcciones
$direcciones=Get-Content direcciones.txt # Indicar ruta completa
Function Conectividad($direcciones){
    foreach ($ip in $direcciones)
    {
        $respuesta=Test-Connection $ip -Count 1 -Quiet
        if ($respuesta -eq "true"){
        Write-Host "$ip CONEXIÓN ESTABLECIDA"
        }
        else{
        Write-Host "$ip ERROR DE CONEXIÓN"
        }
    }
}

Clear-Host
Write-Host "Comprobando conectividad a los servidores"
Write-Host "Listado de referencia: $direcciones"
Conectividad $direcciones