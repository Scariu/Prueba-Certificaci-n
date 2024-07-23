package com.example.demo.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.demo.models.Usuario;
import com.example.demo.repositories.UsuarioRepository;

@Service
public class UsuarioService {
	@Autowired
	private UsuarioRepository usuarioRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;

	public Usuario registrarUsuario(Usuario usuario) {
		return usuarioRepository.save(usuario);
	}

	public List<Usuario> obtenerTodosLosUsuarios() {
		return usuarioRepository.findAll();
	}

	public Usuario obtenerUsuarioPorId(Long id) {
		return usuarioRepository.findById(id).orElse(null);
	}

	public Usuario obtenerUsuarioPorCorreo(String correo) {
		return usuarioRepository.findByCorreo(correo);
	}

	public boolean existeUsuarioPorDni(String dni) {
		return usuarioRepository.existsByDni(dni);
	}

	public boolean existeUsuarioPorCorreo(String correo) {
		return usuarioRepository.existsByCorreo(correo);
	}

	public void eliminarUsuario(Long id) {
		usuarioRepository.deleteById(id);
	}

	public void registrar(Usuario usuario) {
		usuario.setContrasena(passwordEncoder.encode(usuario.getContrasena()));
		usuarioRepository.save(usuario);
	}
}