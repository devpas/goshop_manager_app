import 'package:g_manager_app/modify/models/data/role_block_data.dart';

class EmployeeData {
  EmployeeData({
    String? name,
    String? email,
    String? phone,
    List<RoleBlockData>? listRoleBlock,
    List<EmployeeData>? children,
  }) {
    _name = name;
    _email = email;
    _phone = phone;
    _listRoleBlock = listRoleBlock;
    _children = children;
  }

  EmployeeData.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    if (json['role-block'] != null) {
      _listRoleBlock = [];
      json['role-block'].forEach((v) {
        _listRoleBlock?.add(RoleBlockData.fromJson(v));
      });
    }
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(EmployeeData.fromJson(v));
      });
    }
  }

  String? _name;
  String? _email;
  String? _phone;
  List<RoleBlockData>? _listRoleBlock;
  List<EmployeeData>? _children;

  EmployeeData copyWith({
    String? name,
    String? email,
    String? phone,
    List<RoleBlockData>? listRoleBlock,
    List<EmployeeData>? children,
  }) =>
      EmployeeData(
        name: name ?? _name,
        email: email ?? _email,
        phone: phone ?? _phone,
        listRoleBlock: listRoleBlock ?? _listRoleBlock,
        children: children ?? _children,
      );

  String? get name => _name;

  String? get email => _email;

  String? get phone => _phone;

  List<RoleBlockData>? get listRoleBlock => _listRoleBlock;

  List<EmployeeData>? get children => _children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    if (_children != null) {
      map['role-block'] = _children?.map((v) => v.toJson()).toList();
    }
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
