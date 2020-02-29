package cf.honeybear.haitao.utils;

import cf.honeybear.haitao.entity.User;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

/**拿到当前登录的User信息 */
public class UserUtils {
    public static User getCurrentHr(){
        return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
