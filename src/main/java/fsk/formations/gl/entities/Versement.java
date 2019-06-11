package fsk.formations.gl.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@DiscriminatorValue("v")
@Entity
public class Versement extends Operation {

	public Versement() {
		super();
	}

	public Versement(Date dateOperation, double montant, Employe employe, Compte compte) {
		super(dateOperation, montant, employe, compte);
	}

}
