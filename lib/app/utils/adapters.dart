import 'package:machine_test/app/modules/homePage/Model/generalResponse.dart';
import 'package:hive_flutter/adapters.dart';

class UserAdapter extends TypeAdapter<GeneralResponse> {
  @override
  final typeId = 0;

  @override
  GeneralResponse read(BinaryReader reader) {
    return GeneralResponse(reader.read());
  }

  @override
  void write(BinaryWriter writer, GeneralResponse obj) {
    writer.write(obj.name);
  }
}
