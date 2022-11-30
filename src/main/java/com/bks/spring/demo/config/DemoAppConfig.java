package com.bks.spring.demo.config;

import java.util.logging.Logger;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages="com.bks.spring.demo")
@PropertySource("classpath:mysql.properties")
public class DemoAppConfig {
	
	@Autowired
	private Environment env;
	
	private Logger logger=Logger.getLogger(getClass().getName());
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver vs = new InternalResourceViewResolver();
		vs.setPrefix("WEB-INF/view/");
		vs.setSuffix(".jsp");
		return vs;
	}
	
	@Bean
	public DataSource securityDataSource() {
		ComboPooledDataSource securityDataSource = new ComboPooledDataSource();
		try {
			securityDataSource.setDriverClass(env.getProperty("jdbc.driver"));
		} catch (Exception e) {
			logger.info("there are some exception in democonfig applicationin securitydatasource\n"+e);
		}
		securityDataSource.setJdbcUrl(env.getProperty("jdbc.url"));
		securityDataSource.setPassword(env.getProperty("jdbc.password"));
		securityDataSource.setUser(env.getProperty("jdbc.user"));
		
		logger.info("jdbc url is: "+env.getProperty("jdbc.url"));
		logger.info("jdbc user is: "+env.getProperty("jdbc.user"));
		
		securityDataSource.setInitialPoolSize(Integer.parseInt(env.getProperty("connection.pool.initialPoolSize")));
		securityDataSource.setMinPoolSize(Integer.parseInt(env.getProperty("connection.pool.minPoolSize")));
		securityDataSource.setMaxPoolSize(Integer.parseInt(env.getProperty("connection.pool.maxPoolSize")));
		securityDataSource.setMaxIdleTime(Integer.parseInt(env.getProperty("connection.pool.maxIdleTime")));
		return securityDataSource;
	}
}
