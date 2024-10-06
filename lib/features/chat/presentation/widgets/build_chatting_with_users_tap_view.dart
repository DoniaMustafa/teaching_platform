import 'package:teaching/core/export/export.dart';
import 'package:teaching/core/widget/shimmer_widget.dart';
import 'package:teaching/features/chat/presentation/manager/chat_operation_cubit.dart';
import 'package:teaching/features/chat/presentation/widgets/custom_online_image.dart';
import 'package:teaching/features/courses_groups/presentation/manager/coures_group_operation_cubit.dart';
import 'package:teaching/features/home/presentation/manager/subscription_cubit.dart';
import 'package:teaching/features/subscription/presentation/manager/subscriptipn_operation_cubit.dart';

class BuildChattingWithUsersTapView extends StatelessWidget {
  const BuildChattingWithUsersTapView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: BlocBuilder<CoursesGroupsCubit, CubitStates>(
    //     builder: (context, state) {
    //       if (state is FailedState) {
    //         return CustomErrorWidget(
    //           onTap: () =>
    //               context.read<CoursesGroupsCubit>().getCourserAndGroups(),
    //           message: state.message,
    //         );
    //       }
    //       if (state is LoadedState && state.data.courses.isEmpty) {
    //         return const CustomEmptyWidget();
    //       }
    return Expanded(child: buildTabBarView());
    //     },
    //   ),
    // );
  }

  Widget buildTabBarView() => CustomListView(
      shrinkWrap: true,
      axisDirection: Axis.vertical,
      itemCount: 10,
      separatorWidget: (context, index) => 20.vs,
      widget: (context, index) => BlocBuilder<ChatOperationCubit, CubitStates>(
            builder: (context, state) {
              return Row(
                children: [
                  const CustomOnlineImage(),
                  15.hs,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: context
                                      .read<ChatOperationCubit>()
                                      .selectedIndex ==
                                  0
                              ? 'omer'
                              : 'جروب مستر محمد',
                          style: getRegularTextStyle(
                            fontSize: 14,
                          ),
                        ),
                        5.vs,
                        CustomTextWidget(
                          text: context
                                      .read<ChatOperationCubit>()
                                      .selectedIndex ==
                                  0
                              ? 'صباح الخير'
                              : 'omer : صباح الخير',
                          style: getRegularTextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ));
}
