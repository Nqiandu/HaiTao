package cf.honeybear.haitao.service;

import cf.honeybear.haitao.CacheI.AreaI;
import cf.honeybear.haitao.CacheI.CityI;
import cf.honeybear.haitao.CacheI.City_T;
import cf.honeybear.haitao.CacheI.ProvinceI;
import cf.honeybear.haitao.entity.AreaInfo;
import cf.honeybear.haitao.mapper.AreaInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/** 省市区 */
@Service
public class AreaInfoService {

  public AreaInfoService() {
    System.out.println("已被实例化。。。。。。。。。。。。。。。。");
  }

  @Autowired private AreaInfoMapper areaInfoMapper;


  /**
   * 省
   *
   * @return
   */
  public List<AreaInfo> getProvance() {
    return areaInfoMapper.getProvance();
  }

  /**
   * 市
   *
   * @param pid
   * @return
   */
  public List<AreaInfo> getCity(Integer pid) {
    return areaInfoMapper.getCity(pid);
  }

  /**
   * 区
   *
   * @param pid
   * @return
   */
  public List<AreaInfo> getArea(Integer pid) {
    return areaInfoMapper.getArea(pid);
  }

  /**
   * 获取省份
   *
   * @return 注意返回的是接口
   */
  public List<ProvinceI> getAllProvince() {
    List<ProvinceI> allProvince = areaInfoMapper.getAllProvince();
    return allProvince;
  }

  /** 获取城市
   * @param id
   * @reurn 注意返回的是接口
   */
  public List<City_T> getAllCityOfProvince(Integer id) {
    List<City_T> allCityOfProvince = areaInfoMapper.getAllCityOfProvince(id);
    return allCityOfProvince;
  }

  public List<CityI> getAllCity(){
      List<City_T> allCityOfProvince = areaInfoMapper.getAllCity();
      return new ArrayList<>();
  }

  /** 获取区
   * @param id
   * @return 注意返回的是接口
   */
  public List<AreaI> getAllAreaOfCity(Integer id) {
    List<AreaI> allAreaOfCity = areaInfoMapper.getAllAreaOfCity(id);
    return allAreaOfCity;
  }
}
