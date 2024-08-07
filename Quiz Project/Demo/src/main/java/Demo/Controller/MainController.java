
package Demo.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Demo.Dao.QuestionDao;
import Demo.Dao.ViewSubjectDao;
import Demo.model.QuestionBean;
import Demo.model.ViewSubjectBean;

@Controller
public class MainController {

	@Autowired
	private ViewSubjectDao viewsubdao;

	@Autowired
	private QuestionDao questionDao;

	@RequestMapping("/")
	public String home() {
		return "Login";
	}

	@RequestMapping("/secondpage")
	public String sec(Model model) {
		model.addAttribute("sub", viewsubdao.getAllSubjectList());
		return "secondpage";
	}

	@RequestMapping("/deletesub/{subjectid}")
	public String del(@PathVariable("subjectid") int sid) {
		viewsubdao.deletesubject(sid);
		return "redirect:/secondpage";
	}

	@RequestMapping("/addsubject")
	public String addsub(@ModelAttribute("viewSubject") ViewSubjectBean viewsubjectbean) {
		return "addsubject";
	}

	@RequestMapping("/editsub/{subjectid}")
	public ModelAndView editsub(@PathVariable("subjectid") int sid) {
		ModelAndView m = new ModelAndView();
		m.addObject("ViewSubject", viewsubdao.getSubject(sid));
		m.setViewName("editsub");
		return m;
	}

	@RequestMapping("/savesub")
	public String saveSubject(ViewSubjectBean viewsubjectbean) {
		viewsubdao.saveSubjectDetails(viewsubjectbean);
		return "redirect:/secondpage";
	}

	@RequestMapping("/editsub/updatesub/{subjectid}")
	public String updatesub(@PathVariable("subjectid") int sid, Model model, ViewSubjectBean viewsub) {

		model.addAttribute("ViewSubject", viewsubdao.updateSubject(sid, viewsub));
		return "redirect:/secondpage";

	}

	@RequestMapping("/questionmaster")
	public String ques(Model model) {
		//List<QuestionBean> questionList = questionDao.getQuestionList();
		model.addAttribute("queslist", questionDao.getQuestionList());
		return "questionmaster";
	}

	@RequestMapping("/addques")
    public String addques(Model model, @ModelAttribute("questionBean") QuestionBean questionBean) {
        System.out.println("Riyaaaaaaaaa");
        model.addAttribute("subjectlist", viewsubdao.getAllSubjectList());
        return "addques";
    }

	@RequestMapping("/savequestion")
	public String savequestion(@ModelAttribute("questionBean") QuestionBean questionBean) {
		System.out.println("Rgshvdhschjdsgc");
		questionDao.saveQuestion(questionBean);

		return "redirect:/questionmaster";
	}

	@RequestMapping("/deleteques/{questionId}")
	public String deletequestion(@PathVariable("questionId") int questionId) {
		questionDao.deletequestion(questionId);
		return "redirect:/questionmaster";
	}

	@RequestMapping("/editques/{questionId}")
	public ModelAndView editquestion(@PathVariable("questionId") int questionId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("subjectlist", viewsubdao.getAllSubjectList());
		mv.addObject("questionBean", questionDao.getquestion(questionId));
		mv.setViewName("editques");
		return mv;
	}

	@RequestMapping("/editques/updatequestion/{questionId}")
	public String updatequestion(@PathVariable("questionId") int questionId, Model model, QuestionBean questionBean) {
		model.addAttribute("questionBean", questionDao.updatequestion(questionId, questionBean));
		return "redirect:/questionmaster";
	}

	@GetMapping("/quizsetting")
	public String quiz() {
		return "quizsetting";
	}

}
