import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/bloc/image_picker/image_picker_event.dart';
import 'package:test/bloc/image_picker/image_picker_state.dart';
import 'package:test/bloc/image_picker/utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    // Bloc accepts the state inside the super constructor

    on<CameraCapture>(_captureFromCamera);
    on<ImagePickerFromGalley>(_pickImageFromGallery);
  }

  void _captureFromCamera(
    CameraCapture event,
    Emitter<ImagePickerState> emit,
  ) async {
    XFile? file = await imagePickerUtils
        .cameraCapture(); // use the picker utils here and pass it to update the final state of the Bloc state.
    emit(state.copyWith(imgFile: file));
  }

  void _pickImageFromGallery(ImagePickerFromGalley event, Emitter emit) async {
    XFile? file = await imagePickerUtils.imageFromGallery();
    emit(state.copyWith(imgFile: file));
  }
}
