class Pilha {
    hidden [string]$marca
    hidden [int]$carga

    Pilha([string]$marca) {
        $this.marca = $marca
        $this.carga = 100
    }

    [void]apresentacao() {
        Write-Host ([string]::Format("A marca da pilha é {0}!", $this.marca))
        Write-Host ([string]::Format("A carga da pilha é {0}%!", $this.carga))
    }

    [string]getMarca() {
        return $this.marca
    }

    [int]getCarga() {
        return $this.carga
    }

    [void]setMarca([string]$marca) {
        $this.marca = $marca
    }

    [void]setCarga([float]$carga) {
        $this.carga = $carga
    }
}

class Aparelho {
    hidden[Pilha]$pl

    Aparelho([Pilha]$pl) {
        $this.pl = $pl
    }

    [void]ligado() {
        if($this.pl.getCarga() -gt 0) {
            Write-Host ([string]::Format("O aparelho está ligado e a carga da pilha é de {0}%!", $this.pl.getCarga()))
        }
        else {
            Write-Host "A pilha do aparelho está sem carga!"
        }
    }

    [Pilha]getPl() {
        return $this.pl
    }

    [void]setPl([Pilha]$pl) {
        $this.pl = $pl
    }
}

$ray = [Pilha]::new("Rayovac")

$ray.apresentacao()

$controle = [Aparelho]::new($ray)

$controle.ligado()

Write-Host ([string]::Format("A carga da pilha é de {0}%!", $controle.getPl().getCarga()))