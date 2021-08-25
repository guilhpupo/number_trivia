import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test text');

  test('NumberTriviaModel should be a subclass of NumberTrivia entity',
      () => expect(tNumberTriviaModel, isA<NumberTrivia>()));

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer', () {
      final Map<String, dynamic> jsonMap = jsonDecode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);
    });

    test('should return a valid model when the JSON number is a double', () {
      final Map<String, dynamic> jsonMap =
          jsonDecode(fixture('trivia_double.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      const expectedMap = {'number': 1, 'text': "Test text"};

      final result = tNumberTriviaModel.toJson();

      expect(result, expectedMap);
    });
  });
}
