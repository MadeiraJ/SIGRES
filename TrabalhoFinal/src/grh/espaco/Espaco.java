package grh.espaco;

import java.io.Serializable;
import grh.utilizador.Utilizador;

public class Espaco implements Serializable {
	//Atributos
	private static final long serialVersionUID = 6223935043550953725L;
	
	private int espacoId;
	private String nomeEspaco;
	private int piso;
	private String edificio;
	private int nComputadores;
	private String projetor;
	private int nLugares;
	private String outrasCaracteristicas;
	private String nomeResponsavel;
	private int id_responsavel;
	
	//Construtores
	public Espaco() {
		
	}
	
	public Espaco(int espacoId, String nomeEspaco, int nComputadores, String projetor,
			int nLugares, String outrasCaracteristicas,String nomeResponsavel) {
		super();
		this.espacoId = espacoId;
		this.nomeEspaco = nomeEspaco;
		this.nComputadores = nComputadores;
		this.projetor = projetor;
		this.nLugares = nLugares;
		this.outrasCaracteristicas = outrasCaracteristicas;
		this.nomeResponsavel = nomeResponsavel;
	}
	
	public Espaco(int espacoId, String nomeEspaco, int piso, String edificio, int nComputadores, String projetor,
			int nLugares, String outrasCaracteristicas, int id_responsavel) {
		super();
		this.espacoId = espacoId;
		this.nomeEspaco = nomeEspaco;
		this.piso = piso;
		this.edificio = edificio;
		this.nComputadores = nComputadores;
		this.projetor = projetor;
		this.nLugares = nLugares;
		this.outrasCaracteristicas = outrasCaracteristicas;
		this.id_responsavel = id_responsavel;
	}
	
	
	
	//Acessores
	public Espaco(String nomeEspaco){
		this.nomeEspaco = nomeEspaco;
	}
	
	public int getEspacoId() {
		return espacoId;
	}

	public void setEspacoId(int espacoId) {
		this.espacoId = espacoId;
	}

	public String getNomeEspaco() {
		return nomeEspaco;
	}

	public void setNomeEspaco(String nomeEspaco) {
		this.nomeEspaco = nomeEspaco;
	}

	public int getPiso() {
		return piso;
	}

	public void setPiso(int piso) {
		this.piso = piso;
	}

	public String getEdificio() {
		return edificio;
	}

	public void setEdificio(String edificio) {
		this.edificio = edificio;
	}

	public int getnComputadores() {
		return nComputadores;
	}

	public void setnComputadores(int nComputadores) {
		this.nComputadores = nComputadores;
	}

	public String getProjetor() {
		return projetor;
	}

	public void setProjetor(String projetor) {
		this.projetor = projetor;
	}

	public String getOutrasCaracteristicas() {
		return outrasCaracteristicas;
	}

	public void setOutrasCaracteristicas(String outrasCaracteristicas) {
		this.outrasCaracteristicas = outrasCaracteristicas;
	}

	public String getNomeResponsavel() {
		return nomeResponsavel;
	}

	public void setNomeResponsavel(String nomeResponsavel) {
		this.nomeResponsavel = nomeResponsavel;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public int getnLugares() {
		return nLugares;
	}

	public void setnLugares(int nLugares) {
		this.nLugares = nLugares;
	}
	
	public int getId_responsavel() {
		return id_responsavel;
	}

	public void setId_responsavel(int id_responsavel) {
		this.id_responsavel = id_responsavel;
	}

	//Metodos
		
}
