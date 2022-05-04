package Event.Service;

import Event.Dto.EventVO;

import java.util.List;

public interface EventService {
    //목록 조회
    List<EventVO> selectEvent();
    //등록
    String insertEvent(EventVO eventVO);
    //글 수정(Update)
    String updateEvent(EventVO eventVO);
    //삭제
    int delete(int com_num);
    //글 조회(View)
    EventVO viewEvent(int com_num);
}