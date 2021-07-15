import 'package:flutter_test/flutter_test.dart';
import 'package:tmdbmovies/app/modules/tvshows/tvshows_store.dart';
 
void main() {
  late TvshowsStore store;

  setUpAll(() {
    store = TvshowsStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}