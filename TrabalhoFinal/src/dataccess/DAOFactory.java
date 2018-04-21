package dataccess;

import grh.espaco.EspacoDAO;
import grh.espaco.JDBCEspacoDAO;
import grh.reserva.JDBCReservaDAO;
import grh.reserva.ReservaDAO;
import grh.utilizador.JDBCUtilizadorDAO;
import grh.utilizador.UtilizadorDAO;

public class DAOFactory {

	public DAOFactory() {
		// TODO Auto-generated constructor stub
	}

	public static EspacoDAO createEspacoDAO(){
		return new JDBCEspacoDAO();
	}
	
 	public static ReservaDAO createReservaDAO(){
		return new JDBCReservaDAO();
	} 
 	
	public static UtilizadorDAO createUtilizadorDAO(){
		return new JDBCUtilizadorDAO();
	} 
}
