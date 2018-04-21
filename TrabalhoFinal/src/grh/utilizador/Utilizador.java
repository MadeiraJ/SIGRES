package grh.utilizador;

import java.io.Serializable;
import grh.utilizador.Utilizador;

public class Utilizador implements Serializable{
	//Atributos
	private static final long serialVersionUID = 2464731736066673515L;
	
	private int utilizadorId;
	private String nomeutilizador;
	private String password;
	private String tipoUser;
	private String nome;
	private String email;
	private int nEspacos;
	
	//Construtores
	public Utilizador(int utilizadorId, String nomeutilizador, String password, String tipoUser, String nome,
			String email) {
		super();
		this.utilizadorId = utilizadorId;
		this.nomeutilizador = nomeutilizador;
		this.password = password;
		this.tipoUser = tipoUser;
		this.nome = nome;
		this.email = email;
	}
	
	
	public Utilizador(String nomeutilizador, String password, String tipoUser, String nome,
			String email) {
		super();
		this.nomeutilizador = nomeutilizador;
		this.password = password;
		this.tipoUser = tipoUser;
		this.nome = nome;
		this.email = email;
	}
	
	public Utilizador(String nomeutilizador,String nome, String email, int nEspacos){
		this.nomeutilizador = nomeutilizador;
		this.nome = nome;
		this.email = email;
		this.nEspacos = nEspacos;
	}
	
	//Acessores
	public int getnEspacos() {
		return nEspacos;
	}

	public void setnEspacos(int nEspacos) {
		this.nEspacos = nEspacos;
	}

	public int getUtilizadorId() {
		return utilizadorId;
	}

	public void setUtilizadorId(int utilizadorId) {
		this.utilizadorId = utilizadorId;
	}

	public String getNomeutilizador() {
		return nomeutilizador;
	}

	public void setNomeutilizador(String nomeutilizador) {
		this.nomeutilizador = nomeutilizador;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTipoUser() {
		return tipoUser;
	}

	public void setTipoUser(String tipoUser) {
		this.tipoUser = tipoUser;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	//Metodos
}
