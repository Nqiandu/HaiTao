package cf.honeybear.haitao.controller;

import cf.honeybear.haitao.entity.LoginLog;
import cf.honeybear.haitao.entity.Menu;
import cf.honeybear.haitao.service.LoginLogService;
import cf.honeybear.haitao.service.MenuService;
import cf.honeybear.haitao.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MenuController {

  @Autowired private MenuService menuService;

  @Autowired private LoginLogService loginLogService;

  /**
   * 一级菜单
   *
   * @return
   */
  @RequestMapping("/accordion")
  public List<Menu> getFirstMenusByUserId() {
    Integer uid = UserUtils.getCurrentUser().getId();
    return menuService.getFirstMenusByUserId(uid);
  }

  /**
   * 二级菜单
   *
   * @param pid
   * @return
   */
  @RequestMapping("/permission/{pid}")
  public List<Menu> getChildrenMenusByUserId(@PathVariable("pid") Integer pid) {
    return menuService.getChildrenMenusByUserId(pid);
  }

  /**
   * 获取登陆名字
   *
   * @return
   */
  @RequestMapping("/getUser")
  public String getUser() {
    return UserUtils.getCurrentUser().getName();
  }

  @RequestMapping("/getLasttimeById")
  public List<LoginLog> getLastTimeById() {
    return loginLogService.getLastTimeById();
  }
}
