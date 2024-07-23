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
import com.example.demo.models.Reserva;
import com.example.demo.models.Vehiculo;
import com.example.demo.services.EstacionamientoService;
import com.example.demo.services.ReservaService;
import com.example.demo.services.VehiculoService;

@Controller
@RequestMapping("/reservas")
public class ReservaController {
	@Autowired
	private ReservaService reservaService;
	@Autowired
	private VehiculoService vehiculoService;
	@Autowired
	private EstacionamientoService estacionamientoService;

	@GetMapping
	public String listarReservas(Model model) {
		List<Reserva> reservas = reservaService.obtenerTodasLasReservas();
		model.addAttribute("reservas", reservas);
		return "mis-reservas";
	}

	@GetMapping("/nueva")
	public String mostrarFormularioNuevaReserva(Model model) {
		List<Vehiculo> vehiculos = vehiculoService.obtenerTodosLosVehiculos();
		List<Estacionamiento> estacionamientos = estacionamientoService.obtenerTodosLosEstacionamientos();
		model.addAttribute("vehiculos", vehiculos);
		model.addAttribute("estacionamientos", estacionamientos);
		model.addAttribute("reserva", new Reserva());
		return "reservar";
	}

	@PostMapping("/nueva")
	public String registrarReserva(@ModelAttribute Reserva reserva) {
		reservaService.registrarReserva(reserva);
		return "redirect:/reservas";
	}

	@GetMapping("/editar/{id}")
	public String mostrarFormularioEditarReserva(@PathVariable Long id, Model model) {
		Reserva reserva = reservaService.obtenerReservaPorId(id);
		List<Vehiculo> vehiculos = vehiculoService.obtenerTodosLosVehiculos();
		List<Estacionamiento> estacionamientos = estacionamientoService.obtenerTodosLosEstacionamientos();
		model.addAttribute("reserva", reserva);
		model.addAttribute("vehiculos", vehiculos);
		model.addAttribute("estacionamientos", estacionamientos);
		return "editar-reserva";
	}

	@PostMapping("/editar/{id}")
	public String actualizarReserva(@PathVariable Long id, @ModelAttribute Reserva reserva) {
		reserva.setId(id);
		reservaService.actualizarReserva(reserva);
		return "redirect:/reservas";
	}

	@PostMapping("/eliminar/{id}")
	public String eliminarReserva(@PathVariable Long id) {
		reservaService.eliminarReserva(id);
		return "redirect:/reservas";
	}

}
