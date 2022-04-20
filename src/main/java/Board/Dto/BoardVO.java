package Board.Dto;

import java.util.Date;

public class BoardVO {
    public int num;
    public String writer;
    public String title;
    public String contents;
    public Date refdate;
    public int count;

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public Date getRefdate() {
        return refdate;
    }

    public void setRefdate(Date refdate) {
        this.refdate = refdate;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
