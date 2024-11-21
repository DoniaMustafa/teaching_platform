import 'package:carousel_slider/carousel_slider.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notes/data/models/notes_details_response_model.dart';
import 'package:teaching/features/notes/presentation/manager/notes_cubit.dart';
import 'package:teaching/features/notes/presentation/manager/notes_details_cubit.dart';
import 'package:teaching/features/notes/presentation/pages/reserve_note_screen.dart';
import 'package:teaching/features/notes/presentation/widgets/build_notes.dart';
import 'package:teaching/features/notes/presentation/widgets/build_notes_search.dart';
import 'package:teaching/features/notes/presentation/widgets/note_details/build_note_details_shimmer.dart';

class NotesDetailsScreen extends StatefulWidget {
  const NotesDetailsScreen({super.key});
  static const String isBookedKey = "isBookedKey";
  @override
  State<NotesDetailsScreen> createState() => _NotesDetailsScreenState();
}

class _NotesDetailsScreenState extends State<NotesDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotesCubit>().getNotes();
  }

  bool? isBooked;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data = getArguments(context);
    if (data.isNotNull) {
      isBooked = data![NotesDetailsScreen.isBookedKey];
      print(isBooked);
    }
    return CustomBackground(
      statusBarColor: AppColors.mainAppColor,
      child: CustomSharedFullScreen(
        isBackIcon: true,
        // anotherWidget: BuildNotesSearch(),
        title: AppStrings().notes.trans,
        widget: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20.r),
                    topEnd: Radius.circular(20.r))),
            child: BlocBuilder<NotesDetailsCubit, CubitStates>(
                builder: (context, state) {
              if (state is FailedState) {
                return CustomErrorWidget(message: state.message, onTap: () {});
              }
              if (state is LoadedState) {
                return _buildBody(state.data);
              }
              return BuildNoteDetailsShimmer();
            })),
      ),
    );
  }

  Widget _buildBody(NotebookDetailsData data) => Column(
        children: [
          20.vs,
          Padding(
            padding: getPadding(
              horizontal: 15.w,
              vertical: 20.h,
            ),
            child: CustomTextWidget(
              text: data.title!,
              style: getBoldTextStyle(fontSize: 18),
            ),
          ),
          20.vs,
          CustomCard(
            margin: getPadding(
              horizontal: 15.w,
              vertical: 20.h,
            ),
            backgroundColor: AppColors.black.withOpacity(0.05),
            padding: getPadding(horizontal: 15.w, vertical: 10.h),
            child: CustomTextWidget(
              text: data.description!,
              style: getRegularTextStyle(
                  fontSize: 18, color: AppColors.mainAppColor),
            ),
          ),
          20.vs,
          CarouselSlider(
            items: List.generate(
                data.notebookImages!.length,
                (index) => CustomNetworkImage.rectangle(
                      imageUrl:
                          '${EndPoints.url}${data.notebookImages![index].image}',
                      width: width,
                    )),
            options: CarouselOptions(
              height: size.height * 0.25,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {},
            ),
          ),
          10.vs,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                data.notebookImages!.length,
                (index) => CustomCircleWidget(
                      color: AppColors.mainAppColor,
                      width: 10.w,
                      margin: getPadding(end: 5.w),
                      height: 10.h,
                    )),
          ),
          Padding(
            padding: getPadding(
              horizontal: 15.w,
              vertical: 20.h,
            ),
            child: Row(
              children: [
                CustomTextWidget(
                  text: AppStrings().price.trans,
                  style: getRegularTextStyle(fontSize: 20),
                ),
                const Spacer(),
                CustomCard(
                  margin: getPadding(
                    horizontal: 15.w,
                    vertical: 20.h,
                  ),
                  backgroundColor: AppColors.black.withOpacity(0.05),
                  padding: getPadding(horizontal: 50.w, vertical: 10.h),
                  child: CustomTextWidget(
                    text: '${data.price} ${AppStrings().egp.trans}',
                    style: getRegularTextStyle(
                        fontSize: 18, color: AppColors.mainAppColor),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (isBooked.isTrue)
            CustomCard(
              margin: getPadding(
                horizontal: 15.w,
                vertical: 20.h,
              ),
              backgroundColor: AppColors.black.withOpacity(0.05),
              padding: getPadding(horizontal: 50.w, vertical: 10.h),
              child: CustomTextWidget(
                text: AppStrings().booked.trans,
                style: getRegularTextStyle(
                    fontSize: 18, color: AppColors.mainAppColor),
              ),
            ),
          // 20.vs,
          CustomElevatedButton(
            onPressed: () {
              Routes.reserveNoteRoute.moveToWithArgs({
                ReserveNoteScreen.noteIdKey: data.id,
                ReserveNoteScreen.priceKey: data.price.toString()
              });
            },
            text: isBooked.isTrue
                ? AppStrings().reserveAnotherCopy.trans
                : AppStrings().reserveNow.trans,
            margin: getMargin(horizontal: isBooked.isTrue ? 90.w : 120.w),
          ),
          20.vs
        ],
      );
}
