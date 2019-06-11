package fsk.formations.gl.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fsk.formations.gl.entities.Versement;

@Repository
public interface VersementRepository extends JpaRepository<Versement, Long> {

}
