package com.example.demo.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.demo.models.Estacionamiento;
import com.example.demo.services.EstacionamientoService;

@Controller
@RequestMapping("/estacionamientos")
public class EstacionamientoController {
	@Autowired
	private EstacionamientoService estacionamientoService;

	@GetMapping
	public String listarEstacionamientos(Model model) {
		List<Estacionamiento> estacionamientos = estacionamientoService.obtenerTodosLosEstacionamientos();
		model.addAttribute("estacionamientos", estacionamientos);
		return "estacionamientos";
	}

	@GetMapping("/nuevo")
	public String mostrarFormularioNuevoEstacionamiento(Model model) {
		model.addAttribute("estacionamiento", new Estacionamiento());
		return "estacionamiento-form";
	}

	@PostMapping("/nuevo")
	public String registrarEstacionamiento(@ModelAttribute Estacionamiento estacionamiento) {
		estacionamientoService.registrarEstacionamiento(estacionamiento);
		return "redirect:/estacionamientos";
	}

	@GetMapping("/editar/{id}")
	public String mostrarFormularioEditarEstacionamiento(@PathVariable Long id, Model model) {
		Estacionamiento estacionamiento = estacionamientoService.obtenerEstacionamientoPorId(id);
		model.addAttribute("estacionamiento", estacionamiento);
		return "estacionamiento-form";
	}

	@PostMapping("/editar/{id}")
	public String actualizarEstacionamiento(@PathVariable Long id, @ModelAttribute Estacionamiento estacionamiento) {
		estacionamiento.setId(id);
		estacionamientoService.registrarEstacionamiento(estacionamiento);
		return "redirect:/estacionamientos";
	}

	@PostMapping("/eliminar/{id}")
	public String eliminarEstacionamiento(@PathVariable Long id) {
		estacionamientoService.eliminarEstacionamiento(id);
		return "redirect:/estacionamientos";
	}

}
