CREATE TRIGGER t_RemoverEspacos
  BEFORE DELETE ON Reservas
  FOR EACH ROW
  BEGIN
    DELETE FROM Reservas WHERE id_Espaco=:OLD.id_Espaco;
END;
/

CREATE TRIGGER t_RemoverUtilizador
  BEFORE DELETE ON Utilizadores
  FOR EACH ROW
  BEGIN
    DELETE FROM Reservas WHERE id_utilizador=:OLD.id_utilizador;
END;
/
