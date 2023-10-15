


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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