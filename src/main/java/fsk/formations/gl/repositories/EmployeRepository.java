package fsk.formations.gl.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fsk.formations.gl.entities.Employe;
import fsk.formations.gl.entities.Groupe;

@Repository
public interface EmployeRepository extends JpaRepository<Employe, Long> {

	public Collection<Employe> findByGroupesContaining(@Param("groupe") Groupe groupe);
	
}
