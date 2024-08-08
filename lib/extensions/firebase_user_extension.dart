part of 'extensions.dart';

extension FirebaseUserExtension on auth.User {
  UserModel convertToUser({
    String name = "No Name",
    List<String> selectedGenres = const [],
    String position = "Operator",
  }) =>
      UserModel(
        this.uid,
        this.email!,
        name: name,
        position: position,
      );

  Future<UserModel> fromFireStore() async => await UserServices.getUser(this.uid);
}
