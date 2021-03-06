package cf.honeybear.haitao.controller;

import cf.honeybear.haitao.vo.Result;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
public class SecurityController {
    private RequestCache requestCache = new HttpSessionRequestCache();
    private Logger logger = LoggerFactory.getLogger(getClass());
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

  /** 当需要身份认证时跳转到这里
   * @param request
   * @param response
   * @return
   * @throws IOException
   */
  @RequestMapping("/authentication/require")
  @ResponseStatus(code = HttpStatus.UNAUTHORIZED)
  public Result requireAuthentication(HttpServletRequest request, HttpServletResponse response)
      throws IOException {
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        if (savedRequest != null) {
            String target = savedRequest.getRedirectUrl();
            logger.info("引发跳转的请求是：" + target);
            if (StringUtils.endsWithIgnoreCase(target, ".html") |  StringUtils.endsWithIgnoreCase(target, ".jsp")) {
                redirectStrategy.sendRedirect(request, response, "/login.jsp");
            }
        }
        return new Result(401,"访问的服务需要身份认证，请到登录页");
    }

}
