package fsk.formations.gl.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fsk.formations.gl.entities.Compte;
import fsk.formations.gl.entities.CompteCourant;

@Repository
public interface CompteCourantRepository extends JpaRepository<CompteCourant, Long> {

	public Collection<Compte> findByEmployeIdEmploye(@Param("idEmploye") Long idEmploye);
	
}
