
import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../entities/comic_entity.dart';

abstract class ComicsListRepository {
  Future<Either<Failure, List<ComicEntity>>> getComicsList();
}