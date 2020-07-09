package com.ebot.ebotgo;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.net.URI;
import java.net.URISyntaxException;

@Configuration
@ComponentScan(basePackages = { "com.ebot.ebotgo" })
@EnableTransactionManagement
public class AppContext {
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        URI jdbUri = null;
        try {
            jdbUri = new URI(System.getenv("JAWSDB_URL"));
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://" + jdbUri.getHost() + ":" + jdbUri.getPort() + jdbUri.getPath());
        dataSource.setUsername(jdbUri.getUserInfo().split(":")[0]);
        dataSource.setPassword(jdbUri.getUserInfo().split(":")[1]);

        return dataSource;
    }

    @Bean("sqlSession")
    public SqlSessionFactory sessionFactory() throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        Resource resource = new ClassPathResource("SqlMapConfig.xml");
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setConfigLocation(resource);
//        sessionFactory.setMapperLocations(resourceLoader.getResources("/src/main/resources/mapper/*.xml"));
        return sessionFactory.getObject();
    }

    @Bean
    SqlSessionTemplate sqlSessionTemplate() throws Exception {

        SqlSessionTemplate sqlSessionTemplate = new SqlSessionTemplate(sessionFactory());

        return sqlSessionTemplate;

    }

    @Bean
    public DataSourceTransactionManager transactionManager() {

        return new DataSourceTransactionManager(dataSource());

    }
}
