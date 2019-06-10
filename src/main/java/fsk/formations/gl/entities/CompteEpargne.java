package fsk.formations.gl.entities;

import java.util.Date;

import javax.persistence.DiscriminatorValue;

@DiscriminatorValue("ce")
public class CompteEpargne extends Compte{

	private double interet;
	
	public CompteEpargne() {
		super();
	}
	
	public CompteEpargne(Date dateCreation, double solde, double interet) {
		super(dateCreation, solde);
		this.interet = interet;
	}
	
}
