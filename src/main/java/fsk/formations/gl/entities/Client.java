package fsk.formations.gl.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="clients")
public class Client implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long idClient;
	
	@Column(name="nom")
	private String nomClient;
	
	@OneToMany(mappedBy="client")
	private List<Compte> comptes;

	public Client() {}
	
	public Client(String nomClient) {
		this.nomClient = nomClient;
	}

	public List<Compte> getComptes() {
		return comptes;
	}

	public void setComptes(List<Compte> comptes) {
		this.comptes = comptes;
	}

	public Long getIdClient() {
		return idClient;
	}

	public void setIdClient(Long idClient) {
		this.idClient = idClient;
	}

	public String getNomClient() {
		return nomClient;
	}

	public void setNomClient(String nomClient) {
		this.nomClient = nomClient;
	}
	
	public String toString() {
		return "Id: " + this.idClient + " | Nom: " + this.nomClient;
	}
	
	public void ajouterCompte(Compte compte) {
		if( this.comptes == null ) {
			this.comptes = new ArrayList<Compte>();
		}
		this.comptes.add(compte);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
