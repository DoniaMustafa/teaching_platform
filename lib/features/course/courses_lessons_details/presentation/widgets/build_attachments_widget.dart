import 'package:teaching/features/course/courses_lessons_details/data/models/course_Lesson_details_response_model.dart';
import 'package:teaching/features/course/courses_lessons_details/presentation/manager/attachments_operation_cubit.dart';
import 'package:teaching/features/pdf_screen.dart';

import '../../../../../core/export/export.dart';

class BuildAttachmentsWidget extends StatelessWidget {
  const BuildAttachmentsWidget({super.key, required this.model});
  final CourseLessonDataMode model;
  @override
  Widget build(BuildContext context) {
    return model.attachments!.isEmpty
        ? const CustomEmptyWidget()
        : CustomListView(
            shrinkWrap: true,
            axisDirection: Axis.vertical,
            itemCount: model.attachments!.length,
            separatorWidget: (context, index) => 20.vs,
            widget: (context, index) => _buildItem(model.attachments![index]));
  }

  Widget _buildItem(AttachmentsModel attach) =>
      BlocBuilder<AttachmentsOperationCubit, CubitStates>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              // print('${EndPoints.url}${attach.attachmentUrl}');
              // Routes.pdfRoute.moveToWithArgs({
              //   PdfScreen.pdfKey: '${EndPoints.url}${attach.attachmentUrl}'
              // });
              context
                  .read<AttachmentsOperationCubit>()
                  .launchURL('${EndPoints.url}${attach.attachmentUrl}');
            },
            child: CustomCard(
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4)
              ],
              padding: getPadding(horizontal: 10.w, vertical: 10.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 60.h,
                    child: CustomSvg(
                      asset: AppAssets().pdf,
                      // width: 50.w,
                      // height: 55.h,
                    ),
                  ),
                  10.hs,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: AppService()
                                .getBlocData<LanguageCubit>()
                                .isEn
                                .isTrue
                            ? attach.titleEn!
                            : attach.title!,
                        style: getMediumTextStyle(fontSize: 18),
                      ),
                      // CustomTextWidget(
                      //   text: '${attach.titleEn}  صفحة ',
                      //   style: getRegularTextStyle(fontSize: 14),
                      // ),
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      );
}
