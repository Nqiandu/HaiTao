package cf.honeybear.haitao.cache;

import cf.honeybear.haitao.CacheI.AreaI;
import cf.honeybear.haitao.CacheI.City_T;
import cf.honeybear.haitao.service.AreaInfoService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author JN
 * @Date 2020/3/13 20:08
 * @Version 1.0
 **/
public class City {

    private Integer id;
    private Integer parentId;
    private String name;

    private Map<Integer,Area> Areas = new HashMap<>();

    private AreaInfoService areaInfoService;

    private void loadArea(){
        List<AreaI> TEMP = areaInfoService.getAllAreaOfCity(id);
        for(AreaI areaI : TEMP){
            Areas.put(areaI.getId(),new Area(areaI.getId(),areaI.getParentId(),areaI.getName()));
        }
    }

    public Integer getId() {
        return id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public String getName() {
        return name;
    }

    public Map<Integer, Area> getAreas() {
        return Areas;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", name='" + name + '\'' +
                '}';
    }

    public static City Clone(City_T c, AreaInfoService areaInfoService){
        City _c = new City();
        _c.id = c.getId();
        _c.name = c.getName();
        _c.parentId = c.getParentid();
        _c.areaInfoService = areaInfoService;
        _c.loadArea();
        return _c;
    }
}
