package fsk.formations.gl.controllers;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fsk.formations.gl.entities.Client;
import fsk.formations.gl.entities.Compte;
import fsk.formations.gl.entities.CompteCourant;
import fsk.formations.gl.entities.CompteEpargne;
import fsk.formations.gl.entities.Employe;
import fsk.formations.gl.entities.Groupe;
import fsk.formations.gl.entities.Operation;
import fsk.formations.gl.repositories.ClientRepository;
import fsk.formations.gl.repositories.CompteCourantRepository;
import fsk.formations.gl.repositories.CompteEpargneRepository;
import fsk.formations.gl.repositories.CompteRepository;
import fsk.formations.gl.repositories.EmployeRepository;
import fsk.formations.gl.repositories.GroupeRepository;

@Controller
@RequestMapping(value = "")
public class BankController {

	@Autowired
	private ClientRepository clientRepository;

	@Autowired
	private EmployeRepository employeRepository;

	@Autowired
	private GroupeRepository groupeRepository;

	@Autowired
	private CompteRepository compteRepository;

	@Autowired
	private CompteCourantRepository compteCourantRepository;

	@Autowired
	private CompteEpargneRepository compteEpargneRepository;

	// --------------------------- Clients ---------------------------
	@GetMapping("/clients")
	public String getClientPage(@RequestParam(value = "id", required = false) Long idClient, Model model) {

		if (idClient != null) {
			model.addAttribute("client", this.clientRepository.findById(idClient));
		} else {
			model.addAttribute("client", new Client());
		}

		model.addAttribute("clients", this.clientRepository.findAll());
		return "clients";
	}

	@PostMapping("/clients")
	public String postClient(@ModelAttribute("client") Client client,
			@RequestParam(value = "deleteClient", required = false) Long idClient) {

		if (idClient != null) {
			this.clientRepository.deleteById(idClient);
			return "redirect:/clients";
		}

		this.clientRepository.save(client);
		return "redirect:/clients";
	}

	// --------------------------- Employes ---------------------------
	@GetMapping("/employes")
	public String getEmployePage(@RequestParam(value = "id", required = false) Long idEmploye, Model model) {

		if (idEmploye != null) {
			model.addAttribute("employe", this.employeRepository.findById(idEmploye).get());
		} else {
			model.addAttribute("employe", new Employe());
		}

		model.addAttribute("groupes", this.groupeRepository.findAll());
		model.addAttribute("employes", this.employeRepository.findAll());
		return "employes";
	}

	@PostMapping("/employes")
	public String postEmploye(@ModelAttribute("employe") Employe employe,
			@RequestParam(value = "deleteEmploye", required = false) Long idEmploye) {

		if (idEmploye != null) {
			this.employeRepository.deleteById(idEmploye);
			return "redirect:/employes";
		}

		// Affecter ses groupes
		if (employe.getIdEmploye() != null) {
			employe.setGroupes(this.employeRepository.findById(employe.getIdEmploye()).get().getGroupes());
		}
		this.employeRepository.save(employe);
		return "redirect:/employes";
	}

	// --------------------------- Groupes ---------------------------
	@GetMapping("/groupes")
	public String getGroupePage(@RequestParam(value = "id", required = false) Long idGroupe, Model model) {

		if (idGroupe != null) {
			model.addAttribute("groupe", this.groupeRepository.findById(idGroupe));
		} else {
			model.addAttribute("groupe", new Groupe());
		}

		model.addAttribute("groupes", this.groupeRepository.findAll());
		return "groupes";
	}

	@PostMapping("/groupes")
	public String postGroupe(@ModelAttribute("groupe") Groupe groupe,
			@RequestParam(value = "deleteGroupe", required = false) Long idGroupe) {

		if (idGroupe != null) {
			this.groupeRepository.deleteById(idGroupe);
			return "redirect:/groupes";
		}

		this.groupeRepository.save(groupe);
		return "redirect:/groupes";
	}

	// --------------------------- Employes ---------------------------
	@GetMapping("/operations")
	public String getOperationPage(@RequestParam(value = "id", required = false) Long numOperation, Model model) {

		if (numOperation != null) {
			model.addAttribute("operation", this.clientRepository.findById(numOperation));
		} else {
			model.addAttribute("client", new Client());
		}

		model.addAttribute("clients", this.clientRepository.findAll());
		return "clients";
	}

	@PostMapping("/operations")
	public String postOperation(@ModelAttribute("operation") Operation operation,
			@RequestParam(value = "deleteOperation", required = false) Long numOperation) {

		return null;
	}

	// --------------------------- Add Employe to groupe ---------------------------
	@PostMapping("/add-groupe-employe")
	public String postGroupeEmploye(@RequestParam("groupe") Long idGroupe, @RequestParam("employe") Long idEmploye) {
		Employe employe = this.employeRepository.findById(idEmploye).get();
		Groupe groupe = this.groupeRepository.findById(idGroupe).get();
		System.out.println(employe);
		System.out.println(groupe);
		if (!employe.getGroupes().contains(groupe)) {
			employe.ajouterGroupe(groupe);
		}
		this.employeRepository.save(employe);
		return "redirect:/employes";
	}

	// --------------------------- Comptes ---------------------------
	@GetMapping("/comptes")
	public String getComptePage(@RequestParam(value = "id", required = false) Long numCompte,
			@RequestParam(value = "employe", required = false) Long idEmploye, Model model) {

		if (numCompte != null) {
			Optional<CompteCourant> compteCourantOptional = this.compteCourantRepository.findById(numCompte);
			Optional<CompteEpargne> compteEpargneOptional = this.compteEpargneRepository.findById(numCompte);
			if( compteCourantOptional.isPresent() ) {
				model.addAttribute("isCourant", true);
				model.addAttribute("compte", compteCourantOptional.get());
				model.addAttribute("compteType", "courant");
			} else {
				model.addAttribute("isEpargne", true);
				model.addAttribute("compte", compteEpargneOptional.get());
				model.addAttribute("compteType", "epargne");
			}
			
		} else {
			model.addAttribute("compte", new Compte());
		}

		Map<Long, Client> clients = new HashMap<>();
		this.clientRepository.findAll().forEach(client -> {
			clients.put(client.getIdClient(), client);
		});

		Map<Long, Employe> employes = new HashMap<>();
		this.employeRepository.findAll().forEach(employe -> {
			employes.put(employe.getIdEmploye(), employe);
		});

		model.addAttribute("clients", clients);
		model.addAttribute("employes", employes);

		model.addAttribute("typeComptes", new String[] { "epargne", "courant" });

		if (idEmploye == null) {
			model.addAttribute("comptes", this.compteRepository.findAll());
		} else {
			model.addAttribute("comptes", this.compteRepository.findByEmployeIdEmploye(idEmploye));
		}
		return "comptes";
	}

	@PostMapping("/comptes")
	public String postCompte(@ModelAttribute("compte") Compte compte,
			@RequestParam(value = "typeCompte", required = false) String typeCompte,
			@RequestParam(value = "interet", required = false) String interet,
			@RequestParam(value = "decouvert", required = false) String decouvert,
			@RequestParam(value = "deleteCompte", required = false) Long numCompte) {

		System.out.println(compte.getNumCompte());
		
		if (numCompte != null) {
			this.compteRepository.deleteById(numCompte);
			return "redirect:/comptes";
		}

		if (typeCompte.equalsIgnoreCase("epargne")) {
			CompteEpargne cpt = new CompteEpargne();
			cpt.setNumCompte(compte.getNumCompte());
			cpt.setClient(compte.getClient());
			cpt.setEmploye(compte.getEmploye());
			cpt.setDateCreation(compte.getDateCreation());
			cpt.setSolde(compte.getSolde());
			cpt.setInteret(Double.parseDouble(interet));
			this.compteEpargneRepository.save(cpt);
		} else {
			CompteCourant cpt = new CompteCourant();
			cpt.setNumCompte(compte.getNumCompte());
			cpt.setClient(compte.getClient());
			cpt.setEmploye(compte.getEmploye());
			cpt.setDateCreation(compte.getDateCreation());
			cpt.setSolde(compte.getSolde());
			cpt.setDecouvert(Double.parseDouble(decouvert));
			this.compteCourantRepository.save(cpt);
		}

		return "redirect:/comptes";
	}

}
