package cf.honeybear.haitao.mapper;


import cf.honeybear.haitao.entity.LoginLog;

import java.util.List;

public interface LoginLogMapper {
    int deleteByPrimaryKey(Integer loginid);

    void insert(LoginLog loginLog);

    LoginLog selectByPrimaryKey(Integer loginid);

    List<LoginLog> selectAll();

    int updateByPrimaryKey(LoginLog record);

    List<LoginLog> getLastTimeById(Integer uid);
}