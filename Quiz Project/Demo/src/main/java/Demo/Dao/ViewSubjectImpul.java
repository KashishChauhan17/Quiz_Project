package Demo.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import Demo.model.ViewSubjectBean;

@Repository
public class ViewSubjectImpul implements ViewSubjectDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	@Qualifier("dataSource")
	public void jdbcTemplate(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}
	public List<ViewSubjectBean> getAllSubjectList() {
        String sql = "select * from lu_quiz_subject where status=1";
        return jdbcTemplate.query(sql, new RowMapper<ViewSubjectBean>() {
            public ViewSubjectBean mapRow(ResultSet rs, int rownumber) throws SQLException {
                ViewSubjectBean sub = new ViewSubjectBean();
                sub.setSubjectid(rs.getInt("subject_id"));
                sub.setSubjectname(rs.getString("subject_name"));
                sub.setSubjectstatus(rs.getInt("subject_status"));
                sub.setStatus(rs.getInt("status"));
                sub.setCreatedon(rs.getInt("subject_id") == 1 ? new Date() : rs.getDate("created_on"));
                return sub;
            }
        });
        }


	public void saveSubjectDetails(ViewSubjectBean vs) {
		String sql = "Insert into lu_quiz_subject(subject_name,subject_status,status,created_on) values(?,?,1,NOW())";
		 jdbcTemplate.update(sql,vs.getSubjectname(),vs.getSubjectstatus());
		
	}
	
	public void deletesubject(int subjectid) {
		String sql = "Update lu_quiz_subject set status=0 where subject_id=?";
	    jdbcTemplate.update(sql, subjectid);
		
	}
	
	public ViewSubjectBean getSubject(int sid) {
		String sql = "Select * from lu_quiz_subject where status=1 and subject_id="+sid;		
		return jdbcTemplate.query(sql,new RowMapper<ViewSubjectBean>(){  
		    public ViewSubjectBean mapRow(ResultSet rs, int rownumber) throws SQLException {  
		    	ViewSubjectBean sub= new ViewSubjectBean();  
		    	sub.setSubjectid(rs.getInt("subject_id"));
		    	sub.setSubjectname(rs.getString("subject_name"));
		    	sub.setSubjectstatus(rs.getInt("subject_status"));
		    	sub.setStatus(rs.getInt("status"));
		        return sub;  
		    }  
		    }).get(0); 
		
	}

	public ViewSubjectBean updateSubject(int sid, ViewSubjectBean viewsub) {
		String sql="update lu_quiz_subject set subject_name=?,subject_status=? where subject_id="+sid;
		jdbcTemplate.update(sql,viewsub.getSubjectname(),viewsub.getSubjectstatus());		
		return getSubject(viewsub.getSubjectid());
	}
}

	

	

	



