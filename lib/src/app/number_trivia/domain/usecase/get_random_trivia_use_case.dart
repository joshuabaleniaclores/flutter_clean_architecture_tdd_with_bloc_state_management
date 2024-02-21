import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../entities/number_trivia_entities.dart';
import '../repository/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTriviaEntities, NoParams>{
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure,NumberTriviaEntities>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }

}
