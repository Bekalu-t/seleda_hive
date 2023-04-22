import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/Event.dart';
import '../repository/box_repository.dart';
import 'package:flutter/material.dart';

class EventController extends GetxController {
  var totals = 0;
  var totalCashOut = 0;
  var totalCashIn = 0;
  var allTransactions = [].obs;
  var todaysRecords = [].obs;
  var cashInList = [].obs;
  var cashOutList = [].obs;
  List<dynamic> thisWeekRecords = [].obs;
  var event = Event().obs;
  var graphData = [].obs;
  final Box _observableBox = BoxRepository.getBox();
  Box get observableBox => _observableBox;
  int get EventsCount => _observableBox.length;

  createEvent({required Event eventModel}) {
    _observableBox.add(eventModel);
    update();
  }

  updateEvent({required int index, required Event eventModel}) {
    _observableBox.putAt(index, eventModel);
    update();
  }

  deleteEvent({required int index}) {
    _observableBox.deleteAt(index);
    update();
  }

  //final box = Hive.box<Event>('data');

  total() {
    //double totals = 0;
    var cashHistory = observableBox.values.toList();
    List a = [0, 0];
    for (var i = 0; i < cashHistory.length; i++) {
      a.add(cashHistory[i].eventType == 'CashIn'
          ? cashHistory[i].amount!
          : cashHistory[i].amount! * -1);
    }
    totals = a.reduce((value, element) => value + element);
    return totals;
  }

  cashIn() {
    // double totals = 0;
    var cashInHistory = observableBox.values.toList();
    List a = [0, 0];
    for (var i = 0; i < cashInHistory.length; i++) {
      a.add(cashInHistory[i].eventType == 'CashIn'
          ? cashInHistory[i].amount!
          : 0);
    }
    totalCashIn = a.reduce((value, element) => value + element);
    return totalCashIn;
  }

  cashOut() {
    //double totals = 0;
    var cashOutHistory = observableBox.values.toList();
    List a = [0, 0];
    for (var i = 0; i < cashOutHistory.length; i++) {
      a.add(cashOutHistory[i].eventType == 'CashOut'
          ? 0
          : cashOutHistory[i].amount! * -1);
    }
    totalCashOut = a.reduce((value, element) => value + element);
    return totalCashOut;
  }

  List<Event> today() {
    List<Event> today = [];
    var todayHistory = observableBox.values.toList();
    DateTime date = new DateTime.now();
    for (var i = 0; i < todayHistory.length; i++) {
      if (todayHistory[i].eventdateTime!.day == date.day) {
        today.add(todayHistory[i]);
      }
    }
    return today;
  }

  List<Event> week() {
    List<Event> week = [];
    DateTime date = new DateTime.now();
    var weekHistory = observableBox.values.toList();
    for (var i = 0; i < weekHistory.length; i++) {
      if (date.day - 7 <= weekHistory[i].eventdateTime!.day &&
          weekHistory[i].eventdateTime!.day <= date.day) {
        week.add(weekHistory[i]);
      }
    }
    return week;
  }

  List<Event> month() {
    List<Event> month = [];
    var monthHistory = observableBox.values.toList();
    DateTime date = new DateTime.now();
    for (var i = 0; i < monthHistory.length; i++) {
      if (monthHistory[i].eventdateTime!.month == date.month) {
        month.add(monthHistory[i]);
      }
    }
    return month;
  }

  List<Event> year() {
    List<Event> year = [];
    var yearHistory = observableBox.values.toList();
    DateTime date = new DateTime.now();
    for (var i = 0; i < yearHistory.length; i++) {
      if (yearHistory[i].eventdateTime!.year == date.year) {
        year.add(yearHistory[i]);
      }
    }
    return year;
  }

  double total_chart(List<Event> totalHistory) {
    List a = [0, 0];
    double totals = 0;
    for (var i = 0; i < totalHistory.length; i++) {
      a.add(totalHistory[i].eventType == 'CashIn'
          ? totalHistory[i].amount!
          : totalHistory[i].amount! * -1);
    }
    totals = a.reduce((value, element) => value + element);
    return totals;
  }

  List time(List<Event> history, bool hour) {
    List<Event> a = [];
    List total = [];
    int counter = 0;
    for (var c = 0; c < history.length; c++) {
      for (var i = c; i < history.length; i++) {
        if (hour) {
          if (history[i].eventdateTime!.hour ==
              history[c].eventdateTime!.hour) {
            a.add(history[i]);
            counter = i;
          }
        } else {
          if (history[i].eventdateTime!.day == history[c].eventdateTime!.day) {
            a.add(history[i]);
            counter = i;
          }
        }
      }
      total.add(total_chart(a));
      a.clear();
      c = counter;
    }
    print(total);
    return total;
  }
}
