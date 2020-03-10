package cf.honeybear.haitao.mapper;

import cf.honeybear.haitao.entity.AreaInfo;

import java.util.List;

/** 省市区三级 */
public interface AreaInfoMapper {

  /**
   * 省份
   *
   * @return
   */
  public List<AreaInfo> getProvance();

  /**
   * 市
   *
   * @param pid
   * @return
   */
  public List<AreaInfo> getCity(Integer pid);

  /**
   * 区/县
   *
   * @param pid
   * @return
   */
  public List<AreaInfo> getArea(Integer pid);
}
