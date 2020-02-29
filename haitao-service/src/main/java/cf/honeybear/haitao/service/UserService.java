package cf.honeybear.haitao.service;

import cf.honeybear.haitao.entity.User;
import cf.honeybear.haitao.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private UserMapper userMapper;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        logger.info("登陆用户名是："+username);
        User user = userMapper.loadUserByUsername(username);
        if (null == user){
            throw new UsernameNotFoundException("用户名不存在");
        }
        return user;
    }
}
