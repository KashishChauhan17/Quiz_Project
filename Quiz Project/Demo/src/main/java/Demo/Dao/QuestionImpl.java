package Demo.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import Demo.model.AnswerBean;
import Demo.model.QuestionBean;

@Repository
public class QuestionImpl implements QuestionDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	@Qualifier("dataSource")
	public void setJdbcTemplate(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);

	}

	public List<QuestionBean> getQuestionList() {
		List<QuestionBean> questionList = new ArrayList<QuestionBean>();
		String sql = "SELECT lqq.*, qcc.correct_answer_id, lqz.subject_name FROM lu_quiz_question lqq JOIN lu_quiz_correct_answer qcc ON qcc.question_id = lqq.question_id JOIN lu_quiz_subject lqz ON lqz.subject_id = lqq.subject_id WHERE lqq.status = 1 AND qcc.status = 1 AND lqz.status = 1 ";

		questionList = jdbcTemplate.query(sql, new RowMapper<QuestionBean>() {
			public QuestionBean mapRow(ResultSet rs, int rownumber) throws SQLException {
				QuestionBean que = new QuestionBean();
				que.setQuesid(rs.getInt("question_id"));
				que.setQuesname(rs.getString("question"));
				que.setQuesstatus(rs.getInt("que_status"));
				que.setStatus(rs.getInt("status"));
				que.setSubjectName(rs.getString("subject_name"));
				que.setCorrectAnswer(rs.getInt("correct_answer_id"));
				return que;
			}
		});
		return questionList;
	}

	public void saveQuestion(QuestionBean questionBean) {
	    System.out.println("" + questionBean.getQuesname());
	    System.out.println(questionBean);
	    
	    String sql = "INSERT INTO lu_quiz_question (subject_id, question, que_status, status, created_on) VALUES (?, ?, ?, 1, NOW())";
	    jdbcTemplate.update(sql, questionBean.getSubjectid(), questionBean.getQuesname(), questionBean.getQuesstatus());

	    sql = "SELECT question_id FROM lu_quiz_question ORDER BY question_id DESC LIMIT 1";
	    Integer questionId = jdbcTemplate.queryForObject(sql, Integer.class);

	    if (questionId != null) {
	        sql = "INSERT INTO lu_quiz_answer (question_id, answer, status, created_on) VALUES (?, ?, 1, NOW())";
	        int count = 0;
	        for (AnswerBean ansBean : questionBean.getAnswers()) {
	            System.out.println("count: " + count);
	            jdbcTemplate.update(sql, questionId, ansBean.getAnswer());
	            System.out.println("correctAnswer: " + questionBean.getCorrectAnswer());
	            if (count == questionBean.getCorrectAnswer()) {
	                String newSql = "SELECT answer_id FROM lu_quiz_answer ORDER BY answer_id DESC LIMIT 1";
	                Integer answerId = jdbcTemplate.queryForObject(newSql, Integer.class);
	                if (answerId != null) {
	                    newSql = "INSERT INTO lu_quiz_correct_answer (question_id, answer_id, status, created_on) VALUES (?, ?, 1, NOW())";
	                    jdbcTemplate.update(newSql, questionId, answerId);
	                }
	            }
	            count++;
	        }
	    }
	}


	public void deletequestion(int questionId) {
		String sql = "Update lu_quiz_question set status=0 where question_id=?";
		jdbcTemplate.update(sql, questionId);

	}

	public QuestionBean getquestion(int questionId) {
		String sql = "Select * from lu_quiz_question where status=1 and question_id=" + questionId;
		QuestionBean questionBean = jdbcTemplate.query(sql, new RowMapper<QuestionBean>() {
			public QuestionBean mapRow(ResultSet rs, int rownumber) throws SQLException {
				QuestionBean sub = new QuestionBean();
				sub.setSubjectid(rs.getInt("subject_id"));
				sub.setQuesid(rs.getInt("question_id"));
				sub.setQuesname(rs.getString("question"));
				sub.setQuesstatus(rs.getInt("que_status"));
				sub.setStatus(rs.getInt("status"));
				return sub;
			}
		}).get(0);
		sql = "select * from lu_quiz_answer where question_id=" + questionBean.getQuesid();
		List<AnswerBean> ansBean = jdbcTemplate.query(sql, new RowMapper<AnswerBean>() {
			public AnswerBean mapRow(ResultSet rs, int rownumber) throws SQLException {
				AnswerBean ans = new AnswerBean();
				ans.setAnswerId(rs.getInt("answer_id"));
				ans.setAnswer(rs.getString("answer"));
				return ans;
			}
		});
		questionBean.setAnswers(ansBean);
		sql = "select answer_id from lu_quiz_correct_answer where question_id=" + questionBean.getQuesid();
		System.out.println(sql);
		int correctAnswer = jdbcTemplate.queryForObject(sql, Integer.class);
		System.out.println(correctAnswer);
		questionBean.setCorrectAnswer(correctAnswer);
		return questionBean;
	}

	
	public QuestionBean updatequestion(int questionId, QuestionBean questionBean) {
		String sql = "update lu_quiz_question set question=?,que_status=? where question_id=" + questionId;
		jdbcTemplate.update(sql, questionBean.getQuesname(), questionBean.getQuesstatus());

		sql = "update lu_quiz_answer set answer=? where question_id=? and answer_id=?";
		for (AnswerBean ansBean : questionBean.getAnswers()) {
			jdbcTemplate.update(sql, ansBean.getAnswer(), questionBean.getQuesid(), ansBean.getAnswerId());
		}
		sql = "update lu_quiz_correct_answer set answer_id=" + questionBean.getCorrectAnswer() + "  where question_id="
				+ questionBean.getQuesid();
		jdbcTemplate.update(sql);

		return getquestion(questionBean.getQuesid());  
	}
}