import 'package:flutter_test/flutter_test.dart';
import 'package:tmdbmovies/app/modules/start/start_store.dart';
 
void main() {
  late StartStore store;

  setUpAll(() {
    store = StartStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}