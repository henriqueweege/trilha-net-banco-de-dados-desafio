/*
Query 1
Buscar o nome e ano dos filmes
*/
SELECT
	Nome, Ano 
FROM
	Filmes


/*
Query 2
Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
*/
SELECT 
	Nome, Ano, Duracao
FROM
	Filmes
ORDER BY 
	Ano
ASC


/*
Query 3
Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
*/
SELECT 
	Nome, Ano, Duracao
FROM
	Filmes
WHERE
	Nome = 'De Volta para o Futuro'


/*
Query 4
Buscar os filmes lançados em 1997
*/
SELECT 
	Nome, Ano, Duracao
FROM
	Filmes
WHERE
	Ano = 1997


/*
Query 5
Buscar os filmes lançados APÓS o ano 2000
*/
SELECT
	Nome, Ano, Duracao
FROM
	Filmes
WHERE
	Ano > 2000


/*
Query 6
Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
*/
SELECT 
	Nome, Ano, Duracao
FROM
	Filmes
WHERE
	Duracao > 100 AND Duracao < 150
ORDER BY
	Duracao
ASC


/*
Query 7 
Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
*/
SELECT
	Ano,
	COUNT(*) as Quantidade
FROM
	Filmes
GROUP BY
	Ano
ORDER BY
	AVG(Duracao) DESC
-- Embora o enunciado peça para ordenar pela duração, o resultado da imagem parece ser ordenado pela quantidade, segue a query para este caso.
SELECT
	Ano,
	COUNT(*) as Quantidade
FROM
	Filmes
GROUP BY
	Ano
ORDER BY
	Quantidade DESC

/*
Query 8
Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
*/
SELECT TOP(15)
	Id,
	PrimeiroNome,
	UltimoNome,
	Genero
FROM
	Atores
WHERE
	Genero = 'M'


/*
Query 9
Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
*/
SELECT 
	Id,
	PrimeiroNome,
	UltimoNome,
	Genero
FROM
	Atores
WHERE
	Genero = 'F'
ORDER BY
	PrimeiroNome


/*
Query 9
Buscar o nome do filme e o gênero
*/
SELECT 
	Filmes.Nome,
	Generos.Genero
FROM
	Filmes
INNER JOIN FilmesGenero
	ON FilmesGenero.IdFilme = Filmes.Id 
INNER JOIN Generos 
	ON Generos.Id = FilmesGenero.IdGenero 


/*
Query 11  
Buscar o nome do filme e o gênero do tipo "Mistério"
*/
SELECT 
	Filmes.Nome,
	Generos.Genero
FROM
	Filmes
INNER JOIN FilmesGenero
	ON FilmesGenero.IdFilme = Filmes.Id 
INNER JOIN Generos 
	ON Generos.Id = FilmesGenero.IdGenero 
WHERE 
	Generos.Genero = 'Mistério'


/*
Query 12  
Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
*/
SELECT 
	Filmes.Nome,
	Atores.PrimeiroNome,
	Atores.UltimoNome,
	ElencoFilme.Papel
FROM
	Filmes
INNER JOIN FilmesGenero
	ON FilmesGenero.IdFilme = Filmes.Id 
INNER JOIN Generos 
	ON Generos.Id = FilmesGenero.IdGenero 
INNER JOIN ElencoFilme
	ON ElencoFilme.IdFilme = Filmes.Id
INNER JOIN Atores
	ON Atores.Id = ElencoFilme.IdAtor
