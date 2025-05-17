import 'package:local_auth/local_auth.dart';

Future<bool> canUseBiometric() async {
  final auth = LocalAuthentication();
  final canCheckBiometrics = await auth.canCheckBiometrics;
  final isDeviceSupported = await auth.isDeviceSupported();
  final available = await auth.getAvailableBiometrics();

  return canCheckBiometrics && isDeviceSupported && available.isNotEmpty;
}
