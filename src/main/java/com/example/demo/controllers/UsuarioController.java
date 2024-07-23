package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.demo.models.Usuario;
import com.example.demo.repositories.UsuarioRepository;
//import com.example.demo.services.UsuarioDetailServiceImpl;
//import com.example.demo.services.UsuarioService;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	@Autowired
	private UsuarioRepository usuarioRepository;
	//@Autowired
	//private UsuarioService usuarioService;
	//@Autowired
	//private UsuarioDetailServiceImpl userDetailsService;

	@GetMapping("/registro")
	public String mostrarFormularioRegistro(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "registro";
	}

	@PostMapping("/registro")
	public String registerUser(@ModelAttribute Usuario usuario) {
		usuario.setContrasena(new BCryptPasswordEncoder().encode(usuario.getContrasena()));
		//usuario.setRole("USER");
		usuarioRepository.save(usuario);
		return "redirect:/login";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	//Verificación en SecurityConfig
/*
	@PostMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model) {

		try {

			UserDetails userDetails = userDetailsService.loadUserByUsername(username);
			Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null,
					userDetails.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
			model.addAttribute("currentUser", usuarioService.obtenerUsuarioPorCorreo(userDetails.getUsername()));
			return "redirect:/";

		} catch (UsernameNotFoundException | BadCredentialsException e) {
			model.addAttribute("errorMessage", "Credenciales inválidas. Intenta nuevamente.");
			return "login";
		}
	}*/

	@PostMapping("/logout")
	public String logoutUsuario() {
		return "redirect:/login";
	}
}
