package ar.edu.um.programacion2.oficios.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.accept.ContentNegotiationStrategy;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
@Order(1)
class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Override
	public void setContentNegotationStrategy(ContentNegotiationStrategy contentNegotiationStrategy) {
		super.setContentNegotationStrategy(contentNegotiationStrategy);
	}

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select username, password, enabled from persona where username=?")
				.authoritiesByUsernameQuery("select username, dtype from persona where username=?");

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/administradors/**", "/admpanel/**", "/categorias/create-form",
				"/disponibilidads/create-form", "/localidads/create-form", "/categorias/list", "/disponibilidads/list",
				"/localidads/list", "/personae/list", "/clientes/list", "/prestadors/list")
				.hasAuthority("ROLE_ADMINISTRADOR");
		http.authorizeRequests().antMatchers("/nuevo-servicio", "/calificacionprestadors/**", "/mis-servicios")
				.hasAuthority("ROLE_PRESTADOR");
		http.authorizeRequests()
				.antMatchers("/calificacionclientes/**", "/add-fav/**", "/ver-cliente/**", "/del-fav/**", "/pedir-servicio/**", "/nueva-calificacion/**")
				.hasAuthority("ROLE_CLIENTE");
		http.authorizeRequests().antMatchers("/buscar/**", "/myprofile").authenticated().and().formLogin()
				.loginPage("/login").and().logout().logoutUrl("/logout").logoutSuccessUrl("/");
		http.authorizeRequests()
				.antMatchers("/public/**", "/js/**", "/webjars/**", "/", "/clientes/create-form",
						"/prestadors/create-form", "/ver-servicio/**", "/categorias/s2", "/disponibilidads/s2",
						"/localidads/s2", "/testuser", "/servicios/s2", "/clientes/s2")
				.permitAll().anyRequest().anonymous();
		http.csrf().disable();
	}
}
