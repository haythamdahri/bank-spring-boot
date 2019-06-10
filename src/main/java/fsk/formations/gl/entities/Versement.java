package fsk.formations.gl.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;



@DiscriminatorValue("v")
public class Versement extends Operation{
	
	public Versement() {
		super();
	}
	
	public Versement(Date dateOperation, double montant) {
		super(dateOperation, montant);
	}
	
}
