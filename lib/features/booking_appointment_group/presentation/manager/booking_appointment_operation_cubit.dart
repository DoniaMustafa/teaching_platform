import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/booking_appointment_group/data/models/appointment_date.dart';
import 'package:teaching/features/booking_appointment_group/domain/use_cases/booking_appointment_use_casee.dart';

class BookingAppointmentOperationCubit extends Cubit<CubitStates> {
  BookingAppointmentOperationCubit() : super(InitialState());

  int?  selectedDuration ;
  int? subscriptionId;
  onChangeSubscriptionDuration({required int index,required int id}) {
    selectedDuration = index;
    subscriptionId =id;
    emit(LoadingState());
  }
  bool isTeacher = false;
  onChangeDisplayTeacher() {
    isTeacher = true;

    emit(LoadedState<bool>(data: true));
  }
}
