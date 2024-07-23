package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
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
}
