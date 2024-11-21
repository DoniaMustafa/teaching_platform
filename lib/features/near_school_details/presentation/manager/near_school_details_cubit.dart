import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/near_school_details/data/models/near_school_details_model.dart';
import 'package:teaching/features/near_school_details/domain/use_cases/near_school_details_use_case.dart';
import 'package:url_launcher/url_launcher.dart';


class NearSchoolDetailsCubit extends Cubit<CubitStates> {
  NearSchoolDetailsCubit(this.useCase) : super(InitialState());
  NearSchoolDetailsUseCase useCase;
  getNearSchoolDetails({required int id}){
    managerExecute<SchoolDetailsModel>(useCase.getNearSchoolDetails(id: id),
    onStart: ()=>emit(LoadingState()),
      onFail: (message)=>emit(FailedState(message: message)),
      onSuccess: (data)=>emit(LoadedState<SchoolDetailsModel>(data: data!))

    );
  }

  void launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url),mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $url';
    }
  }

}
