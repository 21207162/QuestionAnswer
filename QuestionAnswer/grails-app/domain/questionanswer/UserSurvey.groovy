package questionanswer

import org.apache.commons.lang.builder.HashCodeBuilder

class UserSurvey implements Serializable {

	User user
	Survey survey
	Boolean voted
	
	boolean equals(other) {
		if (!(other instanceof UserSurvey)) {
			return false
		}

		other.user?.id == user?.id &&
			other.survey?.id == survey?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (survey) builder.append(survey.id)
		builder.toHashCode()
	}
	
	static UserSurvey get(long userId, long surveyId) {
		find 'from UserSurvey where user.id=:userId and survey.id=:surveyId',
			[userId: userId, surveyId: surveyId]
	}

	static UserSurvey create(User user, Survey survey, Boolean voted, boolean flush = true) {
		new UserSurvey(user: user, survey: survey, voted: voted).save(flush: flush, insert: true)
	}

	static boolean remove(User user, Survey survey, boolean flush = true) {
		UserSurvey instance = UserSurvey.findByUserAndSurvey(user, survey)
		instance ? instance.delete(flush: flush) : false
	}

	static void removeAll(User user) {
		executeUpdate 'DELETE FROM UserSurvey WHERE user=:user', [user: user]
	}

	static void removeAll(Survey survey) {
		executeUpdate 'DELETE FROM UserSurvey WHERE survey=:survey', [survey: survey]
	}

	static mapping = {
		id composite: ['user', 'survey']
		version false
	}
	
    static constraints = {
    }
}
