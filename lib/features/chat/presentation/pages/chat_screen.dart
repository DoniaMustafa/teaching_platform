import 'package:teaching/features/chat/presentation/widgets/chat/build_chatting_with_groups_tap_view.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/build_chatting_with_teachers_tap_view.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/build_users_online_chat.dart';

import '../../../../core/export/export.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
      title: AppPrefs.userRole == '3'
          ? AppStrings().childernTeachers.trans
          : AppStrings().chat.trans,
      widget: Column(
        children: [
          const BuildUsersOnlineChat(),
          if (AppPrefs.userRole == '1'||AppPrefs.userRole == '7')
            BlocBuilder<ChatOperationCubit, CubitStates>(
              builder: (context, state) {
                return CustomTabBar(
                  onTap: (index) => context
                      .read<ChatOperationCubit>()
                      .onChangeTapBarIndex(index),
                  isDivider: false,
                  text: AppListsConstant.chatting,
                  selectedIndex:
                      context.read<ChatOperationCubit>().selectedIndex,
                );
              },
            ),
          20.vs,
          BlocBuilder<ChatOperationCubit, CubitStates>(
              builder: (context, state) {
            if (context.read<ChatOperationCubit>().selectedIndex == 0) {
              return const BuildChattingWithTeachersTapView();
            } else {
              return const BuildChattingWithGroupsTapView();
            }
          })
        ],
      ),
    );
  }
}
