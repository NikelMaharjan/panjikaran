






import 'package:flutter_riverpod/flutter_riverpod.dart';

final visibleProvider = StateNotifierProvider<VisibleProvider, bool>((ref) => VisibleProvider(true));


class VisibleProvider extends StateNotifier<bool>{

  VisibleProvider(super.state);


  void visible(){

    if(state){
      state = false;
    }
    else{
      state = true;
    }


  }





}