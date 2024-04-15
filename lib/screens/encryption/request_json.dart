import 'package:equatable/equatable.dart';

class RequestJson extends Equatable {
  final String name;
  final String password;

  const RequestJson({
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
      };

  @override
  String toString() {
    return "RequestJson(name:$name password:$password)";
  }

  @override
  List<Object?> get props => [name, password];
}
