import 'package:dartz/dartz.dart';
import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/notification/domain/repositories/notification_repo.dart';

import '../../data/data_sources/notification_data_sourec.dart';

class NotificationImplement extends NotificationRepo {
  NotificationDataSource dataSource;
  @override
  Future<Either<Failure, ResponseModel>> getNotification() =>
      execute(() => dataSource.getNotification());

  NotificationImplement(this.dataSource);

  @override
  Future<Either<Failure, ResponseModel>> getMarkNotificationAsRead(
          {required int id}) =>
      execute(() => dataSource.getMarkNotificationAsRead(id: id));
}
