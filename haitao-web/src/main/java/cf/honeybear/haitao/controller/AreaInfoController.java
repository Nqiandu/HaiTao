package cf.honeybear.haitao.controller;

import cf.honeybear.haitao.entity.AreaInfo;
import cf.honeybear.haitao.service.AreaInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 省市区
 *
 * */
@RestController
public class AreaInfoController {

    @Autowired
    private AreaInfoService areaInfoService;

    @RequestMapping("/getProvance")
    public List<AreaInfo> getProvance() {
        return areaInfoService.getProvance();
    }


    @RequestMapping("/getCity")
    public List<AreaInfo> getCity(Integer pid) {
        return areaInfoService.getCity(pid);
    }


    @RequestMapping("/getArea")
    public List<AreaInfo> getArea(Integer pid) {
        return areaInfoService.getArea(pid);
    }
}
