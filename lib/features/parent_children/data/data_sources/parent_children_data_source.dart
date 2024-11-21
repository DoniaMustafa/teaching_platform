import 'package:teaching/core/export/export.dart';
import 'package:teaching/features/grades/my_grades/data/models/my_grades_model.dart';
import 'package:teaching/features/parent_children/data/models/children_model.dart';
import 'package:teaching/features/notes/data/models/notes_booked_unbooked_responsee_model.dart';
import 'package:teaching/features/notes/data/models/notes_details_response_model.dart';
import 'package:teaching/features/notes/data/models/notes_responsee_model.dart';
import 'package:teaching/features/notes/data/models/reserve_note_book_model.dart';

abstract class ParentChildrenDataSource {
  Future<ResponseModel> getParentChildren({TeacherModel? model});
}

class ParentChildrenWithServer extends ParentChildrenDataSource {
  DioConsumer consumer;

  ParentChildrenWithServer(this.consumer);

  @override
  Future<ResponseModel> getParentChildren({TeacherModel? model}) async => remoteExecute(
      request: consumer.getRequest(
          path: EndPoints.getParentChildrenList,
       ),
      fromJsonFunction: ChildrenModel.fromJson);

}
