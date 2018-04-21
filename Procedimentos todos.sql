CREATE PROCEDURE alterar_responsavel_de_espaco(p_utilizador_atual IN VARCHAR2,p_utilizador_novo IN VARCHAR2, res OUT NUMBER) IS
  v_id_antigo Utilizadores.id_utilizador%TYPE;
  v_id_novo Utilizadores.id_utilizador%TYPE;
  BEGIN
    SELECT id_utilizador INTO v_id_antigo FROM Utilizadores WHERE nome_utilizador = p_utilizador_atual;
    SELECT id_utilizador INTO v_id_novo FROM Utilizadores WHERE nome_utilizador = p_utilizador_novo;
    UPDATE Espacos SET id_utilizador=v_id_novo WHERE id_utilizador=v_id_antigo;
    res := 0;
  END;
/

CREATE PROCEDURE confirmar_reserva(p_id_reserva IN NUMBER, p_funcao IN VARCHAR2, res OUT NUMBER) IS
  BEGIN
    IF p_funcao = 'a' THEN
      UPDATE Reservas SET estado = 'a' WHERE id_reserva=p_id_reserva;
    ELSE 
      DELETE FROM Reservas WHERE id_reserva=p_id_reserva;
    END IF;
    res :=0;
  END;
/

CREATE PROCEDURE creditar(p_nome_utilizador IN VARCHAR2, p_pass IN VARCHAR2, p_user OUT SYS_REFCURSOR
  ) IS
    v_nome_utilizador NUMBER(1);
    v_pass NUMBER(1);
BEGIN
  SELECT COUNT(nome_utilizador), COUNT(palavra_passe) INTO v_nome_utilizador, v_pass FROM Utilizadores
    WHERE nome_utilizador=p_nome_utilizador AND palavra_passe=p_pass;
  IF v_nome_utilizador>0 AND v_pass>0 THEN
    OPEN p_user FOR
      SELECT * FROM Utilizadores WHERE nome_utilizador=p_nome_utilizador AND palavra_passe=p_pass;
  END IF;
END;
/

CREATE PROCEDURE pesquisarUtilizadores(p_filtro IN VARCHAR2, p_lista OUT SYS_REFCURSOR) IS
  BEGIN
    IF p_filtro = 't' THEN
      OPEN p_lista FOR
        SELECT * FROM Utilizadores;
    ELSE
      OPEN p_lista FOR
        SELECT * FROM Utilizadores WHERE tipo_utilizador = p_filtro;
    END IF;
  END;
/

CREATE PROCEDURE editarEspaco (p_id_espaco IN NUMBER, p_nome IN VARCHAR2,p_piso IN NUMBER, p_edificio IN VARCHAR2,
    p_n_computadores IN NUMBER, p_projetor IN CHAR, p_n_lugares IN NUMBER, p_outras_caracteristicas IN VARCHAR2,
    p_id_utilizador IN NUMBER, res OUT NUMBER) IS
  BEGIN
    UPDATE Espacos SET nome=p_nome, piso=p_piso, edificio=p_edificio, n_computadores=p_n_computadores,
      projetor=p_projetor, n_lugares=p_n_lugares, outras_caracteristicas=p_outras_caracteristicas,
      id_utilizador=p_id_utilizador WHERE id_espaco=p_id_espaco;
      res := 0;
  END;
/

CREATE PROCEDURE alterarPalavraPass(p_id_utilizador IN NUMBER, p_pass_a IN VARCHAR2, p_pass_n IN VARCHAR2, res OUT NUMBER) IS
  v_pass_a Utilizadores.palavra_passe%TYPE;
  BEGIN
    SELECT palavra_passe INTO v_pass_a FROM Utilizadores WHERE id_utilizador=p_id_utilizador;
    IF p_pass_a = v_pass_a THEN
      UPDATE Utilizadores SET palavra_passe=p_pass_n WHERE id_utilizador=p_id_utilizador;
      res := 0;
    END IF;
  END;
/

CREATE PROCEDURE adicionarEspaco (p_nome IN VARCHAR2, p_piso IN NUMBER, p_edificio IN VARCHAR2,
    p_n_computadores IN NUMBER, p_projetor IN Espacos.projetor%TYPE, p_n_lugares IN NUMBER, p_outras_caracteristicas IN VARCHAR2,
    p_id_utilizador IN NUMBER, res OUT NUMBER) IS
    v_id_espaco Espacos.id_espaco%TYPE;
  BEGIN
    v_id_espaco := id_proximo_espaco;
    INSERT INTO Espacos(id_espaco,nome, piso, edificio, n_computadores, projetor,
        n_lugares, outras_caracteristicas,id_utilizador) VALUES (v_id_espaco,p_nome, p_piso, p_edificio,
        p_n_computadores, p_projetor, p_n_lugares, p_outras_caracteristicas,p_id_utilizador);
    res := 0;
  END;
/

CREATE PROCEDURE inserir_reserva(p_data_reserva IN VARCHAR2, p_hora_inicio IN VARCHAR2, p_hora_fim IN VARCHAR2,
      p_descricao_uso IN VARCHAR2, p_id_espaco IN NUMBER, p_id_utilizador IN NUMBER, res OUT NUMBER) IS
    v_id_reservas Reservas.id_reserva%TYPE;
    v_data Reservas.data_reserva%TYPE;
    p_estado Reservas.estado%TYPE := 'p';
  BEGIN
    v_data := TO_DATE(p_data_reserva,'dd/mm/yyyy');
    IF v_data > SYSDATE AND TO_DATE(p_hora_inicio,'HH24:MI') < TO_DATE(p_hora_fim,'HH24:MI') THEN
      v_id_reservas := id_proximo_reservas;    
      INSERT INTO Reservas(id_reserva, data_reserva, hora_inicio, hora_fim, estado, descricao_uso,
        id_utilizador, id_espaco) VALUES (v_id_reservas, p_data_reserva, p_hora_inicio, p_hora_fim, p_estado,
        p_descricao_uso, p_id_utilizador, p_id_espaco);
      res := 0;
    END IF;
END;
/

CREATE PROCEDURE inserir_reserva_Multipla(p_data_reserva IN VARCHAR2, p_hora_inicio IN VARCHAR2, p_hora_fim IN VARCHAR2,
      p_descricao_uso IN VARCHAR2, p_data_fim IN VARCHAR2, p_id_espaco IN NUMBER, p_id_utilizador IN NUMBER, res OUT NUMBER) IS
    v_id_reservas Reservas.id_reserva%TYPE;
    v_data_reserva Reservas.data_reserva%TYPE;
    v_data_fim Reservas.data_reserva%TYPE;
    p_estado Reservas.estado%TYPE := 'p';
    v_data Reservas.data_reserva%TYPE;
  BEGIN
    v_data_reserva := TO_DATE(p_data_reserva,'dd/mm/yyyy');
    v_data_fim := TO_DATE(p_data_fim,'dd/mm/yyyy');
    IF TO_DATE(SYSDATE, 'DD/MM/YYYY') <= v_data_reserva AND TO_DATE(p_hora_inicio,'HH24:MI') < TO_DATE(p_hora_fim,'HH24:MI')
      AND v_data_reserva <= v_data_fim THEN 
      v_data := v_data_reserva;
      WHILE v_data <= v_data_fim LOOP
        v_id_reservas := id_proximo_reservas;    
        INSERT INTO Reservas(id_reserva, data_reserva, hora_inicio, hora_fim, estado, descricao_uso,
          id_utilizador, id_espaco) VALUES (v_id_reservas, v_data, p_hora_inicio, p_hora_fim, p_estado,
          p_descricao_uso, p_id_utilizador, p_id_espaco);
          v_data := v_data + 7;
      END LOOP;
      res := 0;
    END IF;
END;
/

CREATE PROCEDURE inserir_utilizadores(p_nome_utilizador IN VARCHAR2, p_palavra_passe IN VARCHAR2,
	p_tipo_utilizador IN VARCHAR2, p_nome_completo IN VARCHAR2, p_email IN VARCHAR2, res OUT NUMBER) IS
    v_id_utilizador Utilizadores.id_utilizador%TYPE;
  BEGIN
    v_id_utilizador := id_proximo_utilizador;
    INSERT INTO Utilizadores(id_utilizador, nome_utilizador,palavra_passe,tipo_utilizador,
      nome_completo,email) VALUES (v_id_utilizador, p_nome_utilizador, p_palavra_passe, p_tipo_utilizador,
      p_nome_completo, p_email);
    res := 0;
  END;
/

CREATE PROCEDURE listarEspaco (p_edificio IN VARCHAR2, p_piso IN NUMBER, p_idUtilizador IN NUMBER, p_lista OUT SYS_REFCURSOR) IS
BEGIN
  OPEN p_lista FOR
    SELECT * FROM Espacos WHERE edificio = p_edificio AND piso = p_piso AND id_Utilizador = p_idUtilizador;
END;
/

CREATE PROCEDURE listarReservasPendentes(p_id_responsavel IN NUMBER, p_lista OUT SYS_REFCURSOR) IS
  BEGIN
    OPEN p_lista FOR
     SELECT E.nome, R.data_reserva, R.hora_inicio, R.hora_fim, R.descricao_uso, U.nome_Utilizador, R.id_reserva
      FROM (Reservas R INNER JOIN Espacos E ON E.id_espaco = R.id_espaco) INNER JOIN Utilizadores U ON R.id_utilizador = U.id_utilizador
      WHERE E.id_utilizador = p_id_responsavel ORDER BY R.data_reserva, R.hora_inicio;
END;
/

CREATE PROCEDURE listarReservasUtilizador(p_estado IN Reservas.estado%TYPE, p_id_Utilizador IN NUMBER, p_lista OUT SYS_REFCURSOR) IS
BEGIN
  IF p_estado = 't' THEN
    OPEN p_lista FOR
      SELECT R.id_reserva, E.nome, R.data_reserva, R.hora_Inicio, R.hora_fim, R.estado, R.descricao_uso 
        FROM Reservas R INNER JOIN Espacos E ON R.id_espaco=E.id_espaco WHERE R.id_utilizador = p_id_Utilizador
        ORDER BY R.data_reserva, R.hora_Inicio;
  ELSE
    OPEN p_lista FOR
      SELECT R.id_reserva, E.nome, R.data_reserva, R.hora_Inicio, R.hora_fim, R.estado, R.descricao_uso 
        FROM Reservas R INNER JOIN Espacos E ON R.id_espaco=E.id_espaco WHERE R.id_utilizador = p_id_Utilizador AND R.estado=p_estado
        ORDER BY R.data_reserva, R.hora_Inicio;
  END IF;
END; 
/

CREATE PROCEDURE listarTodosEspaco(p_lista OUT SYS_REFCURSOR) IS
  BEGIN
      OPEN p_lista FOR
        SELECT nome FROM Espacos;
  END;
/

create or replace PROCEDURE listarTodosResponsaveis (p_lista OUT SYS_REFCURSOR) IS
BEGIN
  OPEN p_lista FOR
      SELECT U.nome_utilizador, U.nome_completo, U.email, COUNT(E.id_espaco) AS n_espacos
        FROM Utilizadores U INNER JOIN Espacos E ON U.id_utilizador=E.id_utilizador WHERE U.TIPO_UTILIZADOR = 're'
        GROUP BY U.nome_utilizador, U.nome_completo, U.email;        
        
END;
/

CREATE PROCEDURE pesquisarEspaco(p_edificio IN VARCHAR2, p_piso IN NUMBER, p_lista OUT SYS_REFCURSOR) IS
BEGIN
  OPEN p_lista FOR
    SELECT E.id_espaco, E.nome, E.n_computadores, E.projetor, E.n_lugares, E.outras_caracteristicas, U.nome_Utilizador 
      FROM Espacos E INNER JOIN Utilizadores U ON E.id_utilizador = U.id_utilizador
      WHERE edificio = p_edificio AND piso = p_piso;
END;
/

CREATE PROCEDURE pesquisar_espacos_reserva( p_piso IN NUMBER, p_edificio IN VARCHAR2, p_n_computadores IN NUMBER,
    p_projetor IN Espacos.projetor%TYPE, p_n_lugares IN NUMBER, p_lista OUT SYS_REFCURSOR) IS
BEGIN
  OPEN p_lista FOR
    SELECT E.id_Espaco, E.nome, E.outras_caracteristicas, U.nome_utilizador
      FROM Espacos E INNER JOIN Utilizadores U ON E.id_utilizador=U.id_utilizador
      WHERE E.piso = p_piso AND E.edificio = p_edificio AND E.n_computadores >= p_n_computadores AND E.projetor = p_projetor
      AND E.n_lugares >= p_n_lugares;
END;
/

CREATE PROCEDURE pesquisarEspacoX(p_idEspaco IN NUMBER, p_lista OUT SYS_REFCURSOR) IS
  BEGIN
  OPEN p_lista FOR
    SELECT * FROM Espacos WHERE id_Espaco=p_idEspaco;
END;
/

CREATE PROCEDURE pesquisarReserva(p_data IN VARCHAR2, p_id_espaco IN NUMBER, p_lista OUT SYS_REFCURSOR) IS
  v_data Reservas.data_reserva%TYPE;
BEGIN
  v_data := TO_DATE(p_data,'dd/mm/yyyy');
  OPEN p_lista FOR
    SELECT R.hora_inicio, R.hora_fim, R.descricao_uso, U.nome_Utilizador 
      FROM (Reservas R INNER JOIN Espacos E ON E.id_espaco = R.id_espaco) INNER JOIN Utilizadores U ON R.id_utilizador = U.id_utilizador
      WHERE E.id_espaco = p_id_espaco AND R.data_Reserva = v_data AND R.estado = 'a' ORDER BY R.hora_inicio;
END;
/

CREATE PROCEDURE eliminarEspaco(p_id_espaco IN VARCHAR2, res OUT NUMBER) IS
  BEGIN
    DELETE FROM Espacos WHERE id_Espaco=p_id_espaco;
    res :=0;
  END;
/

CREATE PROCEDURE removerReserva(p_id_reserva IN NUMBER, res OUT NUMBER) IS
  BEGIN
    DELETE FROM Reservas WHERE id_reserva=p_id_reserva;
    res :=0;
END;
/

CREATE PROCEDURE remover_utilizadores(p_nome_utilizador IN VARCHAR2, res OUT NUMBER) IS
  BEGIN
    DELETE FROM Utilizadores WHERE nome_utilizador=p_nome_utilizador;
    res := 0;
  END;
/



