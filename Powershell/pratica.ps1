function datas() {
    $d = Get-Date -UFormat "%d"
    $m = Get-Date -UFormat "%m"
    $a = Get-Date -UFormat "%Y"

    $s = Get-Date -UFormat "%w"

    $hora = Get-Date -UFormat "%H:%M:%S"

    $meses = @("Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro")
    $mes = $meses[$m - 1]

    $semana = @("Domingo", "Segunda-Feira", "Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado")
    $sem = $semana[$s]

    Write-Output "Hoje é dia $d de $mes de $a. $sem."
    Write-Output "A hora atual é $hora."
}

function operacoes($n1, $n2) {
    if($n1 -ge $n2) {
        throw "N1 deve ser menor que N2."
    }

    $ale = [Random]::new()
    
    Write-Host ([string]::Concat("O número absoluto de $n1 é ", [Math]::Abs($n1)))
    Write-Host ([string]::Concat("A raiz quadrada de $n1 é ", [Math]::Sqrt($n1)))
    Write-Host ([string]::Concat("A raiz cúbica de $n1 é ", [Math]::Pow($n1, 1 / 3)))
    Write-Host ([string]::Concat("O quadrado de $n1 é ", [Math]::Pow($n1, 2)))
    Write-Host ([string]::Concat("O cubo de $n1 é ", [Math]::Pow($n1, 3)))
    Write-Host ([string]::Concat("$n1 elevado à $n2 é ", [Math]::Pow($n1, $n2)))
    Write-Host ([string]::Concat("O número aleatório entre $n1 e $n2 é ", $ale.Next($n1, $n2 + 1)))
}

function divisao($n1, $n2) {
    if($n2 -eq 0) {
        throw "É impossível dividir por zero!"
    }
    
    return $n1 / $n2
}

function linha() {
    "-" * 100
}

datas

linha

try {
    operacoes 5 10
}
catch [Exception] {
    $_.Exception.Message
}

linha

try {
    divisao 50 0
}
catch [Exception] {
    $_.Exception.Message
}
finally {
    "Operação finalizada!"
}