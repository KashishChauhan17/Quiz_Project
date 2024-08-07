package Demo.Dao;
import java.util.List;

import Demo.model.QuestionBean;


public interface QuestionDao {
	void saveQuestion(QuestionBean questionBean);
    List<QuestionBean> getQuestionList();
    void deletequestion(int questionId);
	QuestionBean getquestion(int questionId);
	QuestionBean updatequestion(int questionId, QuestionBean questionBean);

}