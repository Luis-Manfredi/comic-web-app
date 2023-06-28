import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import '../../domain/entities/comic_entity.dart';
import '../../domain/repository/comics_list_repo.dart';
import '../remote/api_remote.dart';

class ComicsListRepoImplementation extends ComicsListRepository {
  final APIRemoteDataSource apiRemoteDataSource; 

  ComicsListRepoImplementation(this.apiRemoteDataSource);

  @override
  Future<Either<Failure, List<ComicEntity>>> getComicsList() async {
    try {
      final comics = await apiRemoteDataSource.getComics();
      return Right(comics);
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }
}