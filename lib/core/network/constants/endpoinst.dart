abstract class EndPoints {
  static const String baseUrl = 'https://mesmet-001-site5.dtempurl.com/';
  static const String url = 'https://mesmet-001-site5.dtempurl.com'; //base url
  static const String api = '/api/';
  // static const String profile = '${api}profile/';
  static const String editProfile = '${api}Student/UpdateStudentProfile';
  static const String editParentProfile ='${api}Parent/UpdateParentProfile';
/////////////////////////// authentication ////////////////////////////
  static const String country = '${api}Country/GetCountries';
  static const String city = '${api}City/GetCitiesByCountryId';

  static const String region = '${api}state/get-states';

  static const String account = '${api}Account/';
  static const String registerByPhone = '${account}SendVerifyCode';
  static const String verifyPhoneRegistration =
      '${account}VerifyPhoneNumber_Code';

  static const String registerStudent = '${account}RegisterStudent';
  static const String login = 'token';
  static const String registerLecturer =
      '${account}RegisterProfessionalLecturer';
  static const String registerParent = '${account}RegisterParent';
  static const String registerTeacher = '${account}RegisterTeacher';
  static const String registerAssistant = '${account}RegisterAssistant';
  static const String verifyForgetPassword =
      '${api}Account/Resetpassword_VerifyPhoneCode';
  static const String forgetPassword =
      '${api}Account/Resetpassword_SendVerifyCode';
  static const String resetPassword =
      '${api}Account/Resetpassword_SetPasswword';
  static const String refreshToken = '${api}logout';
  static const String updateProfileImage = '${api}Account/UpdateProfileImage';

  static const String changePassword = '${api}Account/ChangePassword';

  static const String getStudentData = '${api}Student/GetStudentProfile';
  static const String getParentData =  '${api}Parent/GetParentProfile';
  /// ************************   Education apis *********************************

  static const String getGrades = '${api}Grade/GetGradesByEducationProgramType';
  static const String educationProgram =
      '${api}EducationProgram/GetEducationPrograms';
  static const String getSubject = '${api}Subject/GetSubjects';
//
  static const String educationType = '${api}EducationType/GetEducationTypes';
  // static const String verifyForgetPassword = '${api}verifyForgetPassword';
  // static const String forgetPassword = '${api}forgetPassword';
  // static const String resetPassword = '${api}resetPassword';
  static const String logout = '${api}Account/Logout';
// ///////////////////////////// profile ////////////////////////////
//   static const String profileInfo = '${user}profile';
//   static const String profileDeatils = '${user}profile/detail';
//   static const String profileUpdates = '${user}profile/updateInfo';
//   static const String updateNotifyStatus = '${user}profile/updateNotify';
///////////////////////////// student home ////////////////////////////
  static const String homeStudentCourses = '${api}Course/GetCourses';
  static const String homeStudentGroups = '${api}Group/GetGroups';

  static const String ads = '${api}Advertisement/GetAdvertisements';
  static const String getTeachers = '${api}Teacher/GetTeachers';
  static const String getParentTeachers = '${api}/Parent/GetParentTeachers';


  static const String getStudentSubscriptions =
      '${api}Student/GetStudentSubscriptions';
  static const String school = '${api}School/GetSchools';
  static const String getSchedule = '${api}Student/GetSchedule';

  static const String getParentChildrenSchedule = '${api}Parent/GetParentChildrenSchedule';


  static const String getStudentSubscriptionsCourses =
      '${api}Student/GetStudentSubscriptions_Courses';
  static const String getParentStudentSubscriptionsCourses =
      '${api}Parent/GetParentStudentSubscriptions_Courses';

  static const String getStudentSubscriptionsGroups =
      '${api}Student/GetStudentSubscriptions_Groups';
  static const String getParentStudentSubscriptionsGroups =
      '${api}Parent/GetParentStudentSubscriptions_Groups';

  static const String getStudentHomeworks=
      '${api}Homework/GetHomeworks';
  static const String getParentStudentHomeworks=
      '${api}Parent/GetParentStudentHomeworks';


////////////////////// teacher home /////////////////////////////////
  static const String getHomeTeacherCourses =
      '${api}Home/GetHomeTeacherCoursese';
  static const String getTeacherDetailsInStudent =
      '${api}Teacher/GetTeacherDetails';

  static const String getParentTeacherDetails =
      '${api}Parent/GetParentTeacherDetails';

  static const String getExamQuestions = '${api}Exam/GetExamQuestions';
  static const String submitExamAnswer = '${api}StudentExam/SubmitExamAnswer';

  static const String getHomeTeacherGroups = '${api}Home/GetHomeTeacherGroups';
  static const String getTeacherDetailsGroups = '${api}Group/GetTeacherGroups';
  static const String addTeacherReview = '${api}Student/AddTeacherReview';
  static const String studentFollowTeacher =
      '${api}Teacher/FollowUnFollowTeacher';

  //////////////////////////////// Exam  //////////////////////////////////////////////
  static const String getStudentExams = '${api}Exam/GetStudentExams';
  static const String getParentStudentExams = '${api}Parent/GetParentStudentExams';



  static const String getStudentExamAnswer =
      '${api}StudentExam/GetStudentExamAnswer';
  static const String getStudentDegrees = '${api}Student/GetStudentDegrees';
  static const String getNotebooks = '${api}Notebook/GetNotebooks';
  static const String getParentNotebooks = '${api}Parent/GetParentNotebooks';



  static const String getParentChildrenList = '${api}Parent/GetChildrensList';


  static const String getNotesBookedUnBooked =
      '${api}Notebook/GetTeacherNotebooks';

  static const String reserveNoteBook =
      '${api}Notebook/BookNotebook';
  static const String getNotebookDetails = '${api}Notebook/GetNotebookDetails';
//   /////////////////////////// Courses Groups  //////////////////////////////////////////////
  static const String getCoursesDetails = '${api}Course/GetTeacherCourses';

  static const String getCourseLessonDetails =
      '${api}Course/GetCourseLessonDetails';
  static const String getVimeoVideoDetails = '${api}Vimeo/GetVimeoVideoDetails';

  static const String addCourseVideoComment =
      '${api}CourseVideo/AddCourseVideoComment';
  static const String addGroupVideoComment =
      '${api}GroupVideo/AddGroupVideoComment';
  static const String getGroupLessonsDetails = '${api}Group/GetGroupDetails';
  static const String getPublicTeachersGroupedCourses =
      '${api}Course/GetGroupedCourses';
  static const String getPublicParentTeachersGroupedCourses =
      '${api}GetParent_Courses';

  static const String getPublicTeachersGroupedGroup =
      '${api}Group/GetGroupedGroups';
  static const String getPublicParentTeachersGroupedGroup =
      '${api}Parent/GetParent_Groups';


  static const String addCourseVideoRate =
      '${api}CourseVideo/AddCourseVideoRate';
  static const String addGroupVideoRate = '${api}GroupVideo/AddGroupVideoRate';
  static const String bookGroupAppointment = '${api}Group/BookGroupAppointment';

  static const String subscribeCourseOrLesson = '${api}Course/SubscribeCourse';
  static const String addFavouriteUnFavouriteCourseVideo =
      '${api}CourseVideo/FavouriteUnFavouriteCourseVideo';

  static const String addFavouriteUnFavouriteGroupVideo =
      '${api}GroupVideo/Favourit_UnFavouritGroupVideoView';

//   /////////////////////////// Notification //////////////////////////////////////////////
  static const String getNotification =
      '${api}Notification/GetUserNotifications';

  static const String markNotificationAsRead =
      '${api}Notification/MarkNotifucationAsRead';
  static const String getSchoolDetails = '${api}School/GetSchoolDetails';
  static const String getAdvertisementsDetails =
      '${api}Advertisement/GetAdvertisementsDetails';

//   /////////////////////////// subject //////////////////////////////////////////////
  static const String getStudentSubjects = '${api}Subject/GetStudentSubjects';

//////////////////////// subscribe /////////////////////////////////

  static const String getStudentSubscriptionsCoursesDetails =
      '${api}Student/GetStudentSubscriptionsTeacherCourses';

  static const String getStudentSubscriptionsGroupsDetails =
      '${api}Student/GetStudentSubscriptionsTeacherGroups';
  static const String getFavouriteCourseVideos =
      '${api}CourseVideo/GetFavouriteCourseVideos';
//
  static const String getFavouriteGroupVideos =
      '${api}GroupVideo/GetFavouriteGroupVideos';
  static const String getGroupSessions =
      '${api}GroupVideo/GetStudentGroupSessions';
  static const String subscriptionGroup = '${api}Group/SubscribeGroup';
//

  static const String getSessionsVideo = '${api}GroupVideo/GetGroupVideoById';
  static const String getVideo = '${api}GroupVideo/GetGroupVideo';

  //   /////////////////////////// Transaction //////////////////////////////////////////////
  static const String getTransaction = '${api}Transaction/GetUserTransaction';
  static const String getBalance = '${api}Transaction/GetUserBalance';

  //   /////////////////////////// parent //////////////////////////////////////////////
  static const String getStudentParents = '${api}Parent/GetStudentParents';
  static const String rejectParentRequest =
      '${api}ParentRequest/RejectParentRequest';
  static const String deleteParentStudent =
      '${api}Parent/DeleteParentStudent';


  static const String getStudentRequestParents =
      '${api}ParentRequest/GetAllParentRequest';
  static const String acceptStudentParentRequest =
      '${api}ParentRequest/AcceptParentRequest';
  static const String addStudentRequest =
      '${api}ParentRequest/AddStudentRequest';
  static const String cancelParentRequest =
      '${api}ParentRequest/CancelParentRequest';
  static const String getParentRequestCount =
      '${api}ParentRequest/GetParentRequestCount';
  static const String getParentsToAddRequest = '${api}Parent/GetParents';

  //   /////////////////////////// private //////////////////////////////////////////////
  static const String getPrivateGroups = '${api}Group/GetPrivateGroups';
  static const String getTeachersPrivateGroups =
      '${api}Group/GetTeachersPrivateGroups';

//   /////////////////////////// Chat //////////////////////////////////////////////

//
  static const String getSingleChats = '${api}Chat/GetSingleChats';
  static const String getSingleChatMessages =
      '${api}Chat/GetSingleChatMessages';
  static const String sendSingleChatMessage =
      '${api}Chat/SendSingleChatMessage';
  static const String seenSingleChatMessage =
      '${api}Chat/SeenSingleChatMessage';
  static const String getTeachersToCha = '${api}Chat/GetTeachersToChat';
  static const String getChatGroups = '${api}Chat/GetChatGroups'; //
  static const String sendChatGroupMessage =
      '${api}Chat/SendChatGroupMessage'; //
  static const String getChatGroupMessages =
      '${api}Chat/GetChatGroupMessages'; //
  static const String seenChatGroupMessage = '${api}Chat/SeenChatGroupMessage';
//   static const String productsDetails = '${api}Product/get_product';
//   static const String productsDetails = '${api}Product/get_product';

//

//
//   static const String info = "${api}info";
}
