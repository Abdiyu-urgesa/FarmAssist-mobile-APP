class Postmodel {
  int? id;
  PostedBy? postedBy;
  String? title;
  String? discription;
  String? thumbnail;
  String? rank;
  String? createdAt;
  String? updatedAt;

  Postmodel(
      {this.id,
      this.postedBy,
      this.title,
      this.discription,
      this.thumbnail,
      this.rank,
      this.createdAt,
      this.updatedAt});

  Postmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postedBy = json['posted_by'] != null
        ? new PostedBy.fromJson(json['posted_by'])
        : null;
    title = json['title'];
    discription = json['discription'];
    thumbnail = json['thumbnail'];
    rank = json['rank'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.postedBy != null) {
      data['posted_by'] = this.postedBy!.toJson();
    }
    data['title'] = this.title;
    data['discription'] = this.discription;
    data['thumbnail'] = this.thumbnail;
    data['rank'] = this.rank;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PostedBy {
  int? id;
  String? email;
  String? username;
  bool? isActive;
  List<String>? groups;
  Userprofile? userprofile;

  PostedBy(
      {this.id,
      this.email,
      this.username,
      this.isActive,
      this.groups,
      this.userprofile});

  PostedBy.fromJson(Map<String, dynamic> json) {
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
