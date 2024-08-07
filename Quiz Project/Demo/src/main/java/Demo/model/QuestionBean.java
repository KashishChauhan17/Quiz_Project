package Demo.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QuestionBean {
    private Integer quesid;
    private Integer subjectid;
    private String quesname;
    private Integer quesstatus;
    private Integer status;
    private Date date = new Date();
    private Integer correctAnswer;
    private String subjectName;
    private List<AnswerBean> answers = new ArrayList<AnswerBean>();
    private List<CorrectAnswerBean> correctAnswers = new ArrayList<CorrectAnswerBean>();

    public Integer getQuesid() {
        return quesid;
    }

    public void setQuesid(Integer quesid) {
        this.quesid = quesid;
    }

    public Integer getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(Integer subjectid) {
        this.subjectid = subjectid;
    }

    public String getQuesname() {
        return quesname;
    }

    public void setQuesname(String quesname) {
        this.quesname = quesname;
    }

    public Integer getQuesstatus() {
        return quesstatus;
    }

    public void setQuesstatus(Integer quesstatus) {
        this.quesstatus = quesstatus;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(Integer correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public List<AnswerBean> getAnswers() {
        return answers;
    }

    public void setAnswers(List<AnswerBean> answers) {
        this.answers = answers;
    }

    public List<CorrectAnswerBean> getCorrectAnswers() {
        return correctAnswers;
    }

    public void setCorrectAnswers(List<CorrectAnswerBean> correctAnswers) {
        this.correctAnswers = correctAnswers;
    }

    @Override
    public String toString() {
        return "QuestionBean [quesid=" + quesid + ", subjectid=" + subjectid + ", quesname=" + quesname
                + ", quesstatus=" + quesstatus + ", status=" + status + ", date=" + date + ", correctAnswer="
                + correctAnswer + ", subjectName=" + subjectName + ", answers=" + answers + ", correctAnswers="
                + correctAnswers + "]";
    }
}
