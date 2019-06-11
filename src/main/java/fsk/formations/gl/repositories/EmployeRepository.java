package fsk.formations.gl.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fsk.formations.gl.entities.Employe;

@Repository
public interface EmployeRepository extends JpaRepository<Employe, Long> {

}
