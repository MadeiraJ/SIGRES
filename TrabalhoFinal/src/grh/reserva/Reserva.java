package grh.reserva;

import java.io.Serializable;
import java.util.Date;

import grh.espaco.Espaco;
import grh.reserva.Reserva;
import grh.utilizador.Utilizador;

public class Reserva implements Serializable{
	//Atributos
	private static final long serialVersionUID = -1773397888866557021L;
	
	private int reservaId;
	private Date dataReserva;
	private String horaI;
	private String horaF;
	private String estado;
	private String descricaoUso;
	private int idUtilizador;
	private String nomeUtilizador;
	private int idEspaco;
	private String nomeEspaco;
	private String nomeResponsavel;
	private String descricaoEspaco;
	
	//Construtores
	public Reserva(Date dataReserva, String horaI, String horaF, String estado, String descricaoUso,
			int idUtilizador, int idEspaco) {
		super();
		this.dataReserva = dataReserva;
		this.horaI = horaI;
		this.horaF = horaF;
		this.estado = estado;
		this.descricaoUso = descricaoUso;
		this.idUtilizador = idUtilizador;
		this.idEspaco = idEspaco;
	}
	
	public Reserva(String horaI, String horaF, String descricaoUso,
			String nomeUtilizador) {
		super();
		this.horaI = horaI;
		this.horaF = horaF;
		this.descricaoUso = descricaoUso;
		this.nomeUtilizador = nomeUtilizador;
	}
	
	public Reserva(int reservaId, String nomeEspaco, Date dataReserva, String horaI, String horaF, 
			String estado ,String descricaoUso) {
		super();
		this.reservaId = reservaId;
		this.nomeEspaco = nomeEspaco;
		this.dataReserva = dataReserva;
		this.horaI = horaI;
		this.horaF = horaF;
		this.estado = estado;
		this.descricaoUso = descricaoUso;
	}
	
	public Reserva(int idEspaco, String nomeEspaco, String descricaoEspaco,
			String nomeResponsavel) {
		super();
		this.idEspaco = idEspaco;
		this.nomeEspaco = nomeEspaco;
		this.descricaoEspaco = descricaoEspaco;
		this.nomeResponsavel = nomeResponsavel;
	}
	
	public Reserva(String nomeEspaco, Date dataReserva, String horaI, String horaF, 
			String descricaoUso, String nomeUtilizador ,int reservaId) {
		super();	
		this.nomeEspaco = nomeEspaco;
		this.dataReserva = dataReserva;
		this.horaI = horaI;
		this.horaF = horaF;
		this.descricaoUso = descricaoUso;
		this.nomeUtilizador = nomeUtilizador;
		this.reservaId = reservaId;
	}

	//Acessores
	public int getReservaId() {
		return reservaId;
	}

	public void setReservaId(int reservaId) {
		this.reservaId = reservaId;
	}

	public Date getDataReserva() {
		return dataReserva;
	}

	public void setDataReserva(Date dataReserva) {
		this.dataReserva = dataReserva;
	}

	public String getHoraI() {
		return horaI;
	}

	public void setHoraI(String horaI) {
		this.horaI = horaI;
	}

	public String getHoraF() {
		return horaF;
	}

	public void setHoraF(String horaF) {
		this.horaF = horaF;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getDescricaoUso() {
		return descricaoUso;
	}

	public void setDescricaoUso(String descricaoUso) {
		this.descricaoUso = descricaoUso;
	}

	public int getIdUtilizador() {
		return idUtilizador;
	}

	public void setIdUtilizador(int idUtilizador) {
		this.idUtilizador = idUtilizador;
	}

	public int getIdEspaco() {
		return idEspaco;
	}

	public void setIdEspaco(int idEspaco) {
		this.idEspaco = idEspaco;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getNomeUtilizador() {
		return nomeUtilizador;
	}

	public void setNomeUtilizador(String nomeUtilizador) {
		this.nomeUtilizador = nomeUtilizador;
	}

	public String getNomeEspaco() {
		return nomeEspaco;
	}

	public void setNomeEspaco(String nomeEspaco) {
		this.nomeEspaco = nomeEspaco;
	}

	public String getNomeResponsavel() {
		return nomeResponsavel;
	}

	public void setNomeResponsavel(String nomeResponsavel) {
		this.nomeResponsavel = nomeResponsavel;
	}

	public String getDescricaoEspaco() {
		return descricaoEspaco;
	}

	public void setDescricaoEspaco(String descricaoEspaco) {
		this.descricaoEspaco = descricaoEspaco;
	}
	
	//Metodos
}
