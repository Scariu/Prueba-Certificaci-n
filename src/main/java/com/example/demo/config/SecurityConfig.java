package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import com.example.demo.services.UsuarioDetailServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private UsuarioDetailServiceImpl userDetailsService;
	@Autowired
	private CustomAuth customAuth;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/", "/usuarios/login", "/usuarios/registro", "/h2-console/**", "/resources/**", "/css/**",
						"/js/**")
				.permitAll().antMatchers("/estacionamientos/nuevo", "/home-admin").hasRole("ADMIN")
				.antMatchers("/home-usuario").hasRole("USER").anyRequest().authenticated().and().formLogin()
				.loginPage("/usuarios/login").permitAll().successHandler(customAuth).and().logout().logoutUrl("/logout")
				.logoutSuccessUrl("/usuarios/login").permitAll().and().csrf().disable();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());
		auth.inMemoryAuthentication().withUser("admin").password(new BCryptPasswordEncoder().encode("admin"))
				.roles("ADMIN");
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/h2-console/**");
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}