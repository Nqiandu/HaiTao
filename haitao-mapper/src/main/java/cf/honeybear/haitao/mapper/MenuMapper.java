package cf.honeybear.haitao.mapper;

import cf.honeybear.haitao.entity.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    Menu selectByPrimaryKey(Integer id);

    List<Menu> selectAll();

    int updateByPrimaryKey(Menu record);


    /**
    * 通过rid查找一级菜单
    * @param uid
    * @return
    */
    List<Menu> getFirstMenusByUserId(Integer uid);

  /**
   * 通过rid和pid查找子菜单
   * @param pid
   * @param uid
   * @return
   */
  List<Menu> getChildrenMenusByUserId(@Param("pid") Integer pid,@Param("uid")Integer uid);

    /*List<Menu> getAllMenusWithRole();

    List<Menu> getAllMenus();

    List<Integer> getMidsByRid(Integer rid);*/
}