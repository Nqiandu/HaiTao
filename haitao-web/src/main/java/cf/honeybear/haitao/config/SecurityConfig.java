package cf.honeybear.haitao.config;

import cf.honeybear.haitao.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private final UserService userService;
    private final AuthenticationSuccessHandler haiTaoAuthenticationSuccessHandler;
    private final AuthenticationFailureHandler haiTaoAuthenticationFailureHandler;
    private final LogoutSuccessHandler logoutSuccessHandler;

    @Autowired
    public SecurityConfig(UserService userService, AuthenticationSuccessHandler haiTaoAuthenticationSuccessHandler, AuthenticationFailureHandler haiTaoAuthenticationFailureHandler, LogoutSuccessHandler logoutSuccessHandler) {
        this.userService = userService;
        this.haiTaoAuthenticationSuccessHandler = haiTaoAuthenticationSuccessHandler;
        this.haiTaoAuthenticationFailureHandler = haiTaoAuthenticationFailureHandler;
        this.logoutSuccessHandler = logoutSuccessHandler;
    }

    @Bean
    PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(new BCryptPasswordEncoder());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers(HttpMethod.GET,

                "/resource/**/*.js",
                "/resource/**/*.css",
                "/resource/**/*.woff",
                "/resource/**/*.ttf",
                "/resource/**/*.jpg",
                "/resource/**/*.png",
                "/resource/**/*.gif");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .formLogin()
                    .usernameParameter("username")
                    .passwordParameter("password")
                    .loginProcessingUrl("/doLogin")
                    .loginPage("/authentication/require")
                    .successHandler(haiTaoAuthenticationSuccessHandler)
                    .failureHandler(haiTaoAuthenticationFailureHandler)
                    .permitAll()
                .and()
                .logout()
                    .logoutUrl("/logout")
                    .logoutSuccessHandler(logoutSuccessHandler)
                    .deleteCookies("JSESSIONID")
                .permitAll()
                .and()
                .authorizeRequests()
                .antMatchers("/authentication/require",
                        "/login.jsp").permitAll()
                .anyRequest().authenticated()
                .and()
                .csrf().disable().exceptionHandling();
    }
}
