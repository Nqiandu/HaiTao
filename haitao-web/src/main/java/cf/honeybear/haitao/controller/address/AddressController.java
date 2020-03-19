package cf.honeybear.haitao.controller.address;

import cf.honeybear.haitao.cache.CacheTool;
import cf.honeybear.haitao.entity.Address;
import cf.honeybear.haitao.mapper.AddressMapper;
import cf.honeybear.haitao.mapper.AreaInfoMapper;
import cf.honeybear.haitao.service.AddressService;
import cf.honeybear.haitao.service.AreaInfoService;
import cf.honeybear.haitao.vo.Result;
import cf.honeybear.haitao.vo.ResultBean;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/** 地址信息 @Author JN @Date 2020/3/4 21:04 @Version 1.0 */
@RestController
public class AddressController {


    @Autowired private AddressMapper addressMapper;

    @Autowired private AddressService addressService;

    @Autowired
    public AreaInfoService areaInfoService;

    @Autowired
    private AreaInfoMapper areaInfoMapper;

  /**
   * 获取所有地址
   *
   * @param address
   * @param currentPage
   * @param pageSize
   * @return
   */
  @RequestMapping("/getAllAddress")
  public ResultBean getAllAddress(Address address, int currentPage, int pageSize) {
    RowBounds rowBounds = new RowBounds((currentPage - 1) * pageSize, pageSize);
    List<Address> list = addressMapper.selectAll(address, rowBounds);

    {
        CacheTool tool = CacheTool.getInstance(areaInfoService);
        String[] xyz = null;
        int i = 0;
        for(Address a : list){
            xyz = tool.getStringOfxxx(new Integer[]{
                    a.getProvince(),a.getCity(),a.getArea()});
            a.setProvinceStr(xyz[0]);
            a.setCityStr(xyz[1]);
            a.setAreaStr(xyz[2]);
            a.setPca(xyz[0]+","+xyz[1]+","+xyz[2]);
            list.set(i,a);
            i++;
        }
    }//debug

    int count = addressMapper.count(address);
    return new ResultBean(0, list, count);
  }

  /** 根据id查地址
   * @param id
   * @return
   */
  @RequestMapping("/address/{id}")
  public ResultBean selectByPrimaryKey(@PathVariable Integer id) {
      List<Address> addresses = addressService.selectByPrimaryKey(id);
      return new ResultBean(addresses);
  }


  /** 添加地址
   * @param address
   * @return
   */
  @RequestMapping("/addressadd")
  @ResponseBody
  public Result addAddress(Address address) {
      if (addressService.addAddress(address) == 1){
          return Result.ok("添加成功！");
      }else {
          return Result.erro("添加失败！");
      }
  }

  /** 修改地址
   * @param address
   * @return
   */
  @RequestMapping("/addressupdate")
  @ResponseBody
  public Result updateAddress(Address address) {
      if (addressService.updateAddress(address) == 1){
          return Result.ok("修改成功！");
      }else {
          return  Result.erro("修改失败！");
      }
  }

  /** 删除地址
   * @param id
   * @return
   */
  @RequestMapping("/addressdelete/{id}")
  public Result deleteAddress(@PathVariable Integer id){
      if (addressService.deleteAddress(id) == 1){
          return Result.ok("删除成功！");
      }else {
          return Result.erro("删除失败！");
      }
  }
}
