
package com.bugtracking.config;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = "com.bugtracking")
public class SpringConfig {

    @Bean(destroyMethod = "")
    public SessionFactory sessionFactory() {
        return HibernateUtil.getSessionFactory();
    }
}
