import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';



final modeProvider = StateNotifierProvider.autoDispose<ValidationModeState, AutovalidateMode>((ref) => ValidationModeState(AutovalidateMode.disabled));
class ValidationModeState extends StateNotifier<AutovalidateMode>{
  ValidationModeState(super.state);

  void changeMode(AutovalidateMode mode) {
    if (mode == AutovalidateMode.onUserInteraction) {
      state = AutovalidateMode.onUserInteraction;
    } else {
      state = AutovalidateMode.disabled;
    }
  }

  void change() {
    state = AutovalidateMode.onUserInteraction;
  }
  void disable(){
    state = AutovalidateMode.disabled;
  }

}

final loadingProvider = StateNotifierProvider<LoadingProvider, bool>((ref) => LoadingProvider(false));

class LoadingProvider extends StateNotifier<bool>{
  LoadingProvider(super.state);


  void toggle(){
    state = !state;
  }

}


//final connectivityProvider = Provider((ref) => Connectivity());





final imageProvider = StateNotifierProvider.autoDispose<ImageProvider, XFile?>(
        (ref) => ImageProvider(null));


class ImageProvider extends StateNotifier<XFile?>{
  ImageProvider(super.state);

  void pickAnImage(bool isCamera) async{
    final ImagePicker _picker = ImagePicker();
    if(isCamera){
      state = await _picker.pickImage(source: ImageSource.camera);
    }else{
      state = await _picker.pickImage(source: ImageSource.gallery);
    }
  }

}


final imageProvider1 = StateNotifierProvider.autoDispose<ImageProvider1, XFile?>(
        (ref) => ImageProvider1(null));


class ImageProvider1 extends StateNotifier<XFile?>{
  ImageProvider1(super.state);

  void pickAnImage(bool isCamera) async{
    final ImagePicker _picker = ImagePicker();
    if(isCamera){
      state = await _picker.pickImage(source: ImageSource.camera);
    }else{
      state = await _picker.pickImage(source: ImageSource.gallery);
    }
  }

}



final passView = StateProvider<bool>((ref) => false);