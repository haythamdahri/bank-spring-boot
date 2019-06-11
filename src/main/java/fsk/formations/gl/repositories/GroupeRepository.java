package fsk.formations.gl.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fsk.formations.gl.entities.Groupe;

@Repository
public interface GroupeRepository extends JpaRepository<Groupe, Long>{

}
