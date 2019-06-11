package fsk.formations.gl.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@DiscriminatorValue("ce")
@Entity
public class CompteEpargne extends Compte{

	private double interet;
	
	public CompteEpargne() {
		super();
	}
	
	public CompteEpargne(Date dateCreation, double solde, double interet) {
		super(dateCreation, solde);
		this.interet = interet;
	}

	public double getInteret() {
		return interet;
	}

	public void setInteret(double interet) {
		this.interet = interet;
	}
	
	
	
}
