import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerStates extends Equatable {
  final XFile? image;

  const ImagePickerStates({this.image});

  ImagePickerStates copyWith({XFile? image}) {
    return ImagePickerStates(image: image ?? this.image);
  }

  @override
  List<Object?> get props => [image];
}
