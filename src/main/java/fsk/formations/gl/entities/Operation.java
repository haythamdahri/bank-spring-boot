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
@Table(name="operations")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="operationType", 
					discriminatorType=DiscriminatorType.STRING, length=2)
public class Operation implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="num")
	private Long numOperation;
	
	@Column(name="date_operation")
	@Temporal(TemporalType.DATE)
	private Date dateOperation;
	
	@Column(name="montant")
	private double montant;
	
	@ManyToOne
	@JoinColumn(name="employe_id")
	private Employe employe;
	
	@ManyToOne
	@JoinColumn(name="compte_id")
	private Compte compte;
	
	public Operation() {}

	public Operation(Date dateOperation, double montant) {
		this.dateOperation = dateOperation;
		this.montant = montant;
	}

	public Compte getCompte() {
		return compte;
	}

	public void setCompte(Compte compte) {
		this.compte = compte;
	}

	public Employe getEmploye() {
		return employe;
	}

	public void setEmploye(Employe employe) {
		this.employe = employe;
		this.employe.ajouterOperation(this);
	}
	
	public Long getNumOperation() {
		return numOperation;
	}

	public void setNumOperation(Long numOperation) {
		this.numOperation = numOperation;
	}

	public Date getDateOperation() {
		return dateOperation;
	}

	public void setDateOperation(Date dateOperation) {
		this.dateOperation = dateOperation;
	}

	public double getMontant() {
		return montant;
	}

	public void setMontant(double montant) {
		this.montant = montant;
	}
	
	
	
}
