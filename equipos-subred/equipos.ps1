# Comprobar equipos existentes en la subred
<# Indicar a continuación el nombre de la red
    Solo admite bloques de direcciones /8 /16 /24
#>
$bloque="192.168.1." #Indicar el nombre poniendo punto al final
[int]$eq="0"
Function EquiposSubred($bloque){
    while ($eq -le 256){
        $ip=$bloque+$eq
        $response=Test-Connection $ip -Count 1 -Quiet
        if ($response -eq "true"){
            Write-Host "$ip SE ENCUENTRA CONECTADO"
        }
        else {
            Write-Host "$ip NO SE ENCUENTRA CONECTADO"
        }
        $eq = $eq + 1
    }
}

Clear-Host
Write-Host "Comprobando las direcciones conectadas a la red..."
Write-Host "Bloque de direcciones: $bloque"
EquiposSubred $bloque