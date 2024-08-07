package Demo.Dao;

import java.util.List;
import Demo.model.ViewSubjectBean;

public interface ViewSubjectDao {
    List<ViewSubjectBean> getAllSubjectList();

	void saveSubjectDetails(ViewSubjectBean viewsubjectbean);

	void deletesubject(int sid);

	ViewSubjectBean getSubject(int sid);

	ViewSubjectBean updateSubject(int sid, ViewSubjectBean viewsub);
    
}
