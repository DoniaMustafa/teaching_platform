import 'package:teaching/core/widget/common_widgets/custom_tab_bar.dart';
import 'package:teaching/features/chat/presentation/manager/chat_operation_cubit.dart';
import 'package:teaching/features/chat/presentation/widgets/build_chatting_with_users_tap_view.dart';
import 'package:teaching/features/chat/presentation/widgets/build_users_online_chat.dart';

import '../../../../core/export/export.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
      title: AppStrings().chat.trans,
      widget: Column(
        children: [
          20.vs,
          BlocBuilder<ChatOperationCubit, CubitStates>(
            builder: (context, state) {
              return CustomTabBar(
                onTap: (index) => context
                    .read<ChatOperationCubit>()
                    .onChangeTapBarIndex(index),
                isDivider: false,
                text: AppListsConstant.chatting,
                selectedIndex: context.read<ChatOperationCubit>().selectedIndex,
              );
            },
          ),
          const BuildUsersOnlineChat(),
          const BuildChattingWithUsersTapView()
        ],
      ),
    );
  }
}
