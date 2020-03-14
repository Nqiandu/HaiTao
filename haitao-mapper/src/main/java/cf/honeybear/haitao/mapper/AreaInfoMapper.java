package cf.honeybear.haitao.mapper;

import cf.honeybear.haitao.CacheI.AreaI;
import cf.honeybear.haitao.CacheI.City_T;
import cf.honeybear.haitao.CacheI.ProvinceI;
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

  public List<ProvinceI> getAllProvince();

  public List<City_T> getAllCity();

  public List<City_T> getAllCityOfProvince(Integer pid);

  public List<AreaI> getAllAreaOfCity(Integer pid);
}
