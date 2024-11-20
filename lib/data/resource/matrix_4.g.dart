
import 'package:hive/hive.dart';
import 'package:vector_math/vector_math_64.dart';

class Matrix4Adapter extends TypeAdapter<Matrix4> {
  @override
  final typeId = 2;

  @override
  Matrix4 read(BinaryReader reader) {
    final List<double> matrixList = reader.readList(16).cast<double>();
    if (matrixList.isEmpty || matrixList.contains(null)) {
      return Matrix4.identity();
    }
    return Matrix4.fromList(matrixList);
  }

  @override
  void write(BinaryWriter writer, Matrix4 obj) {
    writer.writeList(obj.storage.toList());
  }
}


