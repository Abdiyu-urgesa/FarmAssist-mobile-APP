class Predictmodel {
  String? classs;
  String? confidence;

  Predictmodel({this.classs, this.confidence});

  Predictmodel.fromJson(Map<String, dynamic> json) {
    classs = json['class'];
    confidence = json['confidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class'] = this.classs;
    data['confidence'] = this.confidence;
    return data;
  }
}
