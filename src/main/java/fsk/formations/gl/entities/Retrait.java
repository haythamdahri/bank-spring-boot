package fsk.formations.gl.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;

@DiscriminatorValue("r")
public class Retrait extends Operation{

	public Retrait() {
		super();
	}
	
	public Retrait(Date dateOperation, double montant) {
		super(dateOperation, montant);
	}
	
}
