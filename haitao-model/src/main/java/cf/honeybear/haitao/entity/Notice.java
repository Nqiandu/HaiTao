package cf.honeybear.haitao.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/** 公告 */
@Data
public class Notice implements Serializable {

  private Integer id;

  @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd")
  private Date releasetime;

  private String notice;

  private String ename;

  public Notice(Integer id, Date releasetime, String notice, String ename) {
    this.id = id;
    this.releasetime = releasetime;
    this.notice = notice;
    this.ename = ename;
  }
  public Notice() {

  }
}
