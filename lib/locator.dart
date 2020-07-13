import 'package:get_it/get_it.dart';
import 'package:match_making/ui/data/pref/pref_storage.dart';
import 'package:match_making/ui/data/pref/pref_storage_impl.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<PrefStorage>(() => PrefStorageImpl());
}