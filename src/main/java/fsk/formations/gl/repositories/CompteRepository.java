package fsk.formations.gl.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fsk.formations.gl.entities.Compte;

@Repository
public interface CompteRepository extends JpaRepository<Compte, Long> {

	public Collection<Compte> findByEmployeIdEmploye(@Param("idEmploye") Long idEmploye);
	
	public Collection<Compte> findByClientIdClient(@Param("idClient") Long idClient);

}
