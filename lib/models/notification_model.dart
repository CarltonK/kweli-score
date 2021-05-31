class NotificationModel {
  String? title;
  String? body;
  String? dataTitle;
  String? dataBody;

  NotificationModel({
    this.title,
    this.body,
    this.dataTitle,
    this.dataBody,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json["notification"]["title"],
      body: json["notification"]["body"],
      dataTitle: json["data"]["title"],
      dataBody: json["data"]["body"],
    );
  }
}
