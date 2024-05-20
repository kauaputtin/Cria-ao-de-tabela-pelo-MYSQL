#BDEX3
USE bdex3_redesocial;
#1 - QUAIS SÃO OS NOMES E SOBRENOMES DE TODOS OS USUÁRIOS CADASTRADOS?
SELECT NOME_USUARIO,SOBRENOME 
FROM USUARIOS;

#2 - QUANTOS GRUPOS EXISTEM NA REDE SOCIAL?
SELECT COUNT(*) 
FROM GRUPOS;

#3 - QUAL É O NÚMERO MÉDIO DE COMENTÁRIOS POR POSTAGEM?
#CRIANDO UMA TABELA 'VIRTUAL' CONTA_POST E REALIZANDO A MEDIA DA CONSULTA ANTERIOR
SELECT ROUND(AVG(COMENTARIOS_POR_POSTAGEM),1) AS MEDIA
FROM (
	#RECUPERANDO A CONTAGEM DE POSTAGENS POR COMENTÁRIO
    SELECT COUNT(*) AS COMENTARIOS_POR_POSTAGEM
    FROM COMENTARIOS
    GROUP BY POST
) AS CONTA_POST ; #NOME DA MINHA BASE CONSULTADA



#1. Exibir todas as informações da tabela `USUARIOS`.
select *from USUARIOS;

#2. Mostrar os nomes, sobrenomes e e-mails de todos os usuários.
SELECT NAME;

#3. Listar os nomes e descrições de todos os grupos.
SELECT G.NOME_GRUPO, G.DESCRICAO
FROM GRUPOS G
ORDER BY G.NOME_GRUPO;

#4. Exibir os detalhes das postagens: ID da postagem, texto, data e hora, e o nome do usuário que postou.
SELECT P.ID_POST, P.TEXTO, P.DATA_HORA, P.USUARIO
FROM POSTAGENS P;


#5. Listar o nome dos usuários e a quantidade de postagens que cada um fez.
SELECT count(P.ID_POST), U.NOME_USUARIO, U.SOBRENOME
FROM  POSTAGENS P, USUARIOS U
group by u.nome_usuario, u.sobrenome;

#6. Mostrar os nomes dos usuários que fizeram comentários em 2024.
SELECT u.nome_usuario, c.datahora, c.id_comentario
from usuarios u, comentarios c
where year(c.datahora) = 2024
group by u.nome_usuario, c.id_comentario; 


#7. Listar todos os grupos, ordenados pelo nome do grupo de A a Z.
select g.nome_grupo
from grupos g
order by g.nome_grupo;


#8. Mostrar os nomes dos grupos que têm a palavra "Tecnologia" na descrição.
select g.nome_grupo, g.descricao
from grupos g
where ('Tecn');

#9. Exibir os detalhes dos comentários: ID do comentário, texto, data e hora, nome do usuário que comentou e ID da postagem comentada.

#10. Para cada postagem, mostrar o ID da postagem e a quantidade de comentários.

#11. Contar quantos seguidores cada usuário possui.

#12. Listar os nomes dos usuários que pertencem ao grupo "Desenvolvimento".

#13. Mostrar o nome dos usuários e a data e hora da última postagem que eles fizeram.

#14. Contar quantas postagens cada usuário fez.

#15. Para cada grupo, exibir o nome do grupo e a quantidade de usuários que pertencem a ele.
