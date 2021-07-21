import 'dart:convert';

ServerResponse serverResponseFromJson(String str) =>
    ServerResponse.fromJson(json.decode(str));

String serverResponseToJson(ServerResponse data) => json.encode(data.toJson());

class ServerResponse {
  ServerResponse({
    this.detail,
  });

  String? detail;

  factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
        detail: json["detail"] == null ? null : json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
      };
}
