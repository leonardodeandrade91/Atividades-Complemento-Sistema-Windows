class Ventilador {
    hidden static [bool]$ligado = $false
    hidden static [int]$velocidade = 0

    static [void]ligar([int]$vel) {
        [Ventilador]::ligado = $true

        if($vel -lt 1) {
            $vel = 1
        }
        elseif($vel -gt 3) {
            $vel = 3
        }

        [Ventilador]::velocidade = $vel

        Write-Host ([string]::Format("O ventilador está ligado, na velocidade de {0}.", [Ventilador]::velocidade))
    }

    static [void]desligar() {
        [Ventilador]::velocidade = 0
        [Ventilador]::ligado = $false

        Write-Host "O ventilador está desligado!"
    }

    static [bool]getLigado() {
        return [Ventilador]::ligado
    }

    static [int]getVelocidade() {
        return [Ventilador]::velocidade
    }

    static [void]setLigado([bool]$ligado) {
        [Ventilador]::ligado = $ligado
    }

    static [void]setVelocidade([int]$velocidade) {
        [Ventilador]::velocidade = $velocidade
    }
}

[Ventilador]::ligar(3)
[Ventilador]::ligar(2)
[Ventilador]::desligar()

Write-Host ([Ventilador]::getLigado())