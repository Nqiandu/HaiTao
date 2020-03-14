package cf.honeybear.haitao.cache;

/**
 * @Author JN
 * @Date 2020/3/13 20:09
 * @Version 1.0
 **/
public class Area {

    private Integer id;
    private Integer parentId;
    private String name;

    public Area(Integer id, Integer parentId, String name) {
        this.id = id;
        this.parentId = parentId;
        this.name = name;
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

    @Override
    public String toString() {
        return "Area{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", name='" + name + '\'' +
                '}';
    }
}
