import 'package:teaching/agora/cubit/agora_cubit.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/Task/Tasks/presentation/manager/student_tasks_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/countries/city_cubit.dart';
import 'package:teaching/features/auth/presentation/manager/countries/region_cubit.dart';
import 'package:teaching/features/booking_appointment_group/presentation/manager/booking_appointment_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_group_massages_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_of_group_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/send_massage_to_group_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/teacher_to_chat_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/lessons_details_cubit.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/lessons_details/vimeo_video_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_operation_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/manager/passed_answer_exam_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/manager/exam_question_cubit.dart';
import 'package:teaching/features/exam/exams/presentation/manager/submit_exam_cubit.dart';
import 'package:teaching/features/grades/my_grades/presentation/manager/my_grades_cubit.dart';
import 'package:teaching/features/home/presentation/manager/home_operation_cubit.dart';
import 'package:teaching/features/home_work/presentation/manager/homework_operation_cubit.dart';
import 'package:teaching/features/home_work/presentation/manager/my_homework_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_booked_unbooked_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_details_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_operation_cubit.dart';
import 'package:teaching/features/parent_children/presentation/manager/children_operation_cubit.dart';
import 'package:teaching/features/parent_children/presentation/manager/parent_children_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/reserve_note_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/accept_parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/add_parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/cancel_parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_count_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_operation_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/parents_to_request_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/reject_parents_cubit.dart';
import 'package:teaching/features/parent/presentation/manager/student_request_parents_cubit.dart';
import 'package:teaching/features/private/presentation/manager/private_groups_cubit.dart';
import 'package:teaching/features/private/presentation/manager/private_groups_operation_cubit.dart';
import 'package:teaching/features/private/presentation/manager/private_teachers_group_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/exam_video_of_session_operation_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_data_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_details_cubit.dart';
import 'package:teaching/features/sessions/session_video_details/presentation/manager/lessons_details/video_of_session_operation_cubit.dart';
import 'package:teaching/features/subscriptions/subscription/presentation/manager/subscription_courses_cubit.dart';
import 'package:teaching/features/subscriptions/subscription_details/presentation/manager/subscriptipn_course_details_cubit.dart';

import 'features/parent/presentation/manager/delete_student_cubit.dart';
import 'features/subscriptions/subscription/presentation/manager/subscription_groups_cubit.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<TabBarOperationCubit>(
        create: (context) => ServiceLocator().getIt<TabBarOperationCubit>()),



    BlocProvider<LanguageCubit>(
        create: (context) =>
            ServiceLocator().getIt<LanguageCubit>()..getSavedLanguage()),
    BlocProvider<LanguageOperationCubit>(
        create: (context) => ServiceLocator().getIt<LanguageOperationCubit>()),
    BlocProvider<SessionsOfGroupCubit>(
        create: (context) => ServiceLocator().getIt<SessionsOfGroupCubit>()),
    BlocProvider<SessionsOfGroupOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<SessionsOfGroupOperationCubit>()),
    BlocProvider<NearSchoolDetailsCubit>(
        create: (context) => ServiceLocator().getIt<NearSchoolDetailsCubit>()),
    BlocProvider<AdsDetailsCubit>(
        create: (context) => ServiceLocator().getIt<AdsDetailsCubit>()),
    BlocProvider<ExamQuestion>(
        create: (context) => ServiceLocator().getIt<ExamQuestion>()),
    BlocProvider<TestPassedCubit>(
        create: (context) => ServiceLocator().getIt<TestPassedCubit>()),

    BlocProvider<MyGradesCubit>(
        create: (context) => ServiceLocator().getIt<MyGradesCubit>()),
    BlocProvider<StudentTasksCubit>(
        create: (context) => ServiceLocator().getIt<StudentTasksCubit>()),

    BlocProvider<ErrorCubit>(
        create: (context) => ServiceLocator().getIt<ErrorCubit>()),
    BlocProvider<OnboardingManagerCubit>(
        create: (context) => ServiceLocator().getIt<OnboardingManagerCubit>()),
    BlocProvider<CountriesCubit>(
      create: (context) => ServiceLocator().getIt<CountriesCubit>(),
    ),
    BlocProvider<RegionCubit>(
      create: (context) => ServiceLocator().getIt<RegionCubit>(),
    ),
    BlocProvider<CityCubit>(
      create: (context) => ServiceLocator().getIt<CityCubit>(),
    ),

    BlocProvider<BottomNavBarOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<BottomNavBarOperationCubit>()),
    BlocProvider<UserCubit>(
      create: (context) => ServiceLocator().getIt<UserCubit>()
        ..getUser()
        ..getToken()
        ..getUserRole(),
      lazy: false,
    ),
    BlocProvider<SubscriptionOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<SubscriptionOperationCubit>()),
    BlocProvider<GroupsCubit>(
      create: (context) => ServiceLocator().getIt<GroupsCubit>(),
    ),
    BlocProvider<CoursesGroupOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<CoursesGroupOperationCubit>()),
    // BlocProvider<VideoCubit>(create: (context) => VideoCubit()),
    BlocProvider<CoursesCubit>(
        create: (context) => ServiceLocator().getIt<CoursesCubit>()),
    BlocProvider<AdsCubit>(
        create: (context) => ServiceLocator().getIt<AdsCubit>()),
    BlocProvider<NearSchoolCubit>(
        create: (context) => ServiceLocator().getIt<NearSchoolCubit>()),
    BlocProvider<SubscriptionCubit>(
        create: (context) => ServiceLocator().getIt<SubscriptionCubit>()),
    BlocProvider<TeachersOfStudentCubit>(
        create: (context) => ServiceLocator().getIt<TeachersOfStudentCubit>()),
    BlocProvider<EducationCubit>(
        create: (context) =>
            ServiceLocator().getIt<EducationCubit>()..getEducationType()),

    BlocProvider<SubjectCubit>(
        create: (context) => ServiceLocator().getIt<SubjectCubit>()),

    BlocProvider<FileManagerCubit>(
        create: (context) => ServiceLocator().getIt<FileManagerCubit>()),

    BlocProvider<ProgramCubit>(
        create: (context) => ServiceLocator().getIt<ProgramCubit>()),
    BlocProvider<StageCubit>(
        create: (context) => ServiceLocator().getIt<StageCubit>()),

    BlocProvider<PrivateGroupsOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<PrivateGroupsOperationCubit>()),

    BlocProvider<ChatCubit>(
        create: (context) => ServiceLocator().getIt<ChatCubit>()),

    BlocProvider<TeacherToChatCubit>(
        create: (context) => ServiceLocator().getIt<TeacherToChatCubit>()),
    BlocProvider<ChatOfGroupCubit>(
        create: (context) => ServiceLocator().getIt<ChatOfGroupCubit>()),
    BlocProvider<ChatGroupMassagesCubit>(
        create: (context) => ServiceLocator().getIt<ChatGroupMassagesCubit>()),

    BlocProvider<SendMassageToGroupCubit>(
        create: (context) => ServiceLocator().getIt<SendMassageToGroupCubit>()),

    BlocProvider<ChatOperationCubit>(
        create: (context) => ServiceLocator().getIt<ChatOperationCubit>()),
    BlocProvider<CoursesDetailsCubit>(
        create: (context) => ServiceLocator().getIt<CoursesDetailsCubit>()),
    BlocProvider<LessonsDetailsCubit>(
        create: (context) => ServiceLocator().getIt<LessonsDetailsCubit>()),
    BlocProvider<VimeoVideoCubit>(
        create: (context) => ServiceLocator().getIt<VimeoVideoCubit>()),
    BlocProvider<BookingAppointmentCubit>(
        create: (context) => ServiceLocator().getIt<BookingAppointmentCubit>()),

    BlocProvider<PrivateGroupsCubit>(
        create: (context) => ServiceLocator().getIt<PrivateGroupsCubit>()),
    BlocProvider<PrivateTeachersGroupCubit>(
        create: (context) =>
            ServiceLocator().getIt<PrivateTeachersGroupCubit>()),

    BlocProvider<GroupDetailsCubit>(
        create: (context) => ServiceLocator().getIt<GroupDetailsCubit>()),
    BlocProvider<GroupLessonsDetailsCubit>(
        create: (context) =>
            ServiceLocator().getIt<GroupLessonsDetailsCubit>()),
    BlocProvider<SubjectsCubit>(
        create: (context) =>
            ServiceLocator().getIt<SubjectsCubit>()..getSubjects()),
    BlocProvider<PublicCourseCubit>(
        create: (context) => ServiceLocator().getIt<PublicCourseCubit>()),
    BlocProvider<PublicGroupCubit>(
        create: (context) => ServiceLocator().getIt<PublicGroupCubit>()),
    BlocProvider<AttachmentsOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<AttachmentsOperationCubit>()),
    BlocProvider<TeacherDetailsCubit>(
        create: (context) => ServiceLocator().getIt<TeacherDetailsCubit>()),
    BlocProvider<SubscribeCourseCubit>(
        create: (context) => ServiceLocator().getIt<SubscribeCourseCubit>()),
    BlocProvider<ReviewTeacherCubit>(
        create: (context) => ServiceLocator().getIt<ReviewTeacherCubit>()),
    BlocProvider<FollowTeacherCubit>(
        create: (context) => ServiceLocator().getIt<FollowTeacherCubit>()),
    BlocProvider<FavoriteUnFavoriteVideoCubit>(
        create: (context) =>
            ServiceLocator().getIt<FavoriteUnFavoriteVideoCubit>()),
    BlocProvider<NotificationCubit>(
        create: (context) =>
            ServiceLocator().getIt<NotificationCubit>()..getNotification()),
    BlocProvider<NotificationOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<NotificationOperationCubit>()),
    BlocProvider<VideoOperationCubit>(
        create: (context) => ServiceLocator().getIt<VideoOperationCubit>()),
    BlocProvider<CommentOnLessonCubit>(
        create: (context) => ServiceLocator().getIt<CommentOnLessonCubit>()),
    BlocProvider<ExamOperationCubit>(
        create: (context) => ServiceLocator().getIt<ExamOperationCubit>()),
    BlocProvider<RateCubit>(
        create: (context) => ServiceLocator().getIt<RateCubit>()),
    BlocProvider<FavoriteVideoCoursesCubit>(
        create: (context) =>
            ServiceLocator().getIt<FavoriteVideoCoursesCubit>()),
    BlocProvider<FavoriteVideoGroupsCubit>(
        create: (context) =>
            ServiceLocator().getIt<FavoriteVideoGroupsCubit>()),
    BlocProvider<SubscriptionCourseDetailsCubit>(
        create: (context) =>
            ServiceLocator().getIt<SubscriptionCourseDetailsCubit>()),
    BlocProvider<NotesCubit>(
        create: (context) => ServiceLocator().getIt<NotesCubit>()),
    BlocProvider<SubscriptionGroupDetailsCubit>(
        create: (context) =>
            ServiceLocator().getIt<SubscriptionGroupDetailsCubit>()),
    BlocProvider<ExamCubit>(
        create: (context) => ServiceLocator().getIt<ExamCubit>()),
    BlocProvider<SubmitExamCubit>(
        create: (context) => ServiceLocator().getIt<SubmitExamCubit>()),
    BlocProvider<ExamQuestionOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<ExamQuestionOperationCubit>()),
    BlocProvider<BalanceCubit>(
        create: (context) => ServiceLocator().getIt<BalanceCubit>()),
    BlocProvider<ScheduleCubit>(
        create: (context) => ServiceLocator().getIt<ScheduleCubit>()),
    BlocProvider<SubscriptionGroupCubit>(
        create: (context) => ServiceLocator().getIt<SubscriptionGroupCubit>()),
    BlocProvider<SubscriptionGroupsCubit>(
        create: (context) => ServiceLocator().getIt<SubscriptionGroupsCubit>()),
    BlocProvider<SubscriptionCoursesCubit>(
        create: (context) =>
            ServiceLocator().getIt<SubscriptionCoursesCubit>()),
    BlocProvider<NotesCubit>(
        create: (context) => ServiceLocator().getIt<NotesCubit>()),
    BlocProvider<NotesOperationCubit>(
        create: (context) => ServiceLocator().getIt<NotesOperationCubit>()),
    BlocProvider<NotesBookedUnbookedCubit>(
        create: (context) =>
            ServiceLocator().getIt<NotesBookedUnbookedCubit>()),
    BlocProvider<NotesDetailsCubit>(
        create: (context) => ServiceLocator().getIt<NotesDetailsCubit>()),
    BlocProvider<TransactionCubit>(
        create: (context) => ServiceLocator().getIt<TransactionCubit>()),
    BlocProvider<HomeworkOperationCubit>(
        create: (context) => ServiceLocator().getIt<HomeworkOperationCubit>()),
    BlocProvider<ReserveNoteCubit>(
        create: (context) => ServiceLocator().getIt<ReserveNoteCubit>()),

    BlocProvider<VideoOfSessionDetailsCubit>(
        create: (context) =>
            ServiceLocator().getIt<VideoOfSessionDetailsCubit>()),
    BlocProvider<VideoDataCubit>(
        create: (context) => ServiceLocator().getIt<VideoDataCubit>()),
    BlocProvider<VideoOfSessionOperationCubit>(
        create: (context) =>
            ServiceLocator().getIt<VideoOfSessionOperationCubit>()),
    BlocProvider<HomeOperationCubit>(
        create: (context) => ServiceLocator().getIt<HomeOperationCubit>()),
    BlocProvider<ParentsOperationCubit>(
        create: (context) => ServiceLocator().getIt<ParentsOperationCubit>()),
    BlocProvider<StudentRequestParentsCubit>(
        create: (context) =>
            ServiceLocator().getIt<StudentRequestParentsCubit>()),
    BlocProvider<MyHomeworkCubit>(
        create: (context) => ServiceLocator().getIt<MyHomeworkCubit>()),
    BlocProvider<AcceptParentsCubit>(
        create: (context) => ServiceLocator().getIt<AcceptParentsCubit>()),
    BlocProvider<AddParentsCubit>(
        create: (context) => ServiceLocator().getIt<AddParentsCubit>()),
    BlocProvider<CancelParentsCubit>(
        create: (context) => ServiceLocator().getIt<CancelParentsCubit>()),
    BlocProvider<RejectParentsCubit>(
        create: (context) => ServiceLocator().getIt<RejectParentsCubit>()),
    BlocProvider<ParentsCountCubit>(
        create: (context) => ServiceLocator().getIt<ParentsCountCubit>()),
    BlocProvider<ParentsToRequestCubit>(
        create: (context) => ServiceLocator().getIt<ParentsToRequestCubit>()),
    BlocProvider<ParentsCubit>(
        create: (context) => ServiceLocator().getIt<ParentsCubit>()),
    BlocProvider<ParentChildrenCubit>(
        create: (context) => ServiceLocator().getIt<ParentChildrenCubit>()),
    BlocProvider<ChildrenOperationCubit>(
        create: (context) => ServiceLocator().getIt<ChildrenOperationCubit>()),
    BlocProvider<DeleteStudentCubit>(
        create: (context) => ServiceLocator().getIt<DeleteStudentCubit>()),




  ];
}
