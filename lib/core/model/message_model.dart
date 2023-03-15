class SendMessageModel{
  String? textMessage;
  String? date;
  String? senderId;
  String? receiverId;


  SendMessageModel.name(
      {this.textMessage,
        this.date,
        this.senderId,
        this.receiverId,
        });

  SendMessageModel.fromJson(Map<String, dynamic> json) {
    textMessage=json["textMessage"];
    date=json["date"];
    senderId=json["senderId"];
    receiverId= json["receiverId"];

  }

  Map<String, dynamic> toMap() {
    return {
      "textMessage": this.textMessage,
      "date": this.date,
      "senderId": this.senderId,
      "receiverId": this.receiverId,
    };
  }
}