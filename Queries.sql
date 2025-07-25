-- 1 - Buscar o nome e ano dos filmes
SELECT	Nome
,		Ano
	FROM Filmes

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT	Nome
,		Ano
	FROM Filmes
		ORDER BY ANO

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a dura��o
SELECT	Nome
,		Ano
,		Duracao
	FROM Filmes
		Where Nome Like '%de volta para o futuro%'

-- 4 - Buscar os filmes lan�ados em 1997
SELECT	Nome
,		Ano
,		Duracao
	FROM Filmes
		Where Ano = 1997

-- 5 - Buscar os filmes lan�ados AP�S o ano 2000
SELECT	Nome
,		Ano
,		Duracao
	FROM Filmes
		Where Ano > 2000

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT	Nome
,		Ano
,		Duracao
	FROM Filmes
		WHERE Duracao BETWEEN 101 AND 149
			ORDER BY Duracao

-- 7 - Buscar a quantidade de filmes lan�adas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT	Ano
,		COUNT(0) AS Quantidade
	FROM Filmes
		GROUP BY Ano
			ORDER BY SUM(Duracao) DESC

-- 8 - Buscar os Atores do g�nero masculino, retornando o PrimeiroNome, UltimoNome
Select	Id
,		PrimeiroNome
,		UltimoNome
,		Genero
	FROM Atores
		WHERE Genero = 'M'

-- 9 - Buscar os Atores do g�nero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
Select	Id
,		PrimeiroNome
,		UltimoNome
,		Genero
	FROM Atores
		WHERE Genero = 'F'
			ORDER BY PrimeiroNome

-- 10 - Buscar o nome do filme e o g�nero
SELECT	F.Nome
,		G.Genero
	FROM Filmes F
		INNER JOIN FilmesGenero FG ON
			FG.IdFilme = F.Id
		INNER JOIN Generos G ON
			G.Id = FG.IdGenero

-- 11 - Buscar o nome do filme e o g�nero do tipo "Mist�rio"
SELECT	F.Nome
,		G.Genero
	FROM Filmes F
		INNER JOIN FilmesGenero FG ON
			FG.IdFilme = F.Id
		INNER JOIN Generos G ON
			G.Id = FG.IdGenero
				WHERE G.Genero Like '%Mist�rio%'

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT	F.Nome
,		A.PrimeiroNome
,		A.UltimoNome
,		EF.Papel
	FROM Filmes F
		INNER JOIN ElencoFilme EF ON
			F.Id = EF.IdFilme
		INNER JOIN Atores A ON
			A.id = EF.IdAtor
				ORDER BY F.Nome
