import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/data/models/groups_chat_response_model.dart';
import 'package:teaching/features/chat/presentation/manager/chat_group_massages_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_of_group_cubit.dart';
import 'package:teaching/features/chat/presentation/manager/chat_operation_cubit.dart';
import 'package:teaching/features/chat/presentation/pages/chat_group_massages_screen.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/custom_chat_item.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/custom_online_image.dart';

import '../../manager/chat_cubit.dart';

class BuildChattingWithGroupsTapView extends StatelessWidget {
  const BuildChattingWithGroupsTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatOfGroupCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () {
                context.read<ChatOfGroupCubit>().getSingleGroupChats();
              },
              message: state.message,
            );
          }
          if (state is LoadedState && state.data.isEmpty) {
            return const CustomEmptyWidget();
          }
          return buildTabBarView(state);
        },
      ),
    );
  }

  Widget buildTabBarView(CubitStates state) => CustomListView(
      shrinkWrap: true,
      axisDirection: Axis.vertical,
      itemCount:
          state is LoadedState ? state.data.length : AppConstants.nShimmerItems,
      separatorWidget: (context, index) => 20.vs,
      widget: (context, index) => state is LoadedState
          ? _buildChatItem(state.data[index])
          : CustomShimmer(
              height: 50.h,
              width: width,
              borderRadius: BorderRadiusDirectional.circular(10.r),
            ));
  Widget _buildChatItem(GroupsChatData data) => CustomChatItem(
        onTap: () {
          AppService()
              .getBlocData<ChatGroupMassagesCubit>()
              .getChatGroupMessages(chatGroupId: data.chatGroupId!);
          Routes.chatMassagesRoute.moveToWithArgs(
              {ChatGroupMassagesScreen.nameKey: data.chatGroupName,
                ChatGroupMassagesScreen.imageKey:'${EndPoints.url}${data.groupImage}',
                ChatGroupMassagesScreen.chatGroupIdKey:data.chatGroupId
              });
        },
        time: data.lastMessageTime ?? '',
        image: '${EndPoints.url}${data.groupImage!}',
        name: data.chatGroupName ?? "",
        massage: data.lastMessage ?? '',
      );
}
