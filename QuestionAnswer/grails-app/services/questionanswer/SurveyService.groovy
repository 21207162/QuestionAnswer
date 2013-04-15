package questionanswer

class SurveyService {

    def submitSurvey(Survey s) {
		s.open = true
    }
	
	def closeSurvey(Survey s){
		s.open = false
	}
	
	def CalculateStatistics(Survey s){
		
	}
	
	def voteForSurveyWithAnswer(Survey s, Answer a){
		
	}
}
