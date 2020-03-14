package cf.honeybear.haitao.entity;

import java.io.Serializable;

/** 省市区三级表 */
public class AreaInfo implements Serializable {
  private Integer id;

  private String name;

  private Byte arealevel;

  private Integer parentid;

  private Address address;

  private static final long serialVersionUID = 1L;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name == null ? null : name.trim();
  }

  public Byte getArealevel() {
    return arealevel;
  }

  public void setArealevel(Byte arealevel) {
    this.arealevel = arealevel;
  }

  public Integer getParentid() {
    return parentid;
  }

  public void setParentid(Integer parentid) {
    this.parentid = parentid;
  }



  public Address getAddress() {
    return address;
  }

  public void setAddress(Address address) {
    this.address = address;
  }
}
