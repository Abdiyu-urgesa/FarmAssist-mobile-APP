class ModelRegion {
  int? id;
  User? user;
  String? createdBy;
  String? regionName;

  ModelRegion({this.id, this.user, this.createdBy, this.regionName});

  ModelRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdBy = json['created_by'];
    regionName = json['Region_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['created_by'] = this.createdBy;
    data['Region_name'] = this.regionName;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? username;
  bool? isActive;
  List<String>? groups;
  Userprofile? userprofile;

  User(
      {this.id,
      this.email,
      this.username,
      this.isActive,
      this.groups,
      this.userprofile});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    isActive = json['is_active'];
    groups = json['groups'].cast<String>();
    userprofile = json['userprofile'] != null
        ? new Userprofile.fromJson(json['userprofile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['is_active'] = this.isActive;
    data['groups'] = this.groups;
    if (this.userprofile != null) {
      data['userprofile'] = this.userprofile!.toJson();
    }
    return data;
  }
}

class Userprofile {
  int? id;
  String? fname;
  String? mname;
  String? lname;
  String? phone;
  String? sex;
  String? profile;
  String? createdAt;
  int? user;

  Userprofile(
      {this.id,
      this.fname,
      this.mname,
      this.lname,
      this.phone,
      this.sex,
      this.profile,
      this.createdAt,
      this.user});

  Userprofile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    mname = json['Mname'];
    lname = json['lname'];
    phone = json['phone'];
    sex = json['sex'];
    profile = json['profile'];
    createdAt = json['created_at'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fname'] = this.fname;
    data['Mname'] = this.mname;
    data['lname'] = this.lname;
    data['phone'] = this.phone;
    data['sex'] = this.sex;
    data['profile'] = this.profile;
    data['created_at'] = this.createdAt;
    data['user'] = this.user;
    return data;
  }
}
