package cf.honeybear.haitao.service;

import cf.honeybear.haitao.entity.Notice;
import cf.honeybear.haitao.mapper.NoticeMapper;
import cf.honeybear.haitao.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;


    public List<Notice> getAll(){
        return noticeMapper.selectAll();
    }


    public int addNotice(Notice notice){
        String name = UserUtils.getCurrentUser().getName();
        notice.setEname(name);
        return noticeMapper.insert(notice);
    }

}
