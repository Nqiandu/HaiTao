package cf.honeybear.haitao.controller.address;

import cf.honeybear.haitao.service.AreaInfoService;
import org.springframework.context.annotation.Configuration;

/**
 * @Author JN
 * @Date 2020/3/13 23:06
 * @Version 1.0
 **/
@Configuration
public class Test {

    public AreaInfoService areaInfoService;

    public Test(AreaInfoService areaInfoService) {
        this.areaInfoService = areaInfoService;
    }

    public void t(){
    System.out.println(123123123);
    }

}
