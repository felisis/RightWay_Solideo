package Service;

import Dto.BoardVO;

import java.util.List;

public interface BoardService {
    //게시판 전체 글 가져오기
    List<BoardVO> selectAll();

    //글 작성(Insert)
    String insertBoard(BoardVO boardVO);

    //글 수정(Update)
    String updateBoard(BoardVO boardVO);
}
