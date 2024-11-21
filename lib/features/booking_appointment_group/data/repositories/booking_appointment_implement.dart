import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/booking_appointment_group/data/data_sources/booking_appointment_data_source.dart';
import 'package:teaching/features/booking_appointment_group/data/models/appointment_date.dart';
import 'package:teaching/features/booking_appointment_group/domain/repositories/booking_appointment_repo.dart';

class BookingAppointmentImplement extends BookingAppointmentRepo {
  BookingAppointmentDataSource dataSource;

  BookingAppointmentImplement(this.dataSource);

  @override
  Future<Either<Failure,ResponseModel>> bookingAppointment(
      {required AppointmentParamsModel model})async=>
      execute(()=>dataSource.bookingAppointment(model: model));
}
