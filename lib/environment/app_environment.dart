// ignore_for_file: unused_element

import '../../helpers/debugging_printer.dart';

class AppEnvironment {
  AppEnvironment._();

  static Environment current = Environment.dev;

  static bool get mockingEnabled => current == Environment.mock;
  static bool get developping => current == Environment.dev && true;

  static const Map<String, String> testAccount = {
    "email": "xx@yy.com",
    "password": "xxxxxx",
  };
  static void setupEnvironment(Environment environment) =>
      current = environment;

  //? Per environment assertions
  static void performEnvironmentAssertions() {
    Debugger.magenta(AppEnvironment.current.baseUrl);

    switch (current) {
      case Environment.mock:
        break;
      default:
        assert(
          current.baseUrl.isNotEmpty,
          '\n[AppEnvironment] Base Url should be provided when running a non mocking mode',
        );

        assert(
          current.baseUrl.startsWith('https') || current != Environment.prod,
          '\n[AppEnvironment] <Base Url> must start with "https" in PROD mode as its mandatory to stores publishing',
        );

        break;
    }
  }
}

enum Environment {
  mock(),
  dev(
    baseUrl: "http://www.spiraw-dev.com",
  ),
  preprod(
    baseUrl: "http://www.spiraw-preprod.com",
  ),
  prod(
    baseUrl: "https://www.spiraw.com",
  );

  final String baseUrl;
  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;

  const Environment({
    this.baseUrl = "",
    this.connectTimeout = 20000,
    this.sendTimeout = 30000,
    this.receiveTimeout = 25000,
  });
}
