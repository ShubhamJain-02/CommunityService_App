class UserModel {
  String uid;
  String name;
  int projects;
  int donation;
  UserModel(
      {required this.uid,
      required this.name,
      required this.donation,
      required this.projects});
}

UserModel? currentUser;
