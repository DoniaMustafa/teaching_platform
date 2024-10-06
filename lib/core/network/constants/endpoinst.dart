abstract class EndPoints {
  static const String baseUrl = 'http://mesmet-001-site5.dtempurl.com/'; //base url
  static const String api = '/api/';
  // static const String profile = '${api}profile/';
  // static const String editProfile = '${api}profile/updateProfile';

/////////////////////////// authentication ////////////////////////////

  static const String account = '${api}Account/';
  static const String registerByPhone = '${account}SendVerifyCode';
  static const String verify = '${account}VerifyPhoneNumber_Code';

  static const String registerStudent = '${account}RegisterStudent';
  static const String login = 'token';
  static const String registerLecturer = '${account}RegisterProfessionalLecturer';
  static const String registerParent= '${account}RegisterParent';
  static const String registerTeacher = '${account}RegisterTeacher';
  static const String registerAssistant = '${account}RegisterAssistant';

  // static const String verifyForgetPassword = '${api}verifyForgetPassword';
  // static const String forgetPassword = '${api}forgetPassword';
  // static const String resetPassword = '${api}resetPassword';
  // static const String userLogout = '${api}logout';
// ///////////////////////////// profile ////////////////////////////
//   static const String profileInfo = '${user}profile';
//   static const String profileDeatils = '${user}profile/detail';
//   static const String profileUpdates = '${user}profile/updateInfo';
//   static const String updateNotifyStatus = '${user}profile/updateNotify';
///////////////////////////// student home ////////////////////////////
  static const String homeCoursesAndGroups = '${api}Home/GetCoursesAndGroups';
  static const String ads = '${api}Advertisement/GetAdvertisements';
  static const String getTeachers = '${api}Teacher/GetTeachers';
  static const String getStudentSubscriptions = '${api}Student/GetStudentSubscriptions';
  static const String school = '${api}School/GetSchools';

  // static const String products = '${api}Product/list';
//
//////////////////////// teacher home /////////////////////////////////
//   static const String GetHomeTeacherCoursese = '${api}Home/GetHomeTeacherCoursese';
//   static const String getSubServicesDetails = '${api}Sub_Service/show';
//   static const String addConsultation = '${api}Consultation/add';
//
//   static const String cities = '${api}cities';
//
//
//   /////////////////////////// Settings //////////////////////////////////////////////
//   static const String termsConditions = '${api}terms_conditions';
//
// //////////////////////// cart /////////////////////////////////
//   static const String cart = '${api}cart/get';
//   static const String addDiscount = '${api}Cart/offer/';
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
//   /// ************************   google apis *********************************
//   static const String googleMapsBaseUrl = 'https://maps.googleapis.com/maps/api/';
//   static const String autoCompleteApi = 'place/autocomplete/json';
//   static const String addressInfo = 'place/details/json';
//   static const String direction = 'directions/json';
  static const String getGrades= '${api}Grade/GetGradesByEducationProgramType';
  static const String educationProgram = '${api}EducationProgram/GetEducationPrograms';
//
//
  static const String educationType = '${api}EducationType/GetEducationTypes';
  static const String country = '${api}Country/GetCountries';
//
//   static const String info = "${api}info";
}
