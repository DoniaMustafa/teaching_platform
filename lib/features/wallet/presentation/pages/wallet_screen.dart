import 'package:teaching/features/wallet/presentation/manager/balance_cubit.dart';
import 'package:teaching/features/wallet/presentation/manager/transaction_cubit.dart';
import 'package:teaching/features/wallet/presentation/widgets/transaction_list.dart';

import '../../../../core/export/export.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      context.read<BalanceCubit>().getBalance();
      context.read<TransactionCubit>().getTransaction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomSharedFullScreen(
      title: AppStrings().wallet.trans,
      widget: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            20.vs,
            CustomCard(
              padding: getPadding(horizontal: 20.w, vertical: 10),
              margin: getMargin(horizontal: 30.w),
              backgroundColor: AppColors.mainAppColor,
              child: Row(
                children: [
                  CustomTextWidget(
                    text: AppStrings().currentBalance.trans,
                    style: getRegularTextStyle(
                        fontSize: 16, color: AppColors.white),
                  ),
                  Spacer(),
                  BlocBuilder<BalanceCubit, CubitStates>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return CustomShimmer(
                          height: 30.h,
                          width: 100.w,
                        );
                      }
                      return CustomTextWidget(
                        text: state is LoadedState
                            ? state.data.totalBalance.toString()
                            : "0.0",
                        style: getRegularTextStyle(
                            fontSize: 16, color: AppColors.white),
                      );
                    },
                  ),
                ],
              ),
            ),
            20.vs,
            CustomElevatedButton(
              onPressed: () {},
              color: AppColors.white,
              borderColor: AppColors.borderColor2,
              isBorder: true,
              radius: 10.r,
              text: AppStrings().chargeNow.trans,
              textColor: AppColors.mainAppColor,
              margin: getMargin(horizontal: 110.w),
            ),
            20.vs,
            Padding(
              padding: getPadding(start: 10.w, end: 5.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageWidget(
                    asset: AppAssets().qrCode,
                  ),
                  15.hs,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: AppStrings().walletAddress.trans,
                          style: getBoldTextStyle(
                              height: 1.3,
                              fontSize: 16,
                              color: AppColors.black.withOpacity(0.65)),
                        ),
                        CustomTextWidget(
                          text: '0487473737823',
                          style: getBoldTextStyle(
                            fontSize: 20,
                          ),
                        ),
                        CustomTextWidget(
                          text: AppStrings().walletAddress2.trans,
                          // lines: 2,
                          style: getBoldTextStyle(
                              height: 1.3,
                              fontSize: 12,
                              color: AppColors.black.withOpacity(0.65)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 20.vs,
            // CustomElevatedButton(
            //   onPressed: () {},
            //   color: AppColors.white,
            //   borderColor: AppColors.borderColor2,
            //   isBorder: true,
            //   radius: 10.r,
            //   text: 'تحويل الرصيد',
            //   textColor: AppColors.mainAppColor,
            //   margin: getMargin(horizontal: 100.w),
            // ),
            30.vs,
            Padding(
              padding: getPadding(start: 10.w, end: 5.w),
              child: Row(
                children: [
                  10.hs,
                  CustomSvg(asset: AppAssets().transaction),
                  10.hs,
                  CustomTextWidget(
                    text: 'سجل المعاملات',
                    style: getBoldTextStyle(
                        fontSize: 20, color: AppColors.black.withOpacity(0.65)),
                  ),
                ],
              ),
            ),
            20.vs,
            const BuildTransactionList()
          ],
        ),
      ),
    );
  }

  // get _buildTransaction =>
}
