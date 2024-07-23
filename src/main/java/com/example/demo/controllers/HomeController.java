package com.example.demo.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "home-usuario";
	}

	@GetMapping("/home-usuario")
	public String homeUsuario() {
		return "home-usuario";
	}

	@GetMapping("/home-admin")
	public String homeAdmin() {
		return "home";
	}

	@GetMapping("/home")
	public String homePage(Model model, Authentication authentication) {
		String role = authentication.getAuthorities().stream().map(grantedAuthority -> grantedAuthority.getAuthority())
				.findFirst().orElse("");

		if (role.equals("ROLE_ADMIN")) {
			return "redirect:/home-admin";
		} else if (role.equals("ROLE_USER")) {
			return "redirect:/home-usuario";
		}

		return "redirect:/";
	}
}
