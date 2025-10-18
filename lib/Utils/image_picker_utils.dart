import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> imagePickerFunc() async {
    return await _imagePicker.pickImage(source: ImageSource.camera);
  }
}
