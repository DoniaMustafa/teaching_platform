import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/wallet/data/models/transaction_response_model.dart';
import 'package:teaching/features/wallet/presentation/manager/transaction_cubit.dart';

class BuildTransactionList extends StatelessWidget {
  const BuildTransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: AppColors.white,
      radiusDirectional: BorderRadiusDirectional.only(
        topStart: Radius.circular(30.r),
        topEnd: Radius.circular(30.r),
      ),
      child: BlocBuilder<TransactionCubit, CubitStates>(
        builder: (context, state) {
          return CustomListView(
              shrinkWrap: true,
              reverse: true,
              scroll: const NeverScrollableScrollPhysics(),
              separatorWidget: (context, index) => CustomDivider(
                    height: 1,
                    width: width,
                    color: AppColors.dividerColor,
                  ),
              axisDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: state is LoadedState
                  ? state.data.length
                  : AppConstants.shimmerItems,
              widget: (context, index) => state is LoadedState
                  ? _buildTransactionItem(data: state.data[index])
                  : Padding(
                      padding:
                          getPadding(start: 23.w, end: 19.w, vertical: 30.h),
                      child: CustomShimmer(
                        height: 80,
                        width: width,
                      ),
                    ));
        },
      ),
    );
  }

  Widget _buildTransactionItem({required TransactionData data}) => Padding(
        padding: getPadding(start: 23.w, end: 19.w, vertical: 30.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
                width: 30.w,
                height: 30.h,
                child: CustomSvg(asset: AppAssets().wallet)),
            10.hs,
            Expanded(
              child: CustomTextWidget(
                text: AppService().getBlocData<LanguageCubit>().isEn
                    ? data.descriptionEn ?? data.description
                    : data.description,
                softWrap: true,
                style: getSemiboldTextStyle(
                    fontSize: 14, color: AppColors.deepGray),
              ),
            ),
            10.hs,
            Row(
              children: [
                CustomTextWidget(
                  text: data.amount.toString(),
                  style: getRegularTextStyle(
                      fontSize: 18, color: AppColors.mainAppColor),
                ),
                5.hs,
                CustomTextWidget(
                  text: data.currencyName!.contains("جنيه مصرى").isTrue
                      ? AppStrings().egp.trans
                      : '',
                  style:
                      getRegularTextStyle(fontSize: 14, color: AppColors.black),
                ),
              ],
            ),
          ],
        ),
      );
}
