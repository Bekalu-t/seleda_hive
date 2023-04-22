import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/Event.dart';
import '../pages/CashInPage.dart';
import '../pages/CashOutPage.dart';
import '../controller/EventController.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final eventController = Get.put(EventController());
  List<Color> colors = [
    Colors.green,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text('net balance'),
                  SizedBox(
                    width: 20,
                  ),
                  Text(eventController.total().toString())
                ],
              ),
              Row(
                children: [
                  Text('total cashin'),
                  SizedBox(
                    width: 20,
                  ),
                  Text(eventController.cashIn().toString())
                ],
              ),
              Row(
                children: [
                  Text('total cashout'),
                  SizedBox(
                    width: 20,
                  ),
                  Text(eventController.cashOut().toString())
                ],
              ),
              GetBuilder<EventController>(
                  builder: (cont) => ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: cont.EventsCount,
                      itemBuilder: (context, index) {
                        if (cont.EventsCount > 0) {
                          Event? event = cont.observableBox.getAt(index);
                          return Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                // color: Theme.of(context).primaryColor,
                                border: Border(
                                  left: BorderSide(
                                    width: 4.0,
                                    color: colors[
                                        event!.eventType == 'CashIn' ? 0 : 1],
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      //
                                    },
                                    onDoubleTap: () {},
                                    onLongPress: () {},
                                    child: ListTile(
                                      title: Text(event.remark!),
                                      subtitle: Text(event.amount.toString()),
                                      leading: IconButton(
                                          onPressed: () {
                                            if (event.eventType == 'CashIn') {
                                              Get.to(CashInPage(
                                                  index: index, event: event));
                                            } else {
                                              Get.to(CashOutPage(
                                                  index: index, event: event));
                                            }
                                          },
                                          icon: const Icon(Icons.edit)),
                                      trailing: IconButton(
                                          onPressed: () =>
                                              cont.deleteEvent(index: index),
                                          icon: const Icon(Icons.delete)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          // return Card(
                          //   child: ListTile(
                          //     title: Text(event?.remark ?? "N/A"),
                          //     subtitle:
                          //         Text(event?.amount.toString() ?? "Blank"),

                          //     trailing: Row(
                          //       children: [
                          //         IconButton(
                          //             onPressed: () => Get.to(CashOutPage(
                          //                 index: index, event: event)),
                          //             icon: const Icon(Icons.edit)),
                          //         SizedBox(
                          //           width: 10,
                          //         ),
                          //         IconButton(
                          //             onPressed: () =>
                          //                 cont.deleteEvent(index: index),
                          //             icon: const Icon(Icons.delete)),
                          //       ],
                          //     ),
                          //   ),
                          // );
                        } else {
                          return const Center(
                            child: Text("List is Empty"),
                          );
                        }
                      })),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/cashInPage');
                  },
                  child: Text('Cash In')),
              SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed('/cashOutPage');
                  },
                  child: Text('Cash Out')),
            ],
          ),
        ),
      ),
    );
  }
}
