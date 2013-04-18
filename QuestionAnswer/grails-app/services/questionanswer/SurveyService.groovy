package questionanswer

import java.util.HashMap.Entry
import org.hibernate.collection.PersistentMap.MapEntryProxy

class SurveyService {

    def submitSurvey(Survey s) {
		s.open = true
    }
	
	def closeSurvey(Survey s){
		s.open = false
	}
	
	def addAnswersInSurveyFromQuestion(Survey s, Question q) {
		for(Answer answer : q.getAnswers()) {
			s.getAnswers().put(Long.toString(answer.getId()),Integer.toString(0))
		}
	}
	
	def CalculateStatistics(Survey s){
		int nbAnswers = s.getAnswers().size();
		List<Double> percentagePerAnswer = new ArrayList<Double>()
		for(Answer a : s.getAnswers()) {
			percentagePerAnswer.add((a.getCounter()/nbAnswers)*100)
		}
		
		return percentagePerAnswer;
	}
	
	def voteForSurveyWithAnswer(Survey s, Answer a){
		int value = -1
		String gKey = null
		System.out.println(s.answers.size());
		for (Map.Entry<String,String> e : s.getAnswers().entrySet()) {
			gKey = e.getKey()
			System.out.println("DEBUG//");
			System.out.println("Key :"+e.getKey());
			System.out.println("Value :"+e.getValue());
			System.out.println("IdResp :"+a.getId());
			if(Long.parseLong(gKey) == a.getId()) {
				String gValue = e.getValue()
				value = Integer.parseInt(gValue)
				value++			
				System.out.println("DEBUG : VALUE : "+value);
			}
		}
		
		if(gKey != null && value !=-1)
			System.out.println("DEBUG");//s.getAnswers().put(gKey,Integer.toString(value))
	}
}
