package cf.honeybear.haitao.config;

import cf.honeybear.haitao.authentication.HaiTaoAuthenticationFailureHandler;
import cf.honeybear.haitao.logout.HaiTaoLogoutSuccessHandler;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

@Configuration
public class SecurityBeanConfig {

    /**
     * 退出时的处理策略配置
     * @return
     */
    @Bean
    @ConditionalOnMissingBean(LogoutSuccessHandler.class)
    public LogoutSuccessHandler logoutSuccessHandler() {
        return new HaiTaoLogoutSuccessHandler();
    }

    @Bean
    @ConditionalOnMissingBean(AuthenticationFailureHandler.class)
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new HaiTaoAuthenticationFailureHandler();
    }
}
