import 'package:elderly_squire_2023_remastered_v2/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

void main() => runApp(Calendar());

class Calendar extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  Calendar({super.key});

  Event buildEvent({Recurrence? recurrence}) {
    return Event(
      title: 'Sample Event',
      description: 'example description',
      location: 'Elderly Squire',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(minutes: 30)),
      allDay: false,
      iosParams: const IOSParams(
        reminder: Duration(minutes: 40),
        url: "http://example.com",
      ),
      androidParams: const AndroidParams(
        emailInvites: ["test@example.com"],
      ),
      recurrence: recurrence,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('EVENT TITLE'),
      //   ),
      home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 75,
//        backgroundColor: Colors.blueGrey[900],
        backgroundColor: Colors.blueGrey[900],
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          child: Icon(
            Icons.arrow_back_ios_new, // add custom icons also
          ),
        ),
        title: Image.asset('assets/images/calendar.png',
            height: 40, width: 125),
      ),
        body: Padding(
          padding: EdgeInsets.only(top:18,left:18,right:18,bottom:5),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:150,
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: const Text('ADD EVENT'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () {
                      Add2Calendar.addEvent2Cal(
                        buildEvent(),
                      );
                    },
                  ),
                ),
              ),
              const Divider(),
              Container(
                height:150,
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: const Text('ADD REPEATING EVENT'),
                    subtitle: const Text("weekly event for 3 months"),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () {
                      Add2Calendar.addEvent2Cal(buildEvent(
                        recurrence: Recurrence(
                          frequency: Frequency.weekly,
                          endDate: DateTime.now().add(const Duration(days: 60)),
                        ),
                      ));
                    },
                  ),
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
