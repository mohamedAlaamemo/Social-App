class SocialAppModel{
  String? name;
  String? phone;
  String? email;
  String? image;
  String? bio;
  String? backGround;
  String? uId;


  SocialAppModel.name(
      {this.name,
      this.phone,
      this.email,
      this.image,
      this.bio,
      this.uId,
      this.backGround});

  SocialAppModel.fromJson(Map<String, dynamic> json) {
      name=json["name"];
      image=json["image"];
      bio=json["bio"];
      phone= json["phone"];
      email= json["email"];
      backGround= json["backGround"];
      uId= json["uId"];
   }

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "image": this.image,
      "bio": this.bio,
      "phone": this.phone,
      "email": this.email,
      "backGround": this.backGround,
      "uId": this.uId,
    };
  }
}