package com.yan;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@MapperScan("com.yan.mappers")
@ServletComponentScan//扫描注解
@SpringBootApplication//指定类为应用启动类,自动扫描于当前类同级以及子包下的相应注解注册为spring beans
@EnableTransactionManagement//事务管理,自动提交数据库语句不用总是commit
public class PhotoApplication {

	public static void main(String[] args) {
		SpringApplication.run(PhotoApplication.class, args);
	}
}
