import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/number_trivia_entities.dart';

abstract class NumberTriviaRepository{
  Future<Either<Failure, NumberTriviaEntities>>getConcreteNumberTrivia(int? number);
  Future<Either<Failure, NumberTriviaEntities>>getRandomNumberTrivia();
}