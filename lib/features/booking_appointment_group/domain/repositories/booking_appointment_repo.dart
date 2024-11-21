import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/booking_appointment_group/data/models/appointment_date.dart';

abstract class BookingAppointmentRepo {
  Future<Either<Failure,ResponseModel>> bookingAppointment({required AppointmentParamsModel model});
}

