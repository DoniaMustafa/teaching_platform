import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notification/domain/repositories/notification_repo.dart';

import '../../data/data_sources/notification_data_sourec.dart';

 class NotificationUseCase {

   NotificationRepo repo;
  Future<Either<Failure,ResponseModel>>getNotification()=>repo.getNotification();
   Future<Either<Failure,ResponseModel>>getMarkNotificationAsRead({required int id})=>repo.getMarkNotificationAsRead(id:id);
   NotificationUseCase(this.repo);
}


