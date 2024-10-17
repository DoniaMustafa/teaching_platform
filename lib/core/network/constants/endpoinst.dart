abstract class EndPoints {
  static const String baseUrl = 'https://mesmet-001-site5.dtempurl.com/';
  static const String url = 'https://mesmet-001-site5.dtempurl.com'; //base url
  static const String api = '/api/';
  // static const String profile = '${api}profile/';
  // static const String editProfile = '${api}profile/updateProfile';

/////////////////////////// authentication ////////////////////////////
  static const String country = '${api}Country/GetCountries';

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
  static const String getStudentSubscriptions =
      '${api}Student/GetStudentSubscriptions';
  static const String school = '${api}School/GetSchools';

  // static const String products = '${api}Product/list';

////////////////////// teacher home /////////////////////////////////
  static const String getHomeTeacherCourses =
      '${api}Home/GetHomeTeacherCoursese';
  static const String getTeacherDetailsInStudent =
      '${api}Teacher/GetTeacherDetails';

  static const String getHomeTeacherGroups = '${api}Home/GetHomeTeacherGroups';
  static const String getTeacherDetailsGroups = '${api}Group/GetTeacherGroups';
  static const String addTeacherReview = '${api}Student/AddTeacherReview';
  static const String studentFollowTeacher = '${api}Teacher/FollowUnFollowTeacher';



//   /////////////////////////// Courses Groups  //////////////////////////////////////////////
  static const String getCoursesDetails = '${api}Course/GetTeacherCourses';

  static const String getCourseLessonDetails =
      '${api}Course/GetCourseLessonDetails';
  static const String addCourseVideoComment =
      '${api}CourseVideo/AddCourseVideoComment';

  static const String getGroupLessonsDetails = '${api}Group/GetGroupDetails';
  static const String getPublicTeachersGroupedCourses =
      '${api}Course/GetGroupedCourses';
  static const String getPublicTeachersGroupedGroup =
      '${api}Group/GetGroupedGroups';
  static const String addRate = '${api}CourseVideo/AddCourseVideoRate';
  static const String subscribeCourseOrLesson = '${api}Course/SubscribeCourse';
  static const String addFavouriteUnFavouriteCourseVideo = '${api}CourseVideo/FavouriteUnFavouriteCourseVideo';


//   /////////////////////////// subject //////////////////////////////////////////////
  static const String getStudentSubjects = '${api}Subject/GetStudentSubjects';

//   ///////////////////////////  exam//////////////////////////////////////////////
 static const String getStudentExams = '${api}Exam/GetStudentExams';
//////////////////////// subscribe /////////////////////////////////
  static const String getStudentSubscriptionsGroupsDetails = '${api}Student/GetStudentSubscriptionsTeacherGroups';
  static const String getFavouriteCourseVideos = '${api}CourseVideo/GetFavouriteCourseVideos';
//
//   static const String deleteFromCart = '${api}Cart/delete';
//
//   static const String completeOrderOfCart = '${api}Cart/compled';
//
//   /////////////////////////// profile //////////////////////////////////////////////
//   static const String deleteAccount = '${api}profile/delete';
//   static const String addAccount = '${api}profile/addNew';
//   static const String phoneSupport = '${api}phone_support';
//
//   static const String changeSetting = '${api}Profile/changeSetting';
//
//   static const String bookingService = '${api}Booking/add_Booking';
//   static const String bookingTimeAndDate = '${api}Booking/add_time';
//   static const String productsDetails = '${api}Product/get_product';
//
//

//
//   static const String info = "${api}info";
}
