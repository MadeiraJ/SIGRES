package grh.utilizador;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import grh.espaco.Espaco;
import grh.reserva.Reserva;

public interface UtilizadorDAO extends Serializable{
	public void setConnection(Object connection) throws SQLException;
	public ArrayList<Utilizador> verificarCredencias(String nomeUtilizador, String password) throws SQLException;
	public int novoUtilizador(String nomeutilizador, String password, String tipoUser, String nome,
			String email) throws SQLException;
	public int modificarPass(int utilizadorId, String passwordAtual, String passwordNova) throws SQLException;
	public int eliminarUtilizador(String nomeutilizador) throws SQLException;
	public ArrayList<Utilizador> listarUtilizadores(String filtro) throws SQLException;
	public ArrayList<Utilizador> listarTodosResponsaveis()throws SQLException;
	public ArrayList<Utilizador> listarTodosResponsaveis(String filtro)throws SQLException;
}
