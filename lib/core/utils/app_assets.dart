mixin class SvgImages {
  static String svgPath = "assets/svg";
  String success = "$svgPath/success.svg";
  String failure = "$svgPath/failure.svg";

  String learningOnboarding = "$svgPath/learning_onboarding.svg";
  String videoOnboarding = "$svgPath/video_onboarding.svg";
  String language = "$svgPath/language.svg";
  String about = "$svgPath/about.svg";
  String upload = "$svgPath/upload.svg";
  String uploadVideo = "$svgPath/upload_video.svg";
  String transaction = "$svgPath/transaction.svg";

  String star = "$svgPath/star.svg";
  String ask = "$svgPath/ask.svg";
  String favorite = "$svgPath/favorite.svg";
  String send = "$svgPath/send.svg";

  String pdf = "$svgPath/pdf.svg";

  String professionalCoursesSVG = "$svgPath/professional_courses.svg";
///////////////////////////////  svg  ////////////////////////////////////
  List<String> navBar = [
    "$svgPath/notification.svg",
    "$svgPath/schedule.svg",
    "$svgPath/fields.svg",
    "$svgPath/home.svg",
    "$svgPath/chat.svg",
    "$svgPath/wallet.svg",
  ];

  //
}

mixin PngImages {
  static String imagesPath = "assets/image";
  String mainImage = "$imagesPath/main_image.png";
  String loginImage = "$imagesPath/login_image.png";
  String webinar = "$imagesPath/webinar.png";
  String assistant = "$imagesPath/assistant.png";
  String school = "$imagesPath/school.png";
  String professionalCourses = "$imagesPath/professional_courses.png";
  String teacher = "$imagesPath/teacher.png";
  String student = "$imagesPath/student.png";
  String parent = "$imagesPath/parent.png";
  String logo = "$imagesPath/logo.png";
  String students = "$imagesPath/students.png";

  String category = "$imagesPath/category.png";
  String onlineLearning = "$imagesPath/online-learning.png";
  String forgetPass = "$imagesPath/forget_pass.png";
  String pinCode = "$imagesPath/pin_code.png";
  String qrCode = "$imagesPath/qr_code.png";

  String coursesIcon = "$imagesPath/courses_icon.png";
  String groupsIcon = "$imagesPath/groups_icon.png";
  String newsIcon = "$imagesPath/news_icon.png";
  String schoolIcon = "$imagesPath/school_icon.png";
  String teacherIcon = "$imagesPath/teacher_icon.png";
  String featuresIcon = "$imagesPath/features_icon.png";
  String firstOnes = "$imagesPath/first_ones.png";
  String termsConditions = "$imagesPath/terms_conditions.png";
  String technicalSupport = "$imagesPath/technical_support.png";
  String homeworkIcon = "$imagesPath/homework_icon.png";
  String info = "$imagesPath/info.png";

  String gradesIcon = "$imagesPath/grades_icon.png";
  String settings = "$imagesPath/settings.png";
  String emptyImage = "$imagesPath/empty.jpg";
  String person_info = "$imagesPath/person_info.png";

  String logout = "$imagesPath/logout.png";
  String exam =  "$imagesPath/exam.png";
  List<String> listOfStudentCategories = [
    "$imagesPath/exam.png",

    "$imagesPath/memoirs.png",

    "$imagesPath/grades.png",
    "$imagesPath/homework.png",
    "$imagesPath/question.png",
    "$imagesPath/live.png",
    "$imagesPath/task.png",
    // "$imagesPath/question.svg",
    // "$imagesPath/question.svg",
  ];
  List<String> drawer = [
    "$imagesPath/person_info.png",
    "$imagesPath/groups_icon.png",
    "$imagesPath/courses_icon.png",
    "$imagesPath/first_ones.png",
    "$imagesPath/teacher_icon.png",
    "$imagesPath/grades_icon.png",
    "$imagesPath/homework_icon.png",
    "$imagesPath/settings.png",
    "$imagesPath/logout.png",
  ];
}
mixin JsonFiles {
  static String lottiePath = 'assets/lotti';
  String error = "$lottiePath/error.json";
  // String error404 = "$lottiePath/error404.json";
  // String deleteAccount = "$lottiePath/deleteAccount.json";
  String empty = "$lottiePath/empty.json";
  // String pinLottie = "$lottiePath/pin.json";
  String imageLoading = "$lottiePath/teaching.json";
  String notification = "$lottiePath/notification.json";
  //
  // String gift = "$lottiePath/gift.json";
}

class AppAssets with SvgImages, PngImages, JsonFiles {
  AppAssets._internal();

  factory AppAssets() => AppAssets._internal();
}
