class SpotifyRequest {
  String? email;
  String? password;
  bool? returnSecureToken;

  SpotifyRequest(
      {required this.email,
      required this.password,
      required this.returnSecureToken});

  SpotifyRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    returnSecureToken = json['returnSecureToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    data['returnSecureToken'] = returnSecureToken;
    return data;
  }
}
