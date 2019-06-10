package fsk.formations.gl.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fsk.formations.gl.entities.Client;
import fsk.formations.gl.repositories.ClientRepository;

@Controller
@RequestMapping(value = "")
public class BankController {
	
	@Autowired
	private ClientRepository clientRepository;

	@GetMapping("/clients")
	public String getClientPage(@RequestParam(value = "id", required=false) Long idClient,  Model model) {
		
		if( idClient != null ) {
			model.addAttribute("client", this.clientRepository.findById(idClient));
		} else {
			model.addAttribute("client", new Client());
		}
		
		model.addAttribute("clients", this.clientRepository.findAll());
		return "clients";
	}
	
	@PostMapping("/clients")
	public String postClient(@ModelAttribute("client") Client client, @RequestParam(value = "deleteClient", required = false) Long idClient) {
		
		if( idClient != null ) {
			this.clientRepository.deleteById(idClient);
			return "redirect:/clients";
		}
		
		this.clientRepository.save(client);
		return "redirect:/clients";
	}
	
}
