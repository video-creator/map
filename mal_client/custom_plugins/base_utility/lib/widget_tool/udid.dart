import 'package:uuid/uuid.dart';

const Uuid uuidGenerator = Uuid();
class UDIDHelper {
  static generateV1() {
    return uuidGenerator.v1();
  }
}

uuid() {
  return UDIDHelper.generateV1();
}