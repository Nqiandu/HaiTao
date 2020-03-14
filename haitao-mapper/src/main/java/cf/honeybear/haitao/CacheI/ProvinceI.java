package cf.honeybear.haitao.CacheI;

/**
 * @Author JN
 * @Date 2020/3/13 17:33
 * @Version 1.0
 **/
public class ProvinceI {

    private Integer id;
    private String name;

    public ProvinceI(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
