package cf.honeybear.haitao.service;

import cf.honeybear.haitao.entity.AreaInfo;
import cf.honeybear.haitao.mapper.AreaInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *
 * 省市区
 *
 * */
@Service
public class AreaInfoService {

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
}
