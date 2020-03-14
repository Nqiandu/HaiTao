package cf.honeybear.haitao.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.StringHttpMessageConverter;

import java.nio.charset.Charset;

/** @Author JN @Date 2020/3/14 17:31 @Version 1.0 */
@Configuration
public class SpringmvcConfig {

  /**
   * springmvc编码集处理
   *
   * @return
   */
  @Bean
  public StringHttpMessageConverter stringHttpMessageConverter() {
    StringHttpMessageConverter converter = new StringHttpMessageConverter(Charset.forName("UTF-8"));
    return converter;
  }

}
