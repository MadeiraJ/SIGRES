package grh.reserva;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import grh.espaco.Espaco;
import grh.reserva.Reserva;
import grh.utilizador.Utilizador;
import oracle.jdbc.OracleTypes;

public class JDBCReservaDAO implements Serializable, ReservaDAO{
	private static final long serialVersionUID = 8506893383377443707L;
	private transient Connection connection = null; 

	@Override
	public void setConnection(Object connection) throws SQLException {
		this.connection = (Connection)connection;
		
	}

	@Override
	public int novaReserva(String dataReserva, String horaI, String horaF,
		String descricaoUso, int idEspaco, int idUtilizador) throws SQLException {
		String sql="{call inserir_reserva(?,?,?,?,?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);

		pst.setString(1, dataReserva);
		pst.setString(2, horaI);
		pst.setString(3, horaF);
		pst.setString(4, descricaoUso);
		pst.setInt(5, idEspaco);
		pst.setInt(6, idUtilizador);
		pst.registerOutParameter(7, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(7);
		return res;
	}
	
	@Override
	public int novaReservaMultipla(String dataReserva, String horaI, String horaF, String descricaoUso,
			String dataFim, int idEspaco, int idUtilizador) throws SQLException{
		String sql="{call inserir_reserva_Multipla(?,?,?,?,?,?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);

		pst.setString(1, dataReserva);
		pst.setString(2, horaI);
		pst.setString(3, horaF);
		pst.setString(4, descricaoUso);
		pst.setString(5, dataFim);
		pst.setInt(6, idEspaco);
		pst.setInt(7, idUtilizador);
		pst.registerOutParameter(8, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(8);
		return res;
	}
	
	@Override
	public int confirmarReserva(int reservaId, String funcao) throws SQLException {
		String sql="{call confirmar_reserva(?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
	
		pst.setInt(1, reservaId);
		pst.setString(2, funcao);
		pst.registerOutParameter(3, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(3);
		return res;
	}
	
	
	@Override
	public int eliminarReserva(int reservaId) throws SQLException {
		String sql="{call removerReserva(?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
	
		pst.setInt(1, reservaId);
		pst.registerOutParameter(2, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(2);
		return res;
	}

	
	@Override
	public ArrayList<Reserva> pesquisarReserva(String data, int idEspaco) throws SQLException {
		String sql="{call pesquisarReserva(?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);

		pst.setString(1, data);
		pst.setInt(2, idEspaco);
		pst.registerOutParameter(3, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(3);
		
		ArrayList <Reserva>reservas= new ArrayList<Reserva>();
		while (rs.next()){
			Reserva r = new Reserva(
					rs.getString("hora_inicio"),
					rs.getString("hora_fim"),
					rs.getString("descricao_uso"),
					rs.getString("nome_Utilizador"));
			reservas.add(r);
		}
		pst.close();
		return reservas;
	}
	
	@Override
	public ArrayList<Reserva> listarTodasReservas(String estado, int id_utilizador) throws SQLException {
		String sql="{call listarReservasUtilizador(?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);

		pst.setString(1, estado);
		pst.setInt(2, id_utilizador);
		pst.registerOutParameter(3, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(3);
		
		ArrayList <Reserva>reservas= new ArrayList<Reserva>();
		while (rs.next()){
			Reserva r = new Reserva(
					rs.getInt("id_Reserva"),
					rs.getString("nome"),
					rs.getDate("data_reserva"),
					rs.getString("hora_inicio"),
					rs.getString("hora_fim"),
					rs.getString("estado"),
					rs.getString("descricao_uso"));
			reservas.add(r);
		}
		pst.close();
		return reservas;
	}
	
	@Override
	public ArrayList<Reserva> listarEspacosDisponiveis(int piso, String edificio,
			int nComputadores, String projetor, int nLugares) throws SQLException {
		String sql="{call pesquisar_espacos_reserva(?,?,?,?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
	
		pst.setInt(1, piso);
		pst.setString(2, edificio);
		pst.setInt(3, nComputadores);
		pst.setString(4, projetor);
		pst.setInt(5, nLugares);
		/*pst.setString(6, data);
		pst.setString(7, horaI);
		pst.setString(8, horaF);*/
		pst.registerOutParameter(6, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(6);
		
		ArrayList <Reserva>reservas= new ArrayList<Reserva>();
		while (rs.next()){
			Reserva r = new Reserva(
					rs.getInt("id_Espaco"),
					rs.getString("nome"),
					rs.getString("outras_caracteristicas"),
					rs.getString("nome_utilizador"));
			reservas.add(r);
		}
		pst.close();
		return reservas;
	}
	
	@Override
	public ArrayList<Reserva> listarTodasReservasPendentes(int idUtilizador) throws SQLException {
		String sql="{call listarReservasPendentes(?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);

		pst.setInt(1, idUtilizador);
		pst.registerOutParameter(2, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(2);
		
		ArrayList <Reserva>reservas= new ArrayList<Reserva>();
		while (rs.next()){
			Reserva r = new Reserva(
					rs.getString("nome"),
					rs.getDate("data_reserva"),
					rs.getString("hora_inicio"),
					rs.getString("hora_fim"),
					rs.getString("descricao_uso"),
					rs.getString("nome_Utilizador"),
					rs.getInt("id_Reserva"));
			reservas.add(r);
		}
		pst.close();
		return reservas;
	}

}
