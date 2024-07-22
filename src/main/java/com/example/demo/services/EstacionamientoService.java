package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.models.Estacionamiento;
import com.example.demo.repositories.EstacionamientoRepository;

@Service
public class EstacionamientoService {
	@Autowired
	private EstacionamientoRepository estacionamientoRepository;

	public Estacionamiento registrarEstacionamiento(Estacionamiento estacionamiento) {
		return estacionamientoRepository.save(estacionamiento);
	}

	public List<Estacionamiento> obtenerTodosLosEstacionamientos() {
		return estacionamientoRepository.findAll();
	}

	public Estacionamiento obtenerEstacionamientoPorId(Long id) {
		return estacionamientoRepository.findById(id).orElse(null);
	}

	public void eliminarEstacionamiento(Long id) {
		estacionamientoRepository.deleteById(id);
	}
}
