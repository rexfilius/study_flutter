import 'package:equatable/equatable.dart';

class ApiResponse extends Equatable {
  final String data;
  final int id;

  const ApiResponse({
    required this.data,
    required this.id,
  });

  const ApiResponse.empty()
      : data = '',
        id = 0;

  ApiResponse copyWith({
    String? data,
    int? id,
  }) {
    return ApiResponse(
      data: data ?? this.data,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['data'] = data;
    map['id'] = id;
    return map;
  }

  @override
  String toString() {
    return {
      "CLASS": "ApiResponse",
      "data": data,
      "id": id,
    }.toString();
  }

  @override
  List<Object?> get props => [data, id];
}
