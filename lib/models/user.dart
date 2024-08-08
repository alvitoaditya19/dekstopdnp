part of 'models.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? profilePicture;
  final String? position;

 const UserModel(this.id, this.email,
      {this.name, this.profilePicture, this.position});

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  UserModel copyWith({String? name, String? profilePicture, String? position}) =>
      UserModel(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          position: position ?? this.position,);

  @override
  List<Object> get props =>
      [id, email, name!, profilePicture!, position!];
}
