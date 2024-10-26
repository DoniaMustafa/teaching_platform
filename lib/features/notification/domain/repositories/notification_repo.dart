import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';

import '../../data/data_sources/notification_data_sourec.dart';

abstract class NotificationRepo {
  Future<Either<Failure,ResponseModel>>getNotification();
  Future<Either<Failure,ResponseModel>>getMarkNotificationAsRead({required int id});
}


