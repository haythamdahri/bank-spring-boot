package fsk.formations.gl.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Entity implementation class for Entity: Employe
 *
 */
@Entity
@Table(name="employes")
@NamedQueries(value= {
		@NamedQuery(name="findAll", query="SELECT e from Employe as e"),
		@NamedQuery(name="findEmploye", query="SELECT e from Employe as e where e.idEmploye = :id")
})
public class Employe implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private Long idEmploye;
	
	@Column(name="nom")
	private String nomEmploye;
	
	@ManyToOne(cascade= {CascadeType.DETACH, 
						CascadeType.MERGE, 
						CascadeType.PERSIST,
						CascadeType.REFRESH})
	@JoinColumn(name="superieur_id",nullable=true)
	private Employe employeSuperieur;
	
	@ManyToMany
	@JoinTable(name="employe_groupe",
				joinColumns=@JoinColumn(name="employe_id"),
				inverseJoinColumns=@JoinColumn(name="groupe_id"))
	private List<Groupe> groupes;
	
	@OneToMany(mappedBy="employe")
	private List<Operation> operations;


	private static final long serialVersionUID = 1L;

	public Employe() {
		super();
	}  

	public Employe(String nomEmploye) {
		this.nomEmploye = nomEmploye;
	}

	public List<Operation> getOperations() {
		return operations;
	}

	public void setOperations(List<Operation> operations) {
		this.operations = operations;
	}
	
	public List<Groupe> getGroupes() {
		return groupes;
	}

	public void setGroupes(List<Groupe> groupes) {
		this.groupes = groupes;
	}
	
	
	
	public Employe getEmployeSuperieur() {
		return employeSuperieur;
	}

	public void setEmployeSuperieur(Employe employeSuperieur) {
		this.employeSuperieur = employeSuperieur;
	}
	
	public Long getIdEmploye() {
		return this.idEmploye;
	}

	public void setIdEmploye(Long idEmploye) {
		this.idEmploye = idEmploye;
	}   
	public String getNomEmploye() {
		return this.nomEmploye;
	}

	public void setNomEmploye(String nomEmploye) {
		this.nomEmploye = nomEmploye;
	}
	
	public String toString() {
		return "Id: " + this.idEmploye + " | Nom: " + this.nomEmploye;
	}
	
	public void ajouterOperation(Operation operation) {
		if( this.operations == null ) {
			this.operations = new ArrayList<Operation>();
		}
		this.operations.add(operation);
	}
	
	
	
	
	
	
	
	
	
   
}
