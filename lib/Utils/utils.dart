import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';


class SpaceType {
  SpaceType({
    this.title,
    this.subtitle,
    this.image,
    this.isSelected = false,
  });

  String title, subtitle, image;
  bool isSelected;
}

class Benefits {
  Benefits({
    this.title,
    this.isSelected = false,
  });

  String title;
  bool isSelected;
}

Future<List<Uint8List>> chooseFileUsingFilePicker() async {
  List<Uint8List> files=[];
  FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true,type:FileType.image,);
  if(result != null) {
    result.files.forEach((element) { 
      files.add(element.bytes);
    });
  }
  return files;
}