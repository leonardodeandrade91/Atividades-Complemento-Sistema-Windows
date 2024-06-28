class ContaBanco {
    static [string]$nomeBanco = "Bradesco"
    [int]$numConta
    hidden [string]$tipo
    hidden [string]$dono
    hidden [float]$saldo
    hidden [bool]$status

    static [void]exibirBandeira() {
        Write-Host ([string]::Format("O nome do banco é {0}.", [ContaBanco]::nomeBanco))
    }

    [void]estadoAtual() {
        Write-host "-----------------------------------------------------------------------"
        Write-Host ([string]::Format("Banco: {0}", [ContaBanco]::getNomeBanco()))
        Write-Host ([string]::Format("Conta: {0}", $this.getNumConta()))
        Write-Host ([string]::Format("Tipo: {0}", $this.getTipo()))
        Write-Host ([string]::Format("Dono: {0}", $this.getDono()))
        Write-Host ([string]::Format("Saldo: {0}", $this.getSaldo()))
        Write-Host ([string]::Format("Status: {0}", $this.getStatus()))
    }

    [void]abrirConta([string]$t) {
        $this.setTipo($t)
        $this.setStatus($true)

        if($t.Equals("CC")) {
            $this.setSaldo(50)
        }
        elseif($t.Equals("CP")) {
            $this.setSaldo(150)
        }

        Write-Host "Conta aberta com sucesso!"
    }

    [void]fecharConta() {
        if($this.getSaldo() -gt 0) {
            Write-Host "Conta não pode ser fechada porque ainda tem dinheiro!"
        }
        elseif($this.getSaldo() -lt 0) {
            Write-Host "Conta não pode ser fechada pois tem débito!"
        }
        else {
            $this.setStatus($false)
            Write-Host ([string]::Format("Conta de {0} fechada com sucesso!", $this.getDono()))
        }
    }

    [void]depositar([float]$v) {
        if($this.getStatus()) {
            $this.setSaldo($this.getSaldo() + $v)

            Write-Host ([string]::Format("Depósito de R`${0} realizada na conta de {1}", $v, $this.getDono()))
        }
        else {
            Write-Host "Conta fechada ou inexistente!"
        }
    }
    
    [void]sacar([float]$v) {
        if($this.getStatus()) {
            if($this.getSaldo() -ge $v) {
                $this.setSaldo($this.getSaldo() - $v)

                Write-Host ([string]::Format("Saque de R`${0} realizada na conta de {1}", $v, $this.getDono()))
            }
            else {
                Write-Host "Saldo insuficiente para saque!"
            }
        }
        else {
            Write-Host "Conta fechada! Impossível sacar!"
        }
    }

    [void]pagarMensal() {
        $v = 0

        if($this.getTipo().Equals("CC")) {
            $v = 12
        }
        elseif($this.getTipo().Equals("CP")) {
            $v = 20
        }

        if($this.getStatus()) {
            $this.setSaldo($this.getSaldo() - $v)
            Write-Host ([string]::Format("Mensalidade de R`${0} debitada da conta de {1}.", $v, $this.getDono()))
        }
        else {
            Write-Host "Não podemos cobrar, problemas na conta!"
        }
    }

    Caneta() {
        $this.setSaldo(0)
        $this.setStatus($false)
    }

    static [string]getNomeBanco() {
        return [ContaBanco]::nomeBanco
    }
    [int]getNumConta() {
        return $this.numConta
    }

    [string]getTipo() {
        return $this.tipo
    }

    [string]getDono() {
        return $this.dono
    }

    [float]getSaldo() {
        return $this.saldo
    }

    [bool]getStatus() {
        return $this.status
    }

    static [void]setNomeBanco([string]$nomeBanco) {
        ContaBanco::nomeBanco = $nomeBanco
    }
    [void]setNumConta([int]$numConta) {
        $this.numConta = $numConta
    }

    [void]setTipo([string]$tipo) {
        $this.tipo = $tipo
    }

    [void]setDono([string]$dono) {
        $this.dono = $dono
    }

    [void]setSaldo([float]$saldo) {
        $this.saldo = $saldo
    }

    [void]setStatus([bool]$status) {
        $this.status = $status
    }
}

$p1 = [ContaBanco]::new()
$p2 = [ContaBanco]::new()

Write-Host ([ContaBanco]::nomeBanco)
[ContaBanco]::exibirBandeira()

$p1.abrirConta("CC")
$p1.setNumConta(1111)
$p1.setDono("Jubileu")

$p2.abrirConta("CP")
$p2.setNumConta(2222)
$p2.setDono("Creuza")

$p1.depositar(300)
$p2.depositar(500)

$p2.sacar(100)

$p1.pagarMensal()
$p2.pagarMensal()

$p1.estadoAtual()
$p2.estadoAtual()