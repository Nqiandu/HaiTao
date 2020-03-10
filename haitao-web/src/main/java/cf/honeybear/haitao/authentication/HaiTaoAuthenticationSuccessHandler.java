package cf.honeybear.haitao.authentication;

import cf.honeybear.haitao.entity.LoginLog;
import cf.honeybear.haitao.entity.User;
import cf.honeybear.haitao.service.LoginLogService;
import cf.honeybear.haitao.utils.UserUtils;
import cf.honeybear.haitao.utils.WebUtil;
import cf.honeybear.haitao.vo.Result;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@Component("haiTaoAuthenticationSuccessHandler")
public class HaiTaoAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    private Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private LoginLogService loginLogService;
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        logger.info("登陆成功"+ ","+"用户名是："+UserUtils.getCurrentUser().getUsername());
        String loginName = authentication.getName();
        String name = UserUtils.getCurrentUser().getName();
        //String browser = request.getHeader("user‐agent");
        //String ip = request.getRemoteAddr();
        LoginLog loginLog = new LoginLog();
        loginLog.setLoginname(loginName);
        loginLog.setIp(WebUtil.getIpAddr(request));
        loginLog.setBrowserName(WebUtil.getRequestBrowserInfo(request));
        loginLog.setLocation(WebUtil.getCityByIP(WebUtil.getIpAddr(request)));
        loginLog.setUid(UserUtils.getCurrentUser().getId());
        loginLog.setLandingtime(new Date());
        loginLog.setOs(WebUtil.getRequestOsInfo(request));
        loginLog.setName(name);
        loginLogService.add(loginLog);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        User user = (User) authentication.getPrincipal();//登陆成功的User对象
        user.setPassword(null);
        Result ok = Result.ok("登陆成功",user);
        String s = new ObjectMapper().writeValueAsString(ok);
        out.write(s);
        out.flush();
        out.close();
    }
}
