package questionanswer

import groovy.json.JsonSlurper
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
			s.getAnswers().put(answer.getId(), 0)	
		}
		s.setMapJson(groovy.json.JsonOutput.toJson(s.getAnswers())) 
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
		def newValue = -1
		def slurper = new JsonSlurper()
		def map = slurper.parseText(s.getMapJson())
		map.entrySet().each {
			if(Integer.parseInt(it.key) == a.getId()) {
				newValue = ++it.value
			}
		}
		if(newValue != -1)
			map["${a.getId()}"]=newValue
		
		s.setMapJson(groovy.json.JsonOutput.toJson(map))
		
	}
}
