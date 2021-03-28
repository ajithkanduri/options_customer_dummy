import 'package:options_consumer_app/src/services/DataStore.dart';
import 'package:rxdart/rxdart.dart';

class DataSnapBloc {
  DataStore _dataStore = DataStore();

  final _dataFetcher = PublishSubject<Map<String, dynamic>>();

  Observable<Map<String, dynamic>> get snapShot => _dataFetcher.stream;

  fetchFireStoreData() async {
    Map<String, dynamic> snapShot = await _dataStore.getData();
    _dataFetcher.sink.add(snapShot);
  }

  dispose() {
    _dataFetcher.close();
  }
}

final dataSnapShotBloc = DataSnapBloc();