package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.models.Vehiculo;
import com.example.demo.repositories.VehiculoRepository;

@Service
public class VehiculoService {
	@Autowired
	private VehiculoRepository vehiculoRepository;

	public Vehiculo registrarVehiculo(Vehiculo vehiculo) {
		return vehiculoRepository.save(vehiculo);
	}

	public List<Vehiculo> obtenerTodosLosVehiculos() {
		return vehiculoRepository.findAll();
	}

	public List<Vehiculo> obtenerVehiculosPorUsuarioId(Long usuarioId) {
		return vehiculoRepository.findByUsuarioId(usuarioId);
	}

	public Vehiculo obtenerVehiculoPorId(Long id) {
		return vehiculoRepository.findById(id).orElse(null);
	}

	public void eliminarVehiculo(Long id) {
		vehiculoRepository.deleteById(id);
	}
}