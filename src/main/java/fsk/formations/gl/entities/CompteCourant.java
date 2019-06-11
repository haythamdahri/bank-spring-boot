package fsk.formations.gl.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@DiscriminatorValue("cc")
@Entity
public class CompteCourant extends Compte {
	
	private double decouvert;
	
	public CompteCourant() {
		super();
	}
	
	public CompteCourant(Date dateCreation, double solde, double decouvert) {
		super(dateCreation, solde);
		this.decouvert = decouvert;
	}

	public double getDecouvert() {
		return decouvert;
	}

	public void setDecouvert(double decouvert) {
		this.decouvert = decouvert;
	}
	
	
	
}
