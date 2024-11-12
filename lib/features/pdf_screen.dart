// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// import 'package:teaching/core/export/export.dart';

// class PdfScreen extends StatelessWidget {
//   PdfScreen({super.key});
//   static const String pdfKey = "pdfKey";
//   String pdf = "pdf";
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic>? data = getArguments(context);
//     if (data.isNotNull) {
//       pdf = data![pdfKey];
//       print(pdf);
//     }
//     return CustomBackground(showBack: true,
//       showAppbar: true,
//       statusBarColor: AppColors.mainAppColor,
//       showSafeArea: true,
//       child: const PDF().cachedFromUrl(
//         pdf,
//         placeholder: (progress) =>
//             Center(child: CustomTextWidget(text: '$progress %')),
//         errorWidget: (error) =>
//             Center(child: CustomTextWidget(text: error.toString())),
//       ),
//     );
//   }
// }
