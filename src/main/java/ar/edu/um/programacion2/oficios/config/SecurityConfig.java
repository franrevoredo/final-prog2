package ar.edu.um.programacion2.oficios.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
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
	
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web.debug(true);
//    }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/administradors/**", "/admpanel/**", "/categorias/create-form", "/categorias/list", "/categorias/", "/categorias/dt", "/categorias/show", "/categorias",
				"/disponibilidads/create-form", "/localidads/create-form", "/categorias/list", "/disponibilidads/list",
				"/localidads/list", "/personae/list", "/clientes/list", "/prestadors/list", "/historials/create-form", "/historials/list", "/historials/show", "/historials/", "/historials/dt", "/historials/*/edit-form")
				.hasAuthority("ROLE_ADMINISTRADOR");
		http.authorizeRequests().antMatchers("/nuevo-servicio", "/mis-servicios", "/responder-calificacion/**")
				.hasAuthority("ROLE_PRESTADOR").antMatchers(HttpMethod.POST, "/servicios/").hasAuthority("ROLE_PRESTADOR");
		http.authorizeRequests()
				.antMatchers( "/add-fav/**", "/ver-cliente/**", "/editar-cliente/**", "/del-fav/**", "/pedir-servicio/**", "/nueva-calificacion/**", "/calificacionclientes/create-form", "/calificacionclientes/")
				.hasAuthority("ROLE_CLIENTE");
		http.authorizeRequests().antMatchers("/buscar/**", "/myprofile", "/calificacionprestadors/dt", "/calificacionprestadors/s2", "/calificacionclientes/dt", "/calificacionclientes/s2").authenticated().and().formLogin()
				.loginPage("/login").and().logout().logoutUrl("/logout").logoutSuccessUrl("/");
		http.authorizeRequests()
				.antMatchers("/public/**", "/js/**", "/webjars/**", "/", "/clientyes/create-form",
						"/prestadors/create-form", "/ver-servicio/**", "/categorias/s2", "/disponibilidads/s2",
						"/localidads/s2", "/testuser", "/servicios/s2", "/clientes/s2", "/historials/s2")
				.permitAll().anyRequest().anonymous();
		http.csrf().disable();
	}
}
