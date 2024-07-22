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
import com.example.demo.models.Vehiculo;
import com.example.demo.services.VehiculoService;

@Controller
@RequestMapping("/vehiculos")
public class VehiculoController {
	@Autowired
	private VehiculoService vehiculoService;

	@GetMapping
	public String listarVehiculos(Model model) {
		List<Vehiculo> vehiculos = vehiculoService.obtenerTodosLosVehiculos();
		model.addAttribute("vehiculos", vehiculos);
		return "vehiculos";
	}

	@GetMapping("/nuevo")
	public String mostrarFormularioNuevoVehiculo(Model model) {
		model.addAttribute("vehiculo", new Vehiculo());
		return "vehiculo-form";
	}

	@PostMapping("/nuevo")
	public String registrarVehiculo(@ModelAttribute Vehiculo vehiculo) {
		vehiculoService.registrarVehiculo(vehiculo);
		return "redirect:/vehiculos";
	}

	@GetMapping("/editar/{id}")
	public String mostrarFormularioEditarVehiculo(@PathVariable Long id, Model model) {
		Vehiculo vehiculo = vehiculoService.obtenerVehiculoPorId(id);
		model.addAttribute("vehiculo", vehiculo);
		return "vehiculo-form";
	}

	@PostMapping("/editar/{id}")
	public String actualizarVehiculo(@PathVariable Long id, @ModelAttribute Vehiculo vehiculo) {
		vehiculo.setId(id);
		vehiculoService.registrarVehiculo(vehiculo);
		return "redirect:/vehiculos";
	}

	@PostMapping("/eliminar/{id}")
	public String eliminarVehiculo(@PathVariable Long id) {
		vehiculoService.eliminarVehiculo(id);
		return "redirect:/vehiculos";
	}
}
