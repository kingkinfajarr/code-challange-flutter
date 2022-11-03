class EmployeesDetailResponse {
  EmployeesDetailItemResponse? employeesDetail;

  EmployeesDetailResponse({
    this.employeesDetail,
  });

  EmployeesDetailResponse.fromJson(Map<String, dynamic> json) {
    employeesDetail = json['data'] != null
        ? EmployeesDetailItemResponse.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (employeesDetail != null) {
      data['data'] = employeesDetail!.toJson();
    }
    return data;
  }
}

class EmployeesDetailItemResponse {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  EmployeesDetailItemResponse({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  EmployeesDetailItemResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}
