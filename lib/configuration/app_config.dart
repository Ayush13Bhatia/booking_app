// ignore_for_file: constant_identifier_names

abstract class AppConfig {
  String get baseUrl;
  String get name;

}

class DemoConfig implements AppConfig {
  @override
  String get baseUrl => 'https://www.cgprojects.in/lens8/api/dummy/';
  @override
  String get name => Environment.DEMO;
}

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();


  static const String DEMO = 'DEMO';

  late AppConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  AppConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.DEMO:
        return DemoConfig();
      default:
        return DemoConfig();
    }
  }
}
