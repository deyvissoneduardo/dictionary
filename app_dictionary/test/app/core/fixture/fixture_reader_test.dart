import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'fixture_reader.dart';

void main() {
  group('should test fixture', () {
    test('shoulf return json', () {
      final json =
          FixtureReader.getJsonData('core/fixture/words_dictionary.json');

      expect(json, isNotEmpty);
    });

    test('should return Map<String dynamic>', () {
      final data = FixtureReader.getData<Map<String, dynamic>>(
        'core/fixture/words_dictionary.json',
      );

      expect(
        data,
        isA<Map<String, dynamic>>(),
      );

      expect(data['id'], 1);
    });

    test('should return FileSystemException if is file not found', () {
      const call = FixtureReader.getData;

      expect(() => call('error.json'), throwsA(isA<FileSystemException>()));
    });
  });
}
