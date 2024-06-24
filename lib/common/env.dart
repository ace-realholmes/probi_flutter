import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env{
  @EnviedField(varName: 'DOMAIN', defaultValue: '', obfuscate: true)
  static String baseUrl= _Env.key;
}