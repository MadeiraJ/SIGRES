CREATE FUNCTION id_proximo_espaco
  RETURN NUMBER IS
    v_ultimo Espacos.id_espaco%TYPE;
    v_max Espacos.id_espaco%TYPE;
  BEGIN
    SELECT COUNT(*) INTO v_ultimo FROM Espacos;
    SELECT MAX(id_espaco) INTO v_max FROM Espacos;
    IF v_ultimo = v_max THEN
      RETURN v_max+1;
    ELSIF v_ultimo = 0 THEN
      RETURN 1;
    ELSE
      FOR i IN 1..v_max LOOP
        SELECT COUNT(*) INTO v_ultimo FROM Espacos WHERE id_espaco = i;
        IF v_ultimo=0 THEN
          RETURN i;
        END IF;
      END LOOP;
    END IF;
  END id_proximo_espaco;
/

CREATE FUNCTION id_proximo_reservas
  RETURN NUMBER IS
    v_ultimo Reservas.id_reserva%TYPE;
    v_max Reservas.id_reserva%TYPE;
  BEGIN
    SELECT COUNT(*) INTO v_ultimo FROM Reservas;
    SELECT MAX(id_reserva) INTO v_max FROM Reservas;
    IF v_ultimo = v_max THEN
      RETURN v_max+1;
    ELSIF v_ultimo = 0 THEN
      RETURN 1;
    ELSE
      FOR i IN 1..v_max LOOP
        SELECT COUNT(*) INTO v_ultimo FROM Reservas WHERE id_reserva = i;
        IF v_ultimo=0 THEN
          RETURN i;
        END IF;
      END LOOP;
    END IF;
  END id_proximo_reservas;
/

CREATE FUNCTION id_proximo_utilizador
  RETURN NUMBER IS
    v_ultimo Utilizadores.id_utilizador%TYPE;
    v_max Utilizadores.id_utilizador%TYPE;
  BEGIN
    SELECT COUNT(*) INTO v_ultimo FROM Utilizadores;
    SELECT MAX(id_utilizador) INTO v_max FROM Utilizadores;
    IF v_ultimo = v_max THEN
      RETURN v_max+1;
    ELSIF v_ultimo = 0 THEN
      RETURN 1;
    ELSE
      FOR i IN 1..v_max LOOP
        SELECT COUNT(*) INTO v_ultimo FROM Utilizadores WHERE id_utilizador = i;
        IF v_ultimo=0 THEN
          RETURN i;
        END IF;
      END LOOP;
    END IF;
  END id_proximo_utilizador;
/