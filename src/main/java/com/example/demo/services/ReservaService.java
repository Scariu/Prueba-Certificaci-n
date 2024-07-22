package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.models.Reserva;
import com.example.demo.repositories.ReservaRepository;

@Service
public class ReservaService {
	@Autowired
	private ReservaRepository reservaRepository;

	public Reserva registrarReserva(Reserva reserva) {
		return reservaRepository.save(reserva);
	}

	public List<Reserva> obtenerTodasLasReservas() {
		return reservaRepository.findAll();
	}

	public List<Reserva> obtenerReservasPorUsuarioId(Long usuarioId) {
		return reservaRepository.findByUsuarioId(usuarioId);
	}

	public Reserva obtenerReservaPorId(Long id) {
		return reservaRepository.findById(id).orElse(null);
	}

	public void eliminarReserva(Long id) {
		reservaRepository.deleteById(id);
	}

	public void actualizarReserva(Reserva reserva) {
		reservaRepository.save(reserva);
	}
}