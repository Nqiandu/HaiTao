package cf.honeybear.haitao.CacheI;

/**
 * @Author JN
 * @Date 2020/3/13 17:33
 * @Version 1.0
 **/
public class CityI {

    private Integer id;
    private Integer parentid;
    private String name;

    public CityI() {
    }

    public CityI(Integer id, Integer parentid, String name) {
        this.id = id;
        this.parentid = parentid;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
