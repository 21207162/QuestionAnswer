package questionanswer

class SurveyService {

    def submitSurvey(Survey s) {
		s.open = true
    }
	
	def closeSurvey(Survey s){
		s.open = false
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
		for(Answer an : s.getAnswers()) {
			if(a.id == an.id) {
				an.counter++
			}
		}
	}
}
