package cf.honeybear.haitao.service;

import cf.honeybear.haitao.entity.Menu;
import cf.honeybear.haitao.mapper.MenuMapper;
import cf.honeybear.haitao.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuService {

    @Autowired
    private MenuMapper menuMapper;

    public List<Menu> getFirstMenusByUserId(Integer uid){
        return menuMapper.getFirstMenusByUserId(uid);
    }

    public List<Menu> getChildrenMenusByUserId(Integer pid){
        return menuMapper.getChildrenMenusByUserId(pid,UserUtils.getCurrentUser().getId());
    }
}
