class User {
  int id;
  String fname;
  String lname;
  String phone;
  String email;
  String createdDate;
  dynamic updatedDate;
  int isActive;
  String fcmToken;
  int isScanned;
  dynamic bookCount;

  User({
    required this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.createdDate,
    this.updatedDate,
    required this.isActive,
    required this.fcmToken,
    required this.isScanned,
    this.bookCount,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fname: json["fname"],
        lname: json["lname"],
        phone: json["phone"],
        email: json["email"],
        createdDate: json["createdDate"],
        updatedDate: json["updatedDate"],
        isActive: json["isActive"],
        fcmToken: json["fcm_token"],
        isScanned: json["isScanned"],
        bookCount: json["bookCount"],
      );
}
