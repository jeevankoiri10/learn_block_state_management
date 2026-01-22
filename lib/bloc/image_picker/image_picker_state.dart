import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable {
  final XFile? imgFile;
  const ImagePickerState({this.imgFile});

  @override
  List<Object?> get props => [imgFile];

  ImagePickerState copyWith({XFile? imgFile}) {
    return ImagePickerState(imgFile: imgFile ?? this.imgFile);
  }
}
