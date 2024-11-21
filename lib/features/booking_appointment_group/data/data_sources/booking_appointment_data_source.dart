import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/booking_appointment_group/data/models/appointment_date.dart';
import 'package:teaching/features/course/courses_details/data/models/course_details_response_model.dart';

abstract class BookingAppointmentDataSource {
  Future<ResponseModel> bookingAppointment(
      {required AppointmentParamsModel model});
}

class BookingAppointmentWithServer extends BookingAppointmentDataSource {
  DioConsumer dioConsumer;

  @override
  Future<ResponseModel> bookingAppointment(
          {required AppointmentParamsModel model}) async =>
      remoteExecute(
          request: dioConsumer.postRequest(
              path: EndPoints.bookGroupAppointment, body: model.toJson()),
          fromJsonFunction: ResponseModel.fromJson);

  BookingAppointmentWithServer(this.dioConsumer);
}
