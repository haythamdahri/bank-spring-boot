package fsk.formations.gl.repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fsk.formations.gl.entities.Client;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {

	public Collection<Client> findByNomClientIgnoreCaseContaining(@Param("nomClient") String nomClient);
	
}
