import 'package:get_it/get_it.dart';

class Injector {
  static Injector? _instance;

  Injector._();

  factory Injector() {
    _instance ??= Injector._();
    return _instance!;
  }

  final locator = GetIt.instance;

  void init() {
    _initHive();
  }

  void _initHive() {}
}
