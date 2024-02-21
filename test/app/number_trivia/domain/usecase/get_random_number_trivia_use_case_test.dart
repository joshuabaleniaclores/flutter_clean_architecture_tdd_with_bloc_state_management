import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/src/app/number_trivia/domain/entities/number_trivia_entities.dart';
import 'package:number_trivia/src/app/number_trivia/domain/repository/number_trivia_repository.dart';
import 'package:number_trivia/src/app/number_trivia/domain/usecase/get_random_trivia_use_case.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main(){
  GetRandomNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository!);
  });

  final tNumberTrivia = NumberTriviaEntities(number: 1, text: 'test');

  test(
    'should get trivia from the repository',
        () async {
      // arrange
      when(mockNumberTriviaRepository?.getRandomNumberTrivia())
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await usecase!(NoParams());
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository!.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}