
import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../entities/comic_entity.dart';
import '../repository/comics_list_repo.dart';

class GetComicsList {
  final ComicsListRepository repository;

  GetComicsList(this.repository);

  Future<Either<Failure, List<ComicEntity>>> execute() async {
    return await repository.getComicsList();
  }
}