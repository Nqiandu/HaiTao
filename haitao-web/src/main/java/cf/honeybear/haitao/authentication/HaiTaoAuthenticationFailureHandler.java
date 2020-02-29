package cf.honeybear.haitao.authentication;

import cf.honeybear.haitao.utils.UserUtils;
import cf.honeybear.haitao.vo.Result;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Component("haiTaoAuthenticationFailureHandler")
public class HaiTaoAuthenticationFailureHandler implements AuthenticationFailureHandler {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        logger.info("登陆失败");
        //response.setStatus(HttpStatus.INTERNAL_SERVER_ERROR.value());
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Result result = Result.erro("登陆失败!");
        if (e instanceof LockedException) {
            result.setMsg("账户被锁定，请联系管理员!");
        } else if (e instanceof CredentialsExpiredException) {
            result.setMsg("密码过期，请联系管理员!");
        } else if (e instanceof AccountExpiredException) {
            result.setMsg("账户过期，请联系管理员!");
        } else if (e instanceof DisabledException) {
            result.setMsg("账户被禁用，请联系管理员!");
        } else if (e instanceof BadCredentialsException) {
            result.setMsg("用户名或者密码输入错误，请重新输入!");
        }
        out.write(new ObjectMapper().writeValueAsString(result));
        out.flush();
        out.close();
    }

}
