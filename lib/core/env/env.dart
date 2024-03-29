import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(
  path: '.env',
)
abstract class Env {
  @EnviedField(varName: 'baseUrl')
  static String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'apiKey')
  static String apiKey = _Env.apiKey;
}