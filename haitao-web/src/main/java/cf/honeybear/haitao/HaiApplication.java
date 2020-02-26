package cf.honeybear.haitao;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
@MapperScan(basePackages = "cf.honeybear.haitao.mapper")
public class HaiApplication {
  public static void main(String[] args) {
      SpringApplication.run(HaiApplication.class,args);
  }
}
