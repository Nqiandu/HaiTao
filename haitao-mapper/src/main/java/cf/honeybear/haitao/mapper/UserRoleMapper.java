package cf.honeybear.haitao.mapper;

import cf.honeybear.haitao.entity.UserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserRole record);

    UserRole selectByPrimaryKey(Integer id);

    List<UserRole> selectAll();

    int updateByPrimaryKey(UserRole record);

    void deleteByHrid(Integer hrid);

    //Integer addRole(@Param("uid") Integer uid, @Param("rids") Integer[] rids);
}