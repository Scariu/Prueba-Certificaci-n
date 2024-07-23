package com.example.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.example.demo.models.Usuario;

@Service
public class UsuarioDetailServiceImpl implements UserDetailsService {
	
	@Autowired
	private UsuarioService usuarioService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuario usuario = usuarioService.obtenerUsuarioPorCorreo(username);
		if (usuario == null) {
			throw new UsernameNotFoundException("Usuario no encontrado");
		}
		return org.springframework.security.core.userdetails.User.withUsername(usuario.getContrasena())
				.password(usuario.getContrasena()).roles(usuario.getRole()).build();
	}
}