package grh.utilizador;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dataccess.DAOFactory;
import grh.espaco.Espaco;
import grh.utilizador.Utilizador;
import oracle.jdbc.OracleTypes;

public class JDBCUtilizadorDAO implements Serializable, UtilizadorDAO{
	private static final long serialVersionUID = -7837939716231867187L;
	private transient Connection connection = null; 
	
	@Override
	public void setConnection(Object connection) throws SQLException {
		this.connection = (Connection)connection;		
	}

	@Override
	public ArrayList<Utilizador> verificarCredencias(String nomeUtilizador, String password) throws SQLException {
		String sql="{call creditar(?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
		
		pst.setString(1, nomeUtilizador);
		pst.setString(2, password);
		pst.registerOutParameter(3, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(3);
		ArrayList <Utilizador>utilzadores= new ArrayList<Utilizador>();
		while (rs.next()){
			Utilizador u = new Utilizador(
				rs.getInt("id_Utilizador"),
				rs.getString("nome_utilizador"),
				rs.getString("palavra_passe"),
				rs.getString("tipo_utilizador"),
				rs.getString("nome_completo"),
				rs.getString("email"));
			utilzadores.add(u);
		}
		
		pst.close();
		return utilzadores;
	}

	@Override
	public int novoUtilizador(String nomeutilizador, String password, String tipoUser, String nome,
			String email) throws SQLException {
		String sql="{call inserir_utilizadores(?,?,?,?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
	
		pst.setString(1, nomeutilizador);
		pst.setString(2, password);
		pst.setString(3, tipoUser);
		pst.setString(4, nome);
		pst.setString(5, email);
		pst.registerOutParameter(6, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(6);
		return res;
	}

	@Override
	public int modificarPass(int utilizadorId, String passwordAtual, String passwordNova) throws SQLException {
		String sql="{call alterarPalavraPass(?,?,?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
	
		pst.setInt(1, utilizadorId);
		pst.setString(2, passwordAtual);
		pst.setString(3, passwordNova);
		pst.registerOutParameter(4, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(4);
		return res;
	}

	@Override
	public int eliminarUtilizador(String nomeutilizador) throws SQLException {
		String sql="{call remover_utilizadores(?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
		
		pst.setString(1, nomeutilizador);
		pst.registerOutParameter(2, OracleTypes.INTEGER);
		
		pst.execute();
		
		int res = pst.getInt(2);
		return res;
	}

	@Override
	public ArrayList<Utilizador> listarUtilizadores(String filtro) throws SQLException {
		String sql="{call pesquisarUtilizadores(?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
		
		pst.setString(1, filtro);
		pst.registerOutParameter(2, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(2);
		
		ArrayList <Utilizador>utilzadores= new ArrayList<Utilizador>();
		while (rs.next()){
			Utilizador u = new Utilizador(rs.getString("nome_utilizador"),
					rs.getString("palavra_passe"),
					rs.getString("tipo_utilizador"),
					rs.getString("nome_completo"),
					rs.getString("email"));
		
			utilzadores.add(u);
		}
		pst.close();
		return utilzadores;
	}

	@Override
	public ArrayList<Utilizador> listarTodosResponsaveis() throws SQLException {
		String sql="{call listarTodosResponsaveis(?)";
		CallableStatement pst = this.connection.prepareCall(sql);
		
		pst.registerOutParameter(1, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(1);
		
		ArrayList <Utilizador>utilizadores= new ArrayList<Utilizador>();
		while (rs.next()){
			Utilizador u = new Utilizador (rs.getString("nome_utilizador"),
						rs.getString("nome_completo"),
						rs.getString("email"),
						rs.getInt("n_espacos"));
			
			utilizadores.add(u);
		}
		pst.close();
		return utilizadores;
	}
	
	@Override
	public ArrayList<Utilizador> listarTodosResponsaveis(String filtro) throws SQLException {
		String sql="{call listarTodosResponsaveisFiltro(?,?)";
		CallableStatement pst = this.connection.prepareCall(sql);
		
		pst.setString(1, filtro);
		pst.registerOutParameter(2, OracleTypes.CURSOR);
		pst.execute();
		
		ResultSet rs =(ResultSet)pst.getObject(2);
		
		ArrayList <Utilizador>utilizadores= new ArrayList<Utilizador>();
		while (rs.next()){
			Utilizador u = new Utilizador (rs.getString("nome_utilizador"),
						rs.getString("nome_completo"),
						rs.getString("email"),
						rs.getInt("n_espacos"));
			
			utilizadores.add(u);
		}
		pst.close();
		return utilizadores;
	}

}
