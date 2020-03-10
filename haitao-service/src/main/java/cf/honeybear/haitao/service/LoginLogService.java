package cf.honeybear.haitao.service;

import cf.honeybear.haitao.entity.LoginLog;
import cf.honeybear.haitao.mapper.LoginLogMapper;
import cf.honeybear.haitao.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginLogService {

  @Autowired private LoginLogMapper loginLogMapper;

  /**
   * 添加日志类别
   *
   * @param loginLog
   */
  public void add(LoginLog loginLog) {
    loginLogMapper.insert(loginLog);
  }

  /**
   * 获取最后登陆时间和用户名
   *
   * @return
   */
  public List<LoginLog> getLastTimeById() {
    int username = UserUtils.getCurrentUser().getId();
    return loginLogMapper.getLastTimeById(username);
  }
}
