

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:model/models/common_state/common_state.dart';
import 'package:model/models/otp.dart';
import 'package:model/models/location.dart';
import 'package:model/provider/otp_state_provider.dart';
import 'package:model/services/otp_services.dart';

class OtpPage extends ConsumerStatefulWidget {



  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();

}

class _OtpPageState extends ConsumerState<OtpPage> {
  late Timer _timer;
  int _start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          ref.invalidate(otpStateProvider);
          _start = 10;
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {




    final otpState = ref.watch(otpStateProvider);



    return Scaffold(
      appBar: AppBar(
        
        automaticallyImplyLeading: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            color: Colors.green,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 40,
                    child: Icon(CupertinoIcons.profile_circled, size: 40,),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nikel Maharjan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text("nikelmaharjan@gmail.com")
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.check_circle_outline),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("One-time passwords enabled", style: TextStyle(fontSize: 20),),
                          Text(
                            "You can use the one-time password codes generated by this app to verify your sign-ins",
                            style: TextStyle(letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40,),



                Text("One-time password code",
                  style: TextStyle(fontSize: 20),),

                SizedBox(height: 20,),




                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Text("$_start"),
                      ),
                    ),

                    SizedBox(width: 10,),
                    
                    _buildOtp(otpState)

                  ],
                )







              ],
            ),
          ),
          // DropdownSearch<Province>(
          //
          //   dropdownDecoratorProps: DropDownDecoratorProps(
          //     dropdownSearchDecoration: InputDecoration(
          //       labelText: "Menu mode",
          //       hintText: "country in menu mode",
          //     )
          //   ),
          //
          //   asyncItems: (String filter) async {
          //
          //
          //     try{
          //
          //       var response = await Dio().get(
          //           "https://panjikaran.digitalpalika.org/api/v1/provinces"
          //       );
          //       final data = (response.data['results'] as List).map((e) => Province.fromJson(e)).toList();
          //       return data;
          //
          //     }
          //     on DioException catch (err) {
          //       throw "Something went wrong";
          //
          //     }
          //
          //   },
          //   onChanged: (Province? data) {
          //     print(data);
          //   },
          // )

        ],
      ),
    );
  }

   _buildOtp(CommonState otpState) {
    if(otpState.isLoad){
      return CircularProgressIndicator();
    }

    else if(otpState.errText.isEmpty){

      return Text(otpState.otp!.otp.toString(), style: TextStyle(fontSize: 20),);

    }

    else{
      return Center(child: Text(otpState.errText),);
    }
  }

}
