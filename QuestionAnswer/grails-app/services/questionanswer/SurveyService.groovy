package questionanswer

import groovy.json.JsonSlurper
import java.util.HashMap.Entry
import org.hibernate.collection.PersistentMap.MapEntryProxy

class SurveyService {

    def submitSurvey(Survey s) {
		s.open = Enum_state_survey.OPENED
    }
	
	def closeSurvey(Survey s){
		s.open = Enum_state_survey.OVER
	}
	
	def addAnswersInSurveyFromQuestion(Survey s, Question q) {
		for(Answer answer : q.getAnswers()) {
			s.getAnswers().put(answer.getId(), 0)	
		}
		s.setMapJson(groovy.json.JsonOutput.toJson(s.getAnswers())) 
	}
	
	def CalculateStatistics(Survey s){
		def slurper = new JsonSlurper()
		def map = slurper.parseText(s.getMapJson())
		def bufferList = []
		def percentagePerAnswer = []
		/*map.entrySet().each {
			nbVotes += it.value
		}*/
		map.entrySet().each {
			def answer = Answer.get(Integer.parseInt(it.key))
			percentagePerAnswer.add(answer.getAnswer())
			percentagePerAnswer.add(it.value)
			//percentagePerAnswer.add((it.value / nbVotes)*100)
		}
		percentagePerAnswer = percentagePerAnswer.collate(2)
		
		return percentagePerAnswer;
	}
	
	def CalculateStatisticsGlobal(Survey s){
		def slurper = new JsonSlurper()
		def map = slurper.parseText(s.getMapJson())
		def nbVotesRight = 0
		def nbVotesWrong = 0
		def bufferList = []
		def percentagePerAnswer = []
		map.entrySet().each {
			def answer = Answer.get(Integer.parseInt(it.key))
			if(answer.isRight())
				nbVotesRight += it.value
			else
				nbVotesWrong += it.value
		}
		percentagePerAnswer.add("Nb right answers")
		percentagePerAnswer.add(nbVotesRight)
		percentagePerAnswer.add("Nb wrong answers")
		percentagePerAnswer.add(nbVotesWrong)
		percentagePerAnswer = percentagePerAnswer.collate(2)
		
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
