package cf.honeybear.haitao.CacheI;

/**
 * @Author JN
 * @Date 2020/3/13 17:32
 * @Version 1.0
 **/
public class AreaI {

    private Integer id;
    private Integer parentid;
    private String name;

    public AreaI(Integer id, Integer parentid, String name) {
        this.id = id;
        this.parentid = parentid;
        this.name = name;
    }

    public AreaI() {
    }

    public Integer getId() {
        return id;
    }

    public Integer getParentId() {
        return parentid;
    }

    public String getName() {
        return name;
    }

}
