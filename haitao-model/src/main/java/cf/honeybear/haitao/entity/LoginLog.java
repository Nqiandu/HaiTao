package cf.honeybear.haitao.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/** 登陆日志 */
public class LoginLog  {
  private Integer loginid;

  private Integer uid;
  @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
  private Date landingtime;

  private String ip;

  private String browserName;

  private String location;

  private String loginname;

  private String os;

  private String name;

  private static final long serialVersionUID = 1L;

  public Integer getLoginid() {
    return loginid;
  }

  public void setLoginid(Integer loginid) {
    this.loginid = loginid;
  }

  public Integer getUid() {
    return uid;
  }

  public void setUid(Integer uid) {
    this.uid = uid;
  }

  public Date getLandingtime() {
    return landingtime;
  }

  public void setLandingtime(Date landingtime) {
    this.landingtime = landingtime;
  }

  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip == null ? null : ip.trim();
  }

  public String getBrowserName() {
    return browserName;
  }

  public void setBrowserName(String browserName) {
    this.browserName = browserName == null ? null : browserName.trim();
  }

  public String getLocation() {
    return location;
  }

  public void setLocation(String location) {
    this.location = location == null ? null : location.trim();
  }

  public String getLoginname() {
    return loginname;
  }

  public void setLoginname(String loginname) {
    this.loginname = loginname == null ? null : loginname.trim();
  }

  public String getOs() {
    return os;
  }

  public void setOs(String os) {
    this.os = os == null ? null : os.trim();
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append(getClass().getSimpleName());
    sb.append(" [");
    sb.append("Hash = ").append(hashCode());
    sb.append(", loginid=").append(loginid);
    sb.append(", uid=").append(uid);
    sb.append(", landingtime=").append(landingtime);
    sb.append(", ip=").append(ip);
    sb.append(", browserName=").append(browserName);
    sb.append(", location=").append(location);
    sb.append(", loginname=").append(loginname);
    sb.append(", os=").append(os);
    sb.append(", name=").append(name);
    sb.append("]");
    return sb.toString();
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
}
