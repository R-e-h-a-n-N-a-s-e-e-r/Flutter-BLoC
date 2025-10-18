import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_practice/BLoC/Image%20Picker/image_picker_events.dart';
import 'package:flutter_bloc_practice/BLoC/Image%20Picker/image_picker_states.dart';
import 'package:flutter_bloc_practice/Utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  ImagePickerUtils imagePickerUtils = ImagePickerUtils();

  ImagePickerBloc() : super(ImagePickerStates()) {
    on<CameraCapture>(_cameraCapture);
    on<ClearImage>(_clearImage);
  }

  void _cameraCapture(
    CameraCapture event,
    Emitter<ImagePickerStates> emit,
  ) async {
    XFile? file = await imagePickerUtils.imagePickerFunc();
    emit(state.copyWith(image: file));
  }

  void _clearImage(ClearImage event, Emitter<ImagePickerStates> emit) {
    emit(state.copyWith(image: null));
  }
}
