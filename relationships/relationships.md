
# Administrator

# AssignmentAnalytic

# AssignmentTeamAnalytic

# CourseAnalytic

# QuestionAnalytic

# QuestionnaireAnalytic

# ResponseAnalytic

# ScoreAnalytic

# Assignment
* belongs_to :course
* belongs_to :wiki_type
* has_many :participants, :class_name => 'AssignmentParticipant', :foreign_key => 'parent_id'
* has_many :participant_review_mappings, :class_name => 'ParticipantReviewResponseMap', :through => :participants, :source => :review_mappings
* has_many :users, :through => :participants
* has_many :due_dates
* has_many :teams, :class_name => 'AssignmentTeam', :foreign_key => 'parent_id'
* has_many :team_review_mappings, :class_name => 'TeamReviewResponseMap', :through => :teams, :source => :review_mappings
* has_many :invitations, :class_name => 'Invitation', :foreign_key => 'assignment_id'
* has_many :assignment_questionnaires
* has_many :questionnaires, :through => :assignment_questionnaires
* belongs_to :instructor, :class_name => 'User', :foreign_key => 'instructor_id'
* has_many :sign_up_topics, :foreign_key => 'assignment_id', :dependent => :destroy
* has_many :response_maps, :foreign_key => 'reviewed_object_id', :class_name => 'ResponseMap'
* has_many :responses, :through => :response_maps, :source => 'response'

# AssignmentNode
* belongs_to :assignment, :class_name => "Assignment", :foreign_key => "node_object_id"
* belongs_to :node_object, :class_name => 'Assignment'

# AssignmentParticipant
* belongs_to  :assignment, :class_name => 'Assignment', :foreign_key => 'parent_id' 
* has_many    :review_mappings, :class_name => 'ParticipantReviewResponseMap', :foreign_key => 'reviewee_id'
* has_many    :responses, :finder_sql => 'SELECT r.* FROM responses r, response_maps m, participants p WHERE r.map_id = m.id AND m.type = \'ParticipantReviewResponseMap\' AND m.reviewee_id = p.id AND p.id = #{id}'
* belongs_to  :user

# AssignmentQuestionnaire
* belongs_to :assignment
* belongs_to :questionnaire

# AssignmentTeam
* belongs_to  :assignment, :class_name => 'Assignment', :foreign_key => 'parent_id'
* has_many    :review_mappings, :class_name => 'TeamReviewResponseMap', :foreign_key => 'reviewee_id'
* has_many    :responses, :finder_sql => 'SELECT r.* FROM responses r, response_maps m, teams t WHERE r.map_id = m.id AND m.type = \'TeamReviewResponseMap\' AND m.reviewee_id = t.id AND t.id = #{id}'

# AuthorFeedbackQuestionnaire

# Authority

# Constants

# DegreeOfRelevance

# Edge

# GraphGenerator

# Negations

# PlagiarismCheck

# PredictClass

# SentenceState

# TextPreprocessing

# TextQuantity

# Tone

# Vertex

# WordnetBasedSimilarity

# AutomatedMetareview
* belongs_to :response, :class_name => 'Response', :foreign_key => 'response_id'
* has_many :scores, :class_name => 'Score', :foreign_key => 'response_id', :dependent => :destroy

# Comment
* belongs_to :participant

# ContentPage
* belongs_to :permission

# ControllerAction
* belongs_to :site_controller
* belongs_to :permission

# Course
* has_many :ta_mappings
* has_many :assignments, :dependent => :destroy
* belongs_to :instructor, :class_name => 'User', :foreign_key => 'instructor_id'
* has_many :participants, :class_name => 'CourseParticipant', :foreign_key => 'parent_id'

# CourseEvaluationQuestionnaire

# CourseNode
* belongs_to :course, :class_name => "Course", :foreign_key => "node_object_id"
* belongs_to :node_object, :class_name => "Course"

# CourseParticipant
* belongs_to :course, :class_name => 'Course', :foreign_key => 'parent_id'

# CourseTeam
* belongs_to  :course, :class_name => 'Course', :foreign_key => 'parent_id'

# CoursesUsers

# Credentials

# CsEntriesAdaptor

# DeadlineRight

# DeadlineType

# DisplayOption

# DueDate
* belongs_to :assignment
* belongs_to :deadline_type

# FeedbackResponseMap
* belongs_to :reviewee, :class_name => 'Participant', :foreign_key => 'reviewee_id'
* belongs_to :review, :class_name => 'Response', :foreign_key => 'reviewed_object_id'
* belongs_to :reviewer, :class_name => 'AssignmentParticipant'

# FolderNode
* belongs_to :folder, :class_name => "TreeFolder", :foreign_key => "node_object_id"
* belongs_to :node_object, :class_name => "TreeFolder"

# GlobalSurveyQuestionnaire

# ImportError

# Institution

# Instructor

# Invitation
* belongs_to :to_user, :class_name => "User", :foreign_key => "to_id"
* belongs_to :from_user, :class_name => "User", :foreign_key => "from_id"

# JoinTeamRequest
* belongs_to :team
* has_one :participant

# Language

# LatePolicy
* belongs_to :due_date

# Leaderboard

# Mailer

# MarkupStyle

# Menu

# MenuItem

# MetareviewQuestionnaire

# MetareviewResponseMap
* belongs_to :reviewee, :class_name => 'Participant', :foreign_key => 'reviewee_id'
* belongs_to :review_mapping, :class_name => 'ResponseMap', :foreign_key => 'reviewed_object_id'   

# Metasurvey

# MissingObjectIdError

# Node
* belongs_to :parent, :class_name => 'Node', :foreign_key => 'parent_id'

# Participant
* belongs_to :user
* belongs_to :topic, :class_name => 'SignUpTopic'
* belongs_to :assignment, :foreign_key => 'parent_id'
* has_many   :comments, :dependent => :destroy
* has_many   :resubmission_times, :dependent => :destroy
* has_many   :reviews, :class_name => 'ResponseMap', :foreign_key => 'reviewer_id'
* has_many   :team_reviews, :class_name => 'TeamReviewResponseMap', :foreign_key => 'reviewer_id'
* has_many :response_maps, :class_name =>'ResponseMap', :foreign_key => 'reviewee_id'

# ParticipantReviewResponseMap
* belongs_to :reviewee, :class_name => 'Participant', :foreign_key => 'reviewee_id'
* belongs_to :contributor, :class_name => 'Participant', :foreign_key => 'reviewee_id'

# PathError

# Permission
* has_many :content_pages
* has_many :controller_actions

# Question
* belongs_to :questionnaire # each question belongs to a specific questionnaire
* belongs_to :review_score  # each review_score pertains to a particular question
* belongs_to :review_of_review_score  # ditto
* has_many :question_advices, :order => 'score' # for each question, there is separate advice about each possible score
* has_many :signup_choices # ?? this may reference signup type questionnaires
* has_one :question_type

# QuestionAdvice
* belongs_to :question, :dependent => :destroy

# QuestionType
* belongs_to :question

# Questionnaire
* has_many :questions # the collection of questions associated with this Questionnaire
* belongs_to :instructor, :class_name => "User", :foreign_key => "instructor_id" # the creator of this questionnaire
* has_many :assignment_questionnaires, :class_name => 'AssignmentQuestionnaire', :foreign_key => 'questionnaire_id'
* has_many :assignments, :through => :assignment_questionnaires

# QuestionnaireNode
* belongs_to :questionnaire, :class_name => "Questionnaire", :foreign_key => "node_object_id"
* belongs_to :node_object, :class_name => "Questionnaire"

# QuestionnaireTypeNode
* belongs_to :table, :class_name => "TreeFolder", :foreign_key => "node_object_id"
* belongs_to :node_object, :class_name => "TreeFolder"

# Response
* belongs_to :map, :class_name => 'ResponseMap', :foreign_key => 'map_id'
* has_many :scores, :class_name => 'Score', :foreign_key => 'response_id', :dependent => :destroy

# ResponseMap
* belongs_to :reviewer, :class_name => 'Participant', :foreign_key => 'reviewer_id'
* has_one :response, :class_name => 'Response', :foreign_key => 'map_id'
* has_many :metareview_response_maps, :class_name => 'MetareviewResponseMap', :foreign_key => 'reviewed_object_id'
* has_many :metareview_responses, :source => :responses, :finder_sql => 'SELECT meta.* FROM responses r, response_maps meta, response_maps rev WHERE r.map_id = m.id AND m.type = \'MetaeviewResponseMap\' AND m.reviewee_id = p.id AND p.id = #{id}'

# ResubmissionTime

# ReviewComment
* belongs_to :review_files, :class_name => 'ReviewFile',

# ReviewFile
* belongs_to :participant, :class_name => 'Participant',
* has_many :review_comments, :class_name => 'ReviewComment',

# ReviewQuestionnaire

# ReviewResponseMap
* belongs_to :assignment, :class_name => 'Assignment', :foreign_key => 'reviewed_object_id'

# Role
* belongs_to :parent, :class_name => 'Role'
* has_many :users

# RolesPermission

# Rubric

# Score
* belongs_to :question

# ScoreCache

# SignUpTopic
* has_many :signed_up_users, :foreign_key => 'topic_id', :dependent => :destroy
* has_many :topic_dependencies, :foreign_key => 'topic_id', :dependent => :destroy
* has_many :topic_deadlines, :foreign_key => 'topic_id', :dependent => :destroy
* has_many :assignment_participants, :foreign_key => 'topic_id'
* belongs_to :assignment

# SignedUpUser
* belongs_to :topic, :class_name => 'SignUpTopic'

# SignupResubmissionQuota

# SiteController
* has_many :controller_actions
* belongs_to :permission

# Student

# StudentTask

# Suggestion
* has_many :suggestion_comments 

# SuggestionComment
* belongs_to :suggestion

# SuperAdministrator

# SurveyDeployment

# SurveyParticipant

# SurveyQuestionnaire

# SurveyResponse
* belongs_to :assignment
* belongs_to :questionnaire
* belongs_to :question

# SystemSettings

# Ta
* has_many :ta_mappings

# TaMapping
* belongs_to :course
* belongs_to :ta

# Team
* has_many :teams_users
* has_many :users, :through => :teams_users
* has_many :join_team_requests

# TeamExistsError

# TeamNode
* belongs_to :node_object, class_name: 'Team'

# TeamReviewResponseMap
* belongs_to :reviewee, :class_name => 'Team', :foreign_key => 'reviewee_id'
* belongs_to :contributor, :class_name => 'Team', :foreign_key => 'reviewee_id'

# TeamUserNode
* belongs_to :node_object, class_name: 'TeamsUser'

# TeammateReviewQuestionnaire

# TeammateReviewResponseMap
* belongs_to :reviewee, :class_name => 'Participant', :foreign_key => 'reviewee_id'
* belongs_to :assignment, :class_name => 'Assignment', :foreign_key => 'reviewed_object_id'

# TeamsParticipant
* belongs_to :user
* belongs_to :team

# TeamsUser
* belongs_to :user
* belongs_to :team

# TopicDeadline
* belongs_to :topic, :class_name => 'SignUpTopic'

# TopicDependency

# TreeFolder

# User
* has_many :participants, :class_name => 'Participant', :foreign_key => 'user_id', :dependent => :destroy
* has_many :assignment_participants, :class_name => 'AssignmentParticipant', :foreign_key => 'user_id', :dependent => :destroy
* has_many :assignments, :through => :participants
* has_many :teams_users, :dependent => :destroy
* has_many :teams, :through => :teams_users
* has_many :children, class_name: 'User', :foreign_key => 'parent_id'
* belongs_to :parent, class_name: 'User'
* belongs_to :role

# Waitlist

# WikiType
* has_many :assignments
