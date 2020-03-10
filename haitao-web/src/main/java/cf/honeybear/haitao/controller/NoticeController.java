package cf.honeybear.haitao.controller;

import cf.honeybear.haitao.entity.Notice;
import cf.honeybear.haitao.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class NoticeController {

    @Autowired
    private NoticeService noticeService;


    @RequestMapping("/getAllNotice")
    public List<Notice> getAll(){
        return noticeService.getAll();
    }

    @RequestMapping("/addNotice")
    @ResponseBody
    public int addNotice(Notice notice){
        return noticeService.addNotice(notice);
    }
}
