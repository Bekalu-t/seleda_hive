// ignore: file_names
import 'package:hive/hive.dart';
part 'Event.g.dart';

@HiveType(typeId: 0)
class Event {
  @HiveField(0)
  String? eventType;
  @HiveField(1)
  String? remark;
  @HiveField(2)
  double? amount;
  @HiveField(3)
  String? comment;
  @HiveField(4)
  String? attachment;
  @HiveField(5)
  DateTime? eventdateTime;
  @HiveField(6)
  DateTime? noticedDateTime;
  Event(
      {this.eventType,
      this.remark,
      this.amount,
      this.comment,
      this.attachment,
      this.eventdateTime,
      this.noticedDateTime});

  // Event.fromJson(Map<String, dynamic> json) {
  //   eventType = json['eventType'];
  //   remark = json['remark'];
  //   amount = json['amount'];
  //   comment = json['comment'];
  //   attachment = json['attachment'];
  //   eventdateTime = json['eventdateTime'];
  //   noticedDateTime = json['noticedDateTime'];
  // }
}
