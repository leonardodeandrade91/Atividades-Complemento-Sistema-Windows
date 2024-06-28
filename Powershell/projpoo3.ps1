Using Assembly System.Collections

class AcoesVideo {
    [void]play() {
        throw "Implemente o método play!"
    }

    [void]pause() {
        throw "Implemente o método pause!"
    }

    [void]like() {
        throw "Implemente o método like!"
    }
}

class Video : AcoesVideo {
    hidden [string]$titulo
    hidden [int]$avaliacao
    hidden [int]$views
    hidden [int]$curtidas
    hidden [bool]$reproduzindo

    Video([string]$titulo) {
        $this.titulo = $titulo
        $this.avaliacao = 1
        $this.views = 0
        $this.curtidas = 0
        $this.reproduzindo = $false
    }

    [void]play() {
        $this.reproduzindo = $true
    }

    [void]pause() {
        $this.reproduzindo = $false
    }

    [void]like() {
        $this.curtidas++
    }

    [string]toString() {
        return [string]::Format("Vídeo: `nTítulo = {0}`nAvaliação = {1}`nViews = {2}`nCurtidas = {3}`nReproduzindo = {4}", $this.titulo, $this.avaliacao, $this.views, $this.curtidas, $this.reproduzindo)
    }

    [string]getTitulo() {
        return $this.titulo
    }

    [int]getAvaliacao() {
        return $this.avaliacao
    }

    [int]getViews() {
        return $this.views
    }

    [int]getCurtidas() {
        return $this.curtidas
    }

    [bool]getReproduzindo() {
        return $this.reproduzindo
    }

    [void]setTitulo([string]$titulo) {
        $this.titulo = $titulo
    }

    [void]setAvaliacao([int]$avaliacao) {
        $media = [int]($this.avaliacao + $avaliacao) / $this.views
        
        $this.avaliacao = $media
    }

    [void]setViews([int]$views) {
        $this.views = $views
    }

    [void]setCurtidas([int]$curtidas) {
        $this.curtidas = $curtidas
    }

    [void]setReproduzindo([bool]$reproduzindo) {
        $this.reproduzindo = $reproduzindo
    }
}

class Pessoa {
    hidden [string]$nome
    hidden [int]$idade
    hidden [string]$sexo
    hidden [float]$experiencia

    Pessoa([string]$nome, [int]$idade, [string]$sexo) {
        $this.nome = $nome
        $this.idade = $idade
        $this.sexo = $sexo
        $this.experiencia = 0
    }

    [string]toString() {
        return [string]::Format("Pessoa: `nNome = {0}`nIdade = {1}`nSexo = {2}`nExperiência = {3}", $this.nome, $this.idade, $this.sexo, $this.experiencia)
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

    [float]getExperiencia() {
        return $this.experiencia
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
    
    [void]setExperiencia([string]$experiencia) {
        $this.experiencia = $experiencia
    }
}

class Gafanhoto : Pessoa {
    hidden [string]$login
    hidden [int]$totAssistido

    Gafanhoto([string]$nome, [int]$idade, [string]$sexo, [string]$login) : base($nome, $idade, $sexo){
        $this.login = $login
        $this.totAssistido = 0
    }

    [string]toString() {
        return [string]::Format("Gafanhoto: {0}`nLogin = {1}`nTotAssistido = {2}", ([Pessoa]$this).toString(), $this.login, $this.totAssistido)
    }

    [void]assistirMaisUm() {
        $this.totAssistido++
    }

    [string]getLogin() {
        return $this.login
    }

    [int]getTotAssistido() {
        return $this.totAssistido
    }

    [void]setLogin([string]$login) {
        $this.login = $login
    }

    [void]setTotAssistido([int]$totAssistido) {
        $this.totAssistido = $totAssistido
    }
}

class Visualizacao {
    hidden static [string]$nomeCanal = "Videoaulas de Powershell"
    hidden [Gafanhoto]$espectador
    hidden [Video]$filme

    static [void]exibirCanal() {
        Write-Output ([string]::Format("O nome do canal é {0}.", [Visualizacao]::nomeCanal))
    }

    Visualizacao([Gafanhoto]$espectador, [Video]$filme) {
        $this.espectador = $espectador
        $this.filme = $filme
        $this.filme.setViews($this.filme.getViews() + 1)
        $this.espectador.setTotAssistido($this.espectador.getTotAssistido() + 1)
    }

    [void]avaliar() {
        $this.filme.setAvaliacao(5)
    }

    [void]avaliar([int]$nota) {
        $this.filme.setAvaliacao($nota)
    }

    [void]avaliar([float]$porc) {
        $nova = 0

        if($porc -le 20) {
            $nova = 3
        }
        elseif($porc -gt 20 -and $porc -le 50) {
            $nova = 5
        }
        elseif($porc -gt 50 -and $porc -le 90) {
            $nova = 8
        }
        else {
            $nova = 10
        }
        
        $this.filme.setAvaliacao($nova)
    }

    [string]toString() {
        return [string]::Format("Visualizacao: `nNomeCanal = {0}`nEspectador = {1}`nFilme = {2}", [Visualizacao]::nomeCanal, $this.espectador.toString(), $this.filme.ToString())
    }

    static [string]getNomeCanal() {
        return [Visualizacao]::nomeCanal
    }

    [Gafanhoto]getEspectador() {
        return $this.espectador
    }

    [Video]getFilme() {
        return $this.filme
    }

    static [void]setNomeCanal([string]$nomeCanal) {
        [Visualizacao]::nomeCanal = $nomeCanal
    }

    [void]setEspectador([Gafanhoto]$espectador) {
        $this.espectador = $espectador
    }

    [void]setFilme([Video]$filme) {
        $this.filme = $filme
    }
}

$v = [System.Collections.ArrayList]::new()

$v.Add([Video]::new("Aula 1 de POO"))
$v.Add([Video]::new("Aula 12 de Powershell"))
$v.Add([Video]::new("Aula 15 de HTML5"))

Write-Output $v[0].ToString()

$g = [System.Collections.ArrayList]::new()

$g.Add([Gafanhoto]::new("Jubileu", 22, "M", "CorvoJubileu"))
$g.Add([Gafanhoto]::new("Creuza", 12, "F", "Creuzita"))

Write-Output $g[0].ToString()

$vis = [System.Collections.ArrayList]::new()

$vis.Add([Visualizacao]::new($g[0], $v[2]))

Write-Output $vis[0].ToString()

$vis.Add([Visualizacao]::new($g[0], $v[1]))

Write-Output $vis[1].ToString()

$vis[0].avaliar()
$vis[1].avaliar(85.0)

Write-Output $vis[0].toString()
Write-Output $vis[1].toString()