package cf.honeybear.haitao.mapper;

import cf.honeybear.haitao.entity.Address;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Address record);

    List<Address> selectByPrimaryKey(Integer id);

    List<Address> selectAll(Address address,RowBounds rowBounds);

    int count(Address address);

    int nameRepeat(Address address);

    int otherNameRepeat(Address address);

    int updateByPrimaryKey(Address record);
}