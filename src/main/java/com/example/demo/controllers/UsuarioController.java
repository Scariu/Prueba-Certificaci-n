package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.models.Usuario;
import com.example.demo.repositories.UsuarioRepository;
import com.example.demo.services.UsuarioDetailServiceImpl;
import com.example.demo.services.UsuarioService;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	@Autowired
	private UsuarioRepository usuarioRepository;
	@Autowired
	private UsuarioService usuarioService;
	@Autowired
	private UsuarioDetailServiceImpl userDetailsService;

	@GetMapping("/registro")
	public String mostrarFormularioRegistro(Model model) {
		model.addAttribute("usuario", new Usuario());
		return "registro";
	}

	@PostMapping("/registro")
	public String registerUser(@ModelAttribute Usuario usuario) {
		usuario.setContrasena(new BCryptPasswordEncoder().encode(usuario.getContrasena()));
		usuario.setRole("USER");
		usuarioRepository.save(usuario);
		return "redirect:/login";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model) {

		try {

			UserDetails userDetails = userDetailsService.loadUserByUsername(username);
			Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null,
					userDetails.getAuthorities());
			SecurityContextHolder.getContext().setAuthentication(authentication);
			model.addAttribute("currentUser", usuarioService.obtenerUsuarioPorCorreo(userDetails.getUsername()));
			return "redirect:/users/home";

		} catch (UsernameNotFoundException | BadCredentialsException e) {
			model.addAttribute("errorMessage", "Credenciales inválidas. Intenta nuevamente.");
			return "login";
		}
	}

	@GetMapping("/logout")
	public String logoutUsuario() {
		return "redirect:/login";
	}
}
