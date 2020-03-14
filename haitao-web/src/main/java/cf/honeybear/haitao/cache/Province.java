package cf.honeybear.haitao.cache;

import cf.honeybear.haitao.CacheI.City_T;
import cf.honeybear.haitao.CacheI.ProvinceI;
import cf.honeybear.haitao.service.AreaInfoService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author JN
 * @Date 2020/3/13 20:08
 * @Version 1.0
 **/
public class Province {
    private Integer id;
    private String name;
    private Map<Integer,City> Citys = new HashMap<>();
    private AreaInfoService areaInfoService;

    private void loadCity(AreaInfoService areaInfoService){
        List<City_T> TEMP = areaInfoService.getAllCityOfProvince(id);

//        List<CityI> TEMP = areaInfoService.getAllCity();
        for(City_T c : TEMP){
            Citys.put(c.getId(),City.Clone(c,areaInfoService));
        }
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Map<Integer, City> getCitys() {
        return Citys;
    }

    public static Province Clone(ProvinceI p,AreaInfoService areaInfoService){
        Province _p = new Province();
        _p.id = p.getId();
        _p.name = p.getName();
        _p.areaInfoService = areaInfoService;
        _p.loadCity(areaInfoService);
        return _p;
    }

    @Override
    public String toString() {
        return "Province{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", Citys=" + Citys +
                '}';
    }
}
