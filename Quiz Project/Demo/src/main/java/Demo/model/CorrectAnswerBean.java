package Demo.model;

import java.util.Date;

public class CorrectAnswerBean {
		private int correctanswerid;
		private int quesid;
		private int answerid;
		private int status=1;
		private Date date = new Date();
		public int getCorrectanswerid() {
			return correctanswerid;
		}
		public void setCorrectanswerid(int correctanswerid) {
			this.correctanswerid = correctanswerid;
		}
		public int getAnswerid() {
			return answerid;
		}
		public void setAnswerid(int answerid) {
			this.answerid = answerid;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public int getQuesid() {
			return quesid;
		}
		public void setQuesid(int quesid) {
			this.quesid = quesid;
		}
}
