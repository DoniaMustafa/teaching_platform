import 'package:dartz/dartz.dart';
import 'package:teaching/features/notes/data/models/reserve_note_book_model.dart';
import 'package:teaching/features/parent_children/domain/repositories/parent_children_repo.dart';

import '../../../../../core/export/export.dart';

class ParentChildrenRuseCase {
  ParentChildrenRepo repo;
  Future<Either<Failure, ResponseModel>> getParentChildren() =>
      repo.getParentChildren();

  ParentChildrenRuseCase(this.repo);
}
