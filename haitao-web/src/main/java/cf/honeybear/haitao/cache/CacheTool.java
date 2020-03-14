package cf.honeybear.haitao.cache;

import cf.honeybear.haitao.CacheI.ProvinceI;
import cf.honeybear.haitao.service.AreaInfoService;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author JN
 * @Date 2020/3/13 20:08
 * @Version 1.0
 **/
@Component
public class CacheTool {

    public AreaInfoService areaInfoService;

    private static Map<Integer,Province> BUFFER = null;

    private static CacheTool obj ;

    private static CacheTool cacheTool;

    public CacheTool(AreaInfoService areaInfoService) {
        this.areaInfoService = areaInfoService;
    }

    public static CacheTool getInstance(AreaInfoService areaInfoService){
        BUFFER = new HashMap<>();
        obj = new CacheTool(areaInfoService);
        obj.loadCache(areaInfoService);
        return obj;
    }

    private void loadCache(AreaInfoService areaInfoService){
        if (BUFFER.size() == 0){
            loadProvice(areaInfoService);
        }
    }


    private boolean loadProvice(AreaInfoService areaInfoService){
        List<ProvinceI> TEMP = areaInfoService.getAllProvince();
        for(ProvinceI p : TEMP){
            BUFFER.put(p.getId(),Province.Clone(p,areaInfoService));
        }

        if (BUFFER.size()<=0){
            return false;
        }
        return true;
    }

    public String[] getStringOfxxx(Integer[] args){
        if(args == null || args.length <= 0 || args.length > 3){
            return new String[]{"不正确的坐标"};
        }
        Province province = null;
        City city = null;
        Area area = null;

        for(int i = 0 ; i < args.length ; i++){
            switch (i){
                case 0 :
                {
                    if (checkIn(BUFFER,args[i])){
                        province = BUFFER.get(args[i]);
                    }
                    break;
                }
                case 1:
                {
                    if(province !=null && checkIn(province.getCitys(),args[i])){
                        city = province.getCitys().get(args[i]);
                    }
                    break;
                }
                case 2:
                {
                    if(city !=null && checkIn(city.getAreas(),args[i])){
                        area = city.getAreas().get(args[i]);
                    }
                    break;
                }
            }
        }
        return new String[]{province != null ? province.getName(): "",
                city != null ? city.getName() : "",
                area != null ? area.getName() : ""};
    }

    private boolean checkIn(Map map,Integer key){
        return  map.containsKey(key);
    }
}
