import 'package:dartz/dartz.dart';
import 'package:teaching/features/notes/data/models/reserve_note_book_model.dart';

import '../../../../../core/export/export.dart';

abstract class ParentChildrenRepo {
  Future<Either<Failure,ResponseModel>> getParentChildren()   ;
}

