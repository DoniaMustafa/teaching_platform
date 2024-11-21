import 'package:teaching/features/chat/presentation/manager/chat_group_massages_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/send_massage_to_group_cubit.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/build_chatting_with_groups_tap_view.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/build_chatting_with_teachers_tap_view.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/build_users_online_chat.dart';
import 'package:teaching/features/chat/presentation/widgets/massages_chat/build_massages_chat.dart';

import '../../../../core/export/export.dart';

class ChatGroupMassagesScreen extends StatelessWidget {
  ChatGroupMassagesScreen({super.key});
  static const String chatGroupIdKey = 'chatGroupIdKey';
  static const String nameKey = 'nameKey';
  static const String imageKey = 'imageKey';
  String name = 'name';
  String image = 'image';
  int chatGroupId = 0;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      name = data![nameKey];
      image = data[imageKey];
      chatGroupId = data[chatGroupIdKey];
    }
    return CustomBackground(
        showSafeArea: true,
        extendBody: true,
        statusBarColor: AppColors.mainAppColor,
        // showAppbar: true,showBack: true,
        child: Column(
          children: [
            _buildAppBar,
            _buildMessages,
            BlocBuilder<SendMassageToGroupCubit, CubitStates>(
              builder: (context, state) {
                return CustomTextFormField(
                    padding: getPadding(horizontal: 20.w),
                    isFill: true,
                    focusNode: AppService().hideKeyboard,
                    controller:
                        context.read<SendMassageToGroupCubit>().controller,
                    suffixIcon: AppAssets().send,
                    suffixConstraints:
                        BoxConstraints(maxHeight: 40.h, maxWidth: 40.h),
                    suffixOnTap: () {
                      if (context
                          .read<SendMassageToGroupCubit>()
                          .controller
                          .text
                          .isNotEmpty) {
                        context
                            .read<SendMassageToGroupCubit>()
                            .getSingleGroupChats(
                                text: context
                                    .read<SendMassageToGroupCubit>()
                                    .controller
                                    .text,
                                chatGroupId: chatGroupId);
                      }
                    });
              },
            ),
            20.vs,
          ],
        ));
  }

  get _buildAppBar => CustomCard(
        padding: getPadding(vertical: 10.h, bottom: 5.h),
        radius: 0,
        width: width,
        backgroundColor: AppColors.mainAppColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.hs,
            GestureDetector(
              onTap: () => pop(),
              child: const CustomIcon(
                icon: Icons.arrow_back_ios,
                color: AppColors.white,
              ),
            ),
            8.hs,
            CustomNetworkImage.circular(
              radius: 40,
              imageUrl: image,
              defaultAsset: AppAssets().student,
            ),
            10.hs,
            CustomTextWidget(
              text: name,
              style: getMediumTextStyle(fontSize: 16, color: AppColors.white),
            )
          ],
        ),
      );

  get _buildMessages => Expanded(
        child: BlocBuilder<ChatGroupMassagesCubit, CubitStates>(
          builder: (context, state) {
            if (state is FailedState) {
              return Center(
                child: CustomErrorWidget(
                  onTap: () {
                    context
                        .read<ChatGroupMassagesCubit>()
                        .getChatGroupMessages(chatGroupId: chatGroupId);
                  },
                  message: state.message,
                ),
              );
            }
            if (state is LoadedState && state.data.isEmpty) {
              return const Center(child: CustomEmptyWidget());
            }
            return CustomListView(
                reverse: true,
                padding: getPadding(bottom: 20.h, horizontal: 10.w),
                // shrinkWrap: true,
                itemCount: state is LoadedState
                    ? state.data.length
                    : AppConstants.nShimmerItems,
                separatorWidget: (context, int index) => 10.vs,
                widget: (context, int index) => state is LoadedState
                    ? BuildMassagesChat(
                        data: state.data[index],
                      )
                    : Align(
                        alignment: index.isEven
                            ? AlignmentDirectional.centerStart
                            : AlignmentDirectional.centerEnd,
                        child: CustomShimmer(
                          width: width,
                          height: 50.h,
                        ),
                      )
                // index.isEven ? _buildUserChat() : _buildGroupChat()
                );
          },
        ),
      );
  //
}
