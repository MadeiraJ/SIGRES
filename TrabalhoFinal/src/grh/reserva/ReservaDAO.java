package grh.reserva;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import grh.espaco.Espaco;
import grh.utilizador.Utilizador;

public interface ReservaDAO extends Serializable{
	public void setConnection(Object connection) throws SQLException;
	public int novaReserva(String dataReserva, String horaI, String horaF, String descricaoUso,
			int idEspaco, int idUtilizador) throws SQLException;
	public int novaReservaMultipla(String dataReserva, String horaI, String horaF, String descricaoUso,
			String dataFim, int idEspaco, int idUtilizador) throws SQLException;
	public int confirmarReserva(int reservaId, String funcao) throws SQLException;
	public int eliminarReserva(int reservaId) throws SQLException;
	public ArrayList<Reserva> pesquisarReserva(String data, int idEspaco) throws SQLException;
	public ArrayList<Reserva> listarTodasReservas(String estado, int id_utilizador) throws SQLException;
	public ArrayList<Reserva> listarEspacosDisponiveis(int piso, String edificio,
			int nComputadores, String projetor, int nLugares) throws SQLException;
	public ArrayList<Reserva> listarTodasReservasPendentes(int idUtilizador) throws SQLException;

}
