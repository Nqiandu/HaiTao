package cf.honeybear.haitao.authentication;

import cf.honeybear.haitao.entity.User;
import cf.honeybear.haitao.utils.UserUtils;
import cf.honeybear.haitao.vo.Result;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Component("haiTaoAuthenticationSuccessHandler")
public class HaiTaoAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        logger.info("登陆成功"+ ","+"用户名是："+UserUtils.getCurrentHr().getUsername());
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        User user = (User) authentication.getPrincipal();//登陆成功的User对象
        user.setPassword(null);
        Result ok = Result.ok("登陆成功",user);
    System.out.println("11111111111111111111111"+ok);
        String s = new ObjectMapper().writeValueAsString(ok);
        out.write(s);
        out.flush();
        out.close();
    }
}
