package cf.honeybear.haitao.mapper;

import cf.honeybear.haitao.entity.MenuRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MenuRole record);

    MenuRole selectByPrimaryKey(Integer id);

    List<MenuRole> selectAll();

    int updateByPrimaryKey(MenuRole record);

    void deleteByRid(Integer rid);

    //Integer insertRecord(@Param("rid") Integer rid, @Param("mids") Integer[] mids);
}