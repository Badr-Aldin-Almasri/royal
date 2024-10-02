import 'package:envied/envied.dart';

part 'app_secrets.g.dart';

@Envied(path: '.env')
abstract class AppSecrets {
  @EnviedField(varName: 'API_URL', obfuscate: true)
  static final String apiURL = _AppSecrets.apiURL;
}
