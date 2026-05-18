import 'dart:ffi';

bool valid(Pointer<dynamic>? obj) {
  if (obj == null) return false;
  if (obj.address == 0) return false;
  return true;
}