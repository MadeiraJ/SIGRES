INSERT INTO Utilizadores (
	id_utilizador, nome_utilizador, palavra_passe, tipo_utilizador, 	nome_completo, email)
VALUES (
	4, 'admin', '123', 'a', 'admin', 'admin@hotmail.com');

INSERT INTO Utilizadores (
	id_utilizador, nome_utilizador, palavra_passe, tipo_utilizador, 	nome_completo, email)
VALUES (
	6, 'prof', '123', 'p', 'pro', 'prof@hotmail.com');

INSERT INTO Utilizadores (
	id_utilizador, nome_utilizador, palavra_passe, tipo_utilizador, 	nome_completo, email)
VALUES (
	7, 'fun', '123', 'f', 'fun', 'fun@hotmail.com');

--Responsável Edificio Principal Piso 1
INSERT INTO Utilizadores (
	id_utilizador, nome_utilizador, palavra_passe, tipo_utilizador, 	nome_completo, email)
VALUES (
	5, 'resp', '123', 're', 'resp', 'resp@hotmail.com');

--Responsável Edificio Principal Piso 2
INSERT INTO Utilizadores (
	id_utilizador, nome_utilizador, palavra_passe, tipo_utilizador, 	nome_completo, email)
VALUES (
	8, 'resp1', '123', 're', 'resp1', 'resp1@hotmail.com');

--Responsável Edificio M Piso 0
INSERT INTO Utilizadores (
	id_utilizador, nome_utilizador, palavra_passe, tipo_utilizador, 	nome_completo, email)
VALUES (
	9, 'resp2', '123', 're', 'resp2', 'resp2@hotmail.com');

--Responsável Edificio M Piso 1
INSERT INTO Utilizadores (
	id_utilizador, nome_utilizador, palavra_passe, tipo_utilizador, 	nome_completo, email)
VALUES (
	10, 'resp3', '123', 're', 'resp3', 'resp3@hotmail.com');

--Responsável Edificio M Piso 2
INSERT INTO Utilizadores (
	id_utilizador, nome_utilizador, palavra_passe, tipo_utilizador, 	nome_completo, email)
VALUES (
	11, 'resp4', '123', 're', 'resp4', 'resp4@hotmail.com');


--Responsável Edificio M Piso 3
INSERT INTO Utilizadores (
	id_utilizador, nome_utilizador, palavra_passe, tipo_utilizador, 	nome_completo, email)
VALUES (
	12, 'resp5', '123', 're', 'resp5', 'resp5@hotmail.com');


--Espaços Edificio M Piso 1 Sala M1, Responsável id = 10
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	13, 'M1', 1, 'm', 0, 's', 38, 'Não tem', 10);


--Espaços Edificio M Piso 1 Sala M2, Responsável id = 10
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	14, 'M2', 1, 'm', 0, 's', 88, 'Não tem', 10);



--Espaços Edificio M Piso 0 Sala SI1, Responsável id = 9
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	15, 'SI1', 0, 'm', 12, 's', 36, 'Possui Windows 7/10, Office 2016, Visio 2016, Project 2016 e SPSS', 9);


--Espaços Edificio M Piso 0 Sala LI1, Responsável id = 9
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	16, 'LI1', 0, 'm', 12, 's', 36, 'Possui Windows 7/10, Office 2016, Project 2016', 9);



--Espaços Edificio M Piso 0 Sala SI2, Responsável id = 9
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	17, 'SI2', 0, 'm', 20, 's', 54, 'Possui Windows 7/10, Office 2016, Visio 2016 e Eclipse', 9);


--Espaços Edificio M Piso 0 Sala SI3, Responsável id = 9
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	18, 'SI3', 0, 'm', 21, 's', 57, 'Possui Windows 7/10, Office 2016, Visio 365 e SPSS', 9);



--Espaços Edificio M Piso 2 Sala M4, Responsável id = 11
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	19, 'M4', 2, 'm', 0, 's', 78, 'Não tem', 11);


--Espaços Edificio M Piso 2 Sala M5, Responsável id = 11
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	20, 'M5', 2, 'm', 0, 's', 54, 'Não tem', 11);


--Espaços Edificio M Piso 2 Sala M6, Responsável id = 11
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	21, 'M6', 2, 'm', 0, 's', 48, 'Não tem', 11);


--Espaços Edificio M Piso 3 Sala M7, Responsável id = 12
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	22, 'M7', 3, 'm', 0, 's', 60, 'Não tem', 12);


--Espaços Edificio M Piso 3 Sala SI4, Responsável id = 12
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	23, 'SI4', 3, 'm', 24, 's', 65, 'Windows 7/10, Office 2016, Eclipse e Adobe Photoshop', 12);


--Espaços Edificio Principal Piso 1 Sala 1.1, Responsável id = 5
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	1, '1.1', 1, 'p', 0, 's', 58, 'Não tem', 5);


--Espaços Edificio Principal Piso 1 Sala 1.2, Responsável id = 5
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	2, '1.2', 1, 'p', 0, 's', 58, 'Não tem', 5);


--Espaços Edificio Principal Piso 1 Sala 1.3, Responsável id = 5
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	3, '1.3', 1, 'p', 0, 's', 54, 'Não tem', 5);


--Espaços Edificio Principal Piso 1 Sala 1.4, Responsável id = 5
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	4, '1.4', 1, 'p', 0, 's', 94, 'Não tem', 5);


--Espaços Edificio Principal Piso 1 Sala 1.5, Responsável id = 5
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	5, '1.5', 1, 'p', 0, 's', 38, 'Não tem', 5);


--Espaços Edificio Principal Piso 1 Sala 1.6, Responsável id = 5
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	6, '1.6', 1, 'p', 0, 's', 37, 'Não tem', 5);



--Espaços Edificio Principal Piso 2 Sala 2.1, Responsável id = 8
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	7, '2.1', 2, 'p', 0, 's', 96, 'Não tem', 8);


--Espaços Edificio Principal Piso 2 Sala 2.2, Responsável id = 8
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	8, '2.2', 2, 'p', 0, 's', 39, 'Não tem', 8);


--Espaços Edificio Principal Piso 2 Sala 2.3, Responsável id = 8
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	9, '2.3', 2, 'p', 0, 's', 37, 'Não tem', 8);


--Espaços Edificio Principal Piso 2 Sala 2.4, Responsável id = 8
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	10, '2.4', 2, 'p', 0, 's', 62, 'Não tem', 8);


--Espaços Edificio Principal Piso 2 Sala 2.5, Responsável id = 8
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	11, '2.5', 2, 'p', 0, 's', 37, 'Não tem', 8);


--Espaços Edificio Principal Piso 2 Sala Auditorio, Responsável id = 8
INSERT INTO Espacos (
	id_espaco, nome, piso, edificio, n_computadores, projetor, n_lugares,
	outras_caracteristicas, id_utilizador)
VALUES (
	12, 'Auditório', 2, 'p', 0, 's', 120, 'Não tem', 8);





