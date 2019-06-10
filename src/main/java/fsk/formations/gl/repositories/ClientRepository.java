package fsk.formations.gl.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fsk.formations.gl.entities.Client;

@Repository
public interface ClientRepository extends JpaRepository<Client, Long> {

}
