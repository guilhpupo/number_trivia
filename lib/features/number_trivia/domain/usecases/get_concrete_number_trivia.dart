import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/failure.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

abstract class IGetConcreteNumberTrivia {
  Future<Either<Failure, NumberTrivia>> execute({required int number});
}

class GetConcreteNumberTrivia implements IGetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> execute({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
