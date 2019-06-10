package fsk.formations.gl.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="comptes")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="compteType", 
					discriminatorType=DiscriminatorType.STRING, length=3)
public class Compte implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="num")
	private Long numCompte;
	
	@Temporal(TemporalType.DATE)
	@Column(name="date_creation")
	private Date dateCreation;
	
	@Column(name="solde")
	private double solde;
	
	@ManyToOne
	@JoinColumn(name="client_id")
	private Client client;
	
	public Compte() {}
	
	public Compte(Date dateCreation, double solde) {
		this.dateCreation = dateCreation;
		this.solde = solde;
	}
	
	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
		this.client.ajouterCompte(this);
	}
	
	public Long getNumCompte() {
		return numCompte;
	}

	public void setNumCompte(Long numCompte) {
		this.numCompte = numCompte;
	}

	public Date getDateCreation() {
		return dateCreation;
	}

	public void setDateCreation(Date dateCreation) {
		this.dateCreation = dateCreation;
	}

	public double getSolde() {
		return solde;
	}

	public void setSolde(double solde) {
		this.solde = solde;
	}
	
	

}
		