class CreateNewPostModel{
  String? name;
  String? image;
  String? postText;
  String? postImage;
  String? date;


  CreateNewPostModel.name(
      {this.name, this.image, this.postText, this.postImage, this.date});

  CreateNewPostModel.fromJson(Map<String, dynamic> json) {
    name=json["name"];
    image=json["image"];
    postText=json["postText"];
    postImage= json["postImage"];
    date= json["date"];

  }

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "image": this.image,
      "postText": this.postText,
      "postImage": this.postImage,
      "date": this.date,
    };
  }
}