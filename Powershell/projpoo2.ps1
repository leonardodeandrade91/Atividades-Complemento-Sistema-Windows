Using Assembly System.Collections

class Publicacao {
    [void]detalhes() {
        throw "Implemente o método detalhes!"
    }

    [void]abrir() {
        throw "Implemente o método detalhes!"
    }

    [void]fechar() {
        throw "Implemente o método detalhes!"
    }

    [void]folhear([int]$p) {
        throw "Implemente o método detalhes!"
    }

    [void]avancarPag() {
        throw "Implemente o método detalhes!"
    }

    [void]voltarPag() {
        throw "Implemente o método detalhes!"
    }
}

class Pessoa {
    hidden [string]$nome
    hidden [int]$idade
    hidden [string]$sexo

    [void]fazerAniver() {
        $this.idade++
    }

    Pessoa([string]$nome, [int]$idade, [string]$sexo) {
        $this.nome = $nome
        $this.idade = $idade
        $this.sexo = $sexo
    }

    [string]getNome() {
        return $this.nome
    }

    [int]getIdade() {
        return $this.idade
    }

    [string]getSexo() {
        return $this.sexo
    }

    [void]setNome([string]$nome) {
        $this.nome = $nome
    }

    [void]setIdade([int]$idade) {
        $this.idade = $idade
    }

    [void]setSexo([string]$sexo) {
        $this.sexo = $sexo
    }
}

class Livro : Publicacao {
    hidden [string]$titulo
    hidden [string]$autor
    hidden [int]$totPaginas
    hidden [int]$pagAtual
    hidden [bool]$aberto
    hidden [Pessoa]$leitor
    hidden static [string]$idioma = "Português"

    static [void]verIdioma() {
        Write-Host ([string]::Format("O idioma do livro é {0}.", [Livro]::idioma))
    }
    
    [void]detalhes() {
        Write-Host ([string]::Format("Livro {0} escrito por {1}.", $this.titulo, $this.autor))

        if($this.aberto) {
            Write-Host "O livro está aberto!"
            Write-Host ([string]::Format("Páginas: {0}, página atual {1}.", $this.totPaginas, $this.pagAtual))
            Write-Host ([string]::Format("Sendo lido por {0}.", $this.leitor.getNome()))
            Write-Host ([string]::Format("De idade de {0}.", $this.leitor.getIdade()))
            Write-Host ([string]::Format("E de sexo {0}.", $this.leitor.getSexo()))
        }
        else {
            Write-Host "O livro está fechado no momento!"
        }
    }

    [void]abrir() {
        $this.aberto = $true
    }

    [void]fechar() {
        $this.aberto = $false
    }

    [void]folhear([int]$p) {
        if($this.getAberto()) {
            if($p -gt $this.totPaginas) {
                $this.setPagAtual($this.getTotPaginas())
            }
            elseif($p -lt 0) {
                $this.setPagAtual(0)
            }
            else {
                $this.pagAtual = $p
            }
        }
    }

    [void]avancarPag() {
        if($this.getAberto()) {
            if($this.getPagAtual() -lt $this.getTotPaginas()) {
                $this.setPagAtual($this.getPagAtual() + 1)
            }
        }
    }

    [void]voltarPag() {
        if($this.getAberto()) {
            if($this.getPagAtual() -gt 0) {
                $this.setPagAtual($this.getPagAtual() - 1)
            }
        }
    }

    Livro([string]$titulo, [string]$autor, [int]$totPaginas, [Pessoa]$leitor) {
        $this.titulo = $titulo
        $this.autor = $autor
        $this.totPaginas = $totPaginas
        $this.leitor = $leitor
        $this.pagAtual = 0
        $this.aberto = $false
    }

    [string]getTitulo() {
        return $this.titulo
    }

    [string]getAutor() {
        return $this.autor
    }

    [int]getTotPaginas() {
        return $this.totPaginas
    }

    [int]getPagAtual() {
        return $this.pagAtual
    }

    [bool]getAberto() {
        return $this.aberto
    }

    [Pessoa]getLeitor() {
        return $this.leitor
    }

    static [string]getIdioma() {
        return [Livro]::idioma
    }

    [void]setTitulo([string]$titulo) {
        $this.titulo = $titulo
    }

    [void]setAutor([string]$autor) {
        $this.autor = $autor
    }

    [void]setTotPaginas([int]$totPaginas) {
        $this.totPaginas = $totPaginas
    }

    [void]setPagAtual([int]$pagAtual) {
        $this.pagAtual = $pagAtual
    }

    [void]setAberto([bool]$aberto) {
        $this.aberto = $aberto
    }

    [void]setLeitor([Pessoa]$leitor) {
        $this.leitor = $leitor
    }

    static [void]setIdioma([string]$idioma) {
        [Livro]::idioma = $idioma
    }
}

$p = [System.Collections.ArrayList]::new()
$l = [System.Collections.ArrayList]::new()

[Livro]::verIdioma()

$p.AddRange((
[Pessoa]::new("Sérgio", 22, "M"),
[Pessoa]::new("Maria", 31, "F")
))

$l.AddRange((
[Livro]::new("Powershell Básico", "José da Silva", 300, $p[0]),
[Livro]::new("POO com Powershell", "Maria de Souza", 500, $p[0]),
[Livro]::new("Powershell Avançado", "Ana Paula", 800, $p[1])
))

$l[2].abrir()
$l[2].folhear(305)
$l[2].avancarPag()
$l[2].detalhes()