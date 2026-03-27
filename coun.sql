CREATE TABLE alunos (
id INT PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE cursos (
id INT PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE matriculas (
id INT PRIMARY KEY,
aluno_id INT,
curso_id INT
);

INSERT INTO alunos VALUES
(1, 'Ana'),
(2, 'Carlos'),
(3, 'Mariana'),
(4, 'Pedro');

INSERT INTO cursos VALUES
(1, 'Informática'),
(2, 'Administração');

INSERT INTO matriculas VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);


SELECT a.nome AS aluno, c.nome AS curso
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;


SELECT DISTINCT a.nome AS aluno
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id;

SELECT a.nome AS aluno, c.nome AS curso
FROM alunos a
LEFT JOIN matriculas m ON a.id = m.aluno_id
LEFT JOIN cursos c ON m.curso_id = c.id;


SELECT a.nome AS aluno_nao_matriculado
FROM alunos a
LEFT JOIN matriculas m ON a.id = m.aluno_id
WHERE m.aluno_id IS NULL;

SELECT a.nome AS aluno, c.nome AS curso
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id;

SELECT a.nome AS aluno
FROM matriculas m
JOIN alunos a ON m.aluno_id = a.id
JOIN cursos c ON m.curso_id = c.id
WHERE c.nome = 'Informática';

SELECT 
    c.nome AS curso, 
    COUNT(a.id) AS quantidade_alunos
FROM cursos c
LEFT JOIN matriculas m ON c.id = m.curso_id
LEFT JOIN alunos a ON m.aluno_id = a.id
GROUP BY c.id, c.nome
ORDER BY quantidade_alunos DESC;
