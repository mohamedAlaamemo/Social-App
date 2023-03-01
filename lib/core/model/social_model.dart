class SocialAppModel{
  String? name;
  String? phone;
  String? email;
  String? image;
  String? bio;
  String? backGround;


  SocialAppModel.name(this.name, this.phone, this.email, this.image, this.bio,this.backGround);

  SocialAppModel.fromJson(Map<String, dynamic> json) {
      name=json["name"];
      image=json["image"];
      bio=json["bio"];
      phone= json["phone"];
      email= json["email"];
      backGround= json["backGround"];
   }

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "image": this.image,
      "bio": this.bio,
      "phone": this.phone,
      "email": this.email,
      "backGround": this.backGround,
    };
  }
}