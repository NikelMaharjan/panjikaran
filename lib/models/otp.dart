

class Otp {


  final String expired_at;
  final int otp;

  Otp({required this.expired_at, required this.otp});

  factory Otp.fromJson (Map<String, dynamic> json) {

    return Otp(
        expired_at: json['expired_at'],
        otp: json['otp']
    );

  }

}