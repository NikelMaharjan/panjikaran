

class Otp {


  final String expire_at;
  final int otp;

  Otp({required this.expire_at, required this.otp});

  factory Otp.fromJson (Map<String, dynamic> json) {

    return Otp(
        expire_at: json['expire_at'],
        otp: json['otp']
    );

  }

}