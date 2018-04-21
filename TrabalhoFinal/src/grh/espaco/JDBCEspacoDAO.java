package grh.espaco;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dataccess.DAOFactory;
import grh.espaco.EspacoDAO;
import grh.espaco.JDBCEspacoDAO;
import grh.espaco.Espaco;
import oracle.jdbc.OracleTypes;

public class JDBCEspacoDAO implements Serializable, EspacoDAO{
	private static final long serialVersionUID = -8762441399598389120L;
	private transient Connection connection = null; 

	@Override
	public void setConnection(Object connection) throws SQLException {
		this.connection = (Connection)connection;		
	}

	@Override
	public int novoEspaco(String nomeEspaco, int piso, String edificio, int nComputadores,
			String projetor, int n_lugares, String outrasCaracteristicas, int id_responsavel) throws SQLException {
		String sql="{call adicionarEspaco(?,?,?,?,?,?,?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
	
		pst.setString(1, nomeEspaco);
		pst.setInt(2, piso);
		pst.setString(3, edificio);
		pst.setInt(4, nComputadores);
		pst.setString(5, projetor);
		pst.setInt(6, nComputadores);
		pst.setString(7, outrasCaracteristicas);
		pst.setInt(8, id_responsavel);
		pst.registerOutParameter(9, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(9);
		return res;
	}
	
	@Override
	public int editarEspaco(int idEspacoAtual, String nomeEspaco, int piso, String edificio, int nComputadores,
			String projetor, int n_lugares, String outrasCaracteristicas, int idResponsavel) throws SQLException{
		String sql="{call editarEspaco(?,?,?,?,?,?,?,?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
	
		pst.setInt(1, idEspacoAtual);
		pst.setString(2, nomeEspaco);
		pst.setInt(3, piso);
		pst.setString(4, edificio);
		pst.setInt(5, nComputadores);
		pst.setString(6, projetor);
		pst.setInt(7, nComputadores);
		pst.setString(8, outrasCaracteristicas);
		pst.setInt(9, idResponsavel);
		pst.registerOutParameter(10, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(10);
		return res;
	}
	
	@Override
	public ArrayList<Espaco> pesquisaEspaco(String edificio, int piso) throws SQLException{
		String sql="{call pesquisarEspaco(?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);

		pst.setString(1, edificio);
		pst.setInt(2, piso);
		pst.registerOutParameter(3, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(3);
		
		ArrayList <Espaco>espacos= new ArrayList<Espaco>();
		while (rs.next()){
			Espaco e = new Espaco(
					rs.getInt("id_Espaco"),
					rs.getString("nome"),
					rs.getInt("n_computadores"),
					rs.getString("projetor"), 
					rs.getInt("n_lugares"),
					rs.getString("outras_caracteristicas"),
					rs.getString("nome_Utilizador"));
			espacos.add(e);
		}
		pst.close();
		return espacos;
	}

	@Override
	public ArrayList<Espaco> listarEspaco(String edificio, int piso, int idResponsavel) throws SQLException{
		String sql="{call listarEspaco(?,?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);

		pst.setString(1, edificio);
		pst.setInt(2, piso);
		pst.setInt(3, idResponsavel);
		pst.registerOutParameter(4, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(4);
		
		ArrayList <Espaco>espacos= new ArrayList<Espaco>();
		while (rs.next()){
			Espaco e = new Espaco(
					rs.getInt("id_Espaco"),
					rs.getString("nome"), 
					rs.getInt("piso"),
					rs.getString("edificio"), 
					rs.getInt("n_computadores"),
					rs.getString("projetor"), 
					rs.getInt("n_lugares"),
					rs.getString("outras_caracteristicas"),
					rs.getInt("id_utilizador"));
			espacos.add(e);
		}
		pst.close();
		return espacos;
	}
	
	@Override
	public Espaco pesquisaEspaco(int idEspaco) throws SQLException{
		String sql="{call pesquisarEspacoX(?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);

		pst.setInt(1, idEspaco);
		pst.registerOutParameter(2, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(2);
		
		Espaco e = null;
		
		if (rs.next()){
			e = new Espaco(
					rs.getInt("id_Espaco"),
					rs.getString("nome"), 
					rs.getInt("piso"),
					rs.getString("edificio"), 
					rs.getInt("n_computadores"),
					rs.getString("projetor"), 
					rs.getInt("n_lugares"),
					rs.getString("outras_caracteristicas"),
					rs.getInt("id_utilizador"));
		}
		pst.close();
		return e;
	}
	
	@Override
	public int alterarResponsavelEspaco(String utilizadorAtual, String utilizadorNovo) throws SQLException {
		String sql="{call alterar_responsavel_de_espaco(?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
	
		pst.setString(1, utilizadorAtual);
		pst.setString(2, utilizadorNovo);
		pst.registerOutParameter(3, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(3);
		return res;
	}
	
	@Override
	public int eliminarEspaco(int idEspaco) throws SQLException {
		String sql="{call eliminarEspaco(?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
	
		pst.setInt(1, idEspaco);
		pst.registerOutParameter(2, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(2);
		return res;
	}

}
