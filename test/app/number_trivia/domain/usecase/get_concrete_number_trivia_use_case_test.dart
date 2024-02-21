import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/src/app/number_trivia/domain/entities/number_trivia_entities.dart';
import 'package:number_trivia/src/app/number_trivia/domain/repository/number_trivia_repository.dart';
import 'package:number_trivia/src/app/number_trivia/domain/usecase/get_concrete_number_trivia_use_case.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main(){
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTriviaEntities(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
        () async {
      // arrange
      when(mockNumberTriviaRepository?.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // act
      final result = await usecase!(Params(number: tNumber));
      // assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository?.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}