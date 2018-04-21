package grh.espaco;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;

import grh.utilizador.Utilizador;

public interface EspacoDAO extends Serializable{
	public void setConnection(Object connection) throws SQLException;
	public int novoEspaco(String nomeEspaco, int piso, String edificio, int nComputadores, String projetor,
			int n_lugares, String outrasCaracteristicas, int id_responsavel) throws SQLException;
	public int editarEspaco(int idEspacoAtual, String nomeEspaco, int piso, String edificio, int nComputadores,
			String projetor, int n_lugares, String outrasCaracteristicas, int idResponsavel) throws SQLException;
	public ArrayList<Espaco> listarEspaco(String edificio, int piso, int idResponsavel) throws SQLException;
	public ArrayList<Espaco> pesquisaEspaco(String edificio, int piso) throws SQLException;
	public Espaco pesquisaEspaco(int idEspaco) throws SQLException;
	public int alterarResponsavelEspaco(String utilizadorAtual, String utilizadorNovo) throws SQLException;
	public int eliminarEspaco(int idEspaco) throws SQLException;
}
