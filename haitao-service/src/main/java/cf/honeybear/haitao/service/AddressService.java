package cf.honeybear.haitao.service;

import cf.honeybear.haitao.entity.Address;
import cf.honeybear.haitao.mapper.AddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/** 地址信息
 * @Author JN
 * @Date 2020/3/4 20:48
 * @Version 1.0
 * */
@Service
public class AddressService {

  @Autowired private AddressMapper addressMapper;

  /** 添加地址
   * @param address
   * @return
   */
  public Integer addAddress(Address address) {
      return addressMapper.insert(address);
  }

  /** 删除地址
   * @param id
   * @return
   */
  public Integer deleteAddress(Integer id) {
      return addressMapper.deleteByPrimaryKey(id);
  }

  /** 修改地址
   * @param address
   * @return
   */
  public Integer updateAddress(Address address) {
      return addressMapper.updateByPrimaryKey(address);
  }

  /** 根据id查询信息
   * @param id
   * @return
   */
  public List<Address> selectByPrimaryKey(Integer id) {
      return addressMapper.selectByPrimaryKey(id);
  }
}
