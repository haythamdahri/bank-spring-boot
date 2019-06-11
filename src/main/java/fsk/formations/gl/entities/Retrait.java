package fsk.formations.gl.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@DiscriminatorValue("r")
@Entity
public class Retrait extends Operation{

	public Retrait() {
		super();
	}
	
	public Retrait(Date dateOperation, double montant, Employe employe, Compte compte) {
		super(dateOperation, montant, employe, compte);
	}
	
}
