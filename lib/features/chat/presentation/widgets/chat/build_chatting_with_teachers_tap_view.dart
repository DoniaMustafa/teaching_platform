import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/chat/presentation/manager/chat_operation_cubit.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/custom_chat_item.dart';
import 'package:teaching/features/chat/presentation/widgets/chat/custom_online_image.dart';

import '../../manager/chat_cubit.dart';

class BuildChattingWithTeachersTapView extends StatelessWidget {
  const BuildChattingWithTeachersTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatCubit, CubitStates>(
        builder: (context, state) {
          if (state is FailedState) {
            return CustomErrorWidget(
              onTap: () => context.read<ChatCubit>().getSingleChats(),
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
          ? CustomChatItem(
              onTap: () {},
              time: state.data[index].lastMessageTime!,
              image: state.data[index].image!,
              name: state.data[index].name!,
              massage: state.data[index].lastMessage!,
            )
          : CustomShimmer(
              height: 50.h,
              width: width,
              borderRadius: BorderRadiusDirectional.circular(10.r),
            ));
}
