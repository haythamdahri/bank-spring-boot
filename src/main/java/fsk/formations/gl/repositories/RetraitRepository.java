package fsk.formations.gl.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fsk.formations.gl.entities.Retrait;

@Repository
public interface RetraitRepository extends JpaRepository<Retrait, Long> {

}
