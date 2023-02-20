class SocialAppModel{
  String? name;
  String? phone;
  String? email;

  SocialAppModel(this.name, this.phone, this.email);


   SocialAppModel.fromJson(Map<String, dynamic> json) {
      name=json["name"];
      phone= json["phone"];
      email= json["email"];
   }

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "phone": this.phone,
      "email": this.email,
    };
  }
}