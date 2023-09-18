import 'dart:math';
import 'package:flutter/material.dart';
import 'convert_time.dart';
import 'global_bloc.dart';
import 'errors.dart';
import 'medicine.dart';
import 'medicine_type.dart';
import 'ReminderHome.dart';
import 'new_entry_bloc.dart';
import 'success_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NewEntry extends StatefulWidget {
  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late NewEntryBloc _newEntryBloc;

  late GlobalKey<ScaffoldState> _scaffoldKey;

  get globalBloc => null;

  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    _newEntryBloc.dispose();
  }

  void initState() {
    super.initState();
    _newEntryBloc = NewEntryBloc();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    initializeNotifications();
    initializeErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Colors.blueGrey[900]
        ),
        centerTitle: true,
        title: Text(
          "Add New Reminder",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: ('OpenSans'),
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Provider<NewEntryBloc>.value(
          value: _newEntryBloc,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            children: <Widget>[
              PanelTitle(
                key: ValueKey('medicine_name'),
                title: "Medicine Name",
                isRequired: true,


              ),
              TextFormField(
                maxLength: 12,
                style: TextStyle(
                  fontSize: 16,
                ),
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              PanelTitle(
                key: ValueKey('medicine_dosage'),
                title: "Dosage in mg",
                isRequired: false,
              ),
              TextFormField(
                controller: dosageController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 16,
                ),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              PanelTitle(
                key: Key('medicine_type'),
                title: "Medicine Type",
                isRequired: false,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: StreamBuilder<MedicineType>(
                  stream: _newEntryBloc.selectedMedicineType,
                  builder: (context, snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MedicineTypeColumn(
                            key: Key('medicine_bottle'),
                            type: MedicineType.Bottle,
                            name: "Bottle",
                            iconValue: 0xe900,
                            isSelected: snapshot.data == MedicineType.Bottle
                                ? true
                                : false),
                        MedicineTypeColumn(
                            key: Key('medicine_pill'),
                            type: MedicineType.Pill,
                            name: "Pill",
                            iconValue: 0xe901,
                            isSelected: snapshot.data == MedicineType.Pill
                                ? true
                                : false),

                        MedicineTypeColumn(
                            key: Key('medicine_tablet'),
                            type: MedicineType.Tablet,
                            name: "Tablet",
                            iconValue: 0xe903,
                            isSelected: snapshot.data == MedicineType.Tablet
                                ? true
                                : false),
                      ],
                    );
                  },
                ),
              ),
              PanelTitle(
                key: Key('medicine'),
                title: "Interval Selection",
                isRequired: true,
              ),
              //ScheduleCheckBoxes(),
              IntervalSelection(),
              PanelTitle(
                key: Key('medicine'),
                title: "Starting Time",
                isRequired: true,
              ),
              SelectTime(),
              SizedBox(
//                height: 35,
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.08,
                  right: MediaQuery.of(context).size.height * 0.08,
                ),
                child: Container(
                  width: 220,
                  height: 50,
                  child:ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blueGrey, elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
//                          fontSize: 28,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: ("OpenSans"),
                        ),
                      ),
                    ),
                    onPressed: () {
                      String medicineName ='';
                      int dosage = 0;
                      //--------------------Error Checking------------------------
                      //Had to do error checking in UI
                      //Due to unoptimized BLoC value-grabbing architecture
                      if (nameController.text == "") {
                        _newEntryBloc.submitError(EntryError.NameNull);
                        return;
                      }
                      if (nameController.text != "") {
                        medicineName = nameController.text;
                      }
                      if (dosageController.text == "") {
                        dosage = 0;
                      }
                      if (dosageController.text != "") {
                        dosage = int.parse(dosageController.text);
                      }
                      for (var medicine in _globalBloc.medicineList$.value) {
                        if (medicineName == medicine.medicineName) {
                          _newEntryBloc.submitError(EntryError.NameDuplicate);
                          return;
                        }
                      }
                      if (_newEntryBloc.selectedInterval$.value == 0) {
                        _newEntryBloc.submitError(EntryError.Interval);
                        return;
                      }
                      if (_newEntryBloc.selectedTimeOfDay$.value == "None") {
                        _newEntryBloc.submitError(EntryError.StartTime);
                        return;
                      }
                      //---------------------------------------------------------
                      String medicineType = _newEntryBloc
                          .selectedMedicineType.value
                          .toString()
                          .substring(13);
                      int interval = _newEntryBloc.selectedInterval$.value;
                      String startTime = _newEntryBloc.selectedTimeOfDay$.value;

                      List<int> intIDs =
                      makeIDs(24 / _newEntryBloc.selectedInterval$.value);
                      List<String> notificationIDs = intIDs
                          .map((i) => i.toString())
                          .toList(); //for Shared preference

                      Medicine newEntryMedicine = Medicine(
                        notificationIDs: notificationIDs,
                        medicineName: medicineName,
                        dosage: dosage,
                        medicineType: medicineType,
                        interval: interval,
                        startTime: startTime,
                      );

                      _globalBloc.updateMedicineList(newEntryMedicine);
                      scheduleNotification(newEntryMedicine);


                      Navigator.of(context).pop();
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (BuildContext context) {
////                            return SuccessScreen();
//                            return AlertDialog(
//                              title:Text('Success'),
//                              content: SingleChildScrollView(
//                                  child: ListBody(
//                                    children: <Widget>[
//                                      Text("Medication Reminder succesffuly created"),
//
//                                    ],
//                                  )
//                              ),
//                              actions: <Widget>[
//                                FlatButton(
//                                  child: Text("Close"),
//                                  onPressed: () {
//                                    Navigator.of(context).pop();
//                                    Navigator.push(
//                                      context,
//                                      MaterialPageRoute(builder: (context) => ReminderHome()),
//                                    );
//                                  },
//                                )
//                              ],
//                            );
//                          },
////                        ),
//                    )
//                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initializeErrorListen() {
    _newEntryBloc.errorState$.listen(
          (EntryError error) {
        switch (error) {
          case EntryError.NameNull:
            displayError("Please enter the medicine's name");
            break;
          case EntryError.NameDuplicate:
            displayError("Medicine name already exists");
            break;
          case EntryError.Dosage:
            displayError("Please enter the dosage required");
            break;
          case EntryError.Interval:
            displayError("Please select the reminder's interval");
            break;
          case EntryError.StartTime:
            displayError("Please select the reminder's starting time");
            break;
          default:
        }
      },
    );
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(error),
        duration: Duration(milliseconds: 2000),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  initializeNotifications() async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/esquire_launcher_icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: (String? payload) async {
    //       selectNotification(payload);
    //     }
    // );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => ReminderHome()),
    );
  }

//   Future<void> scheduleNotification(Medicine medicine) async {
//     var hour = int.parse(medicine.startTime[0] + medicine.startTime[1]);
//     var ogValue = hour;
//     var minute = int.parse(medicine.startTime[2] + medicine.startTime[3]);
//
//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'repeatDailyAtTime channel id',
//       'repeatDailyAtTime channel name',
//       'repeatDailyAtTime description',
//       importance: Importance.Max,
//       sound: RawResourceAndroidNotificationSound('sound'),
//       priority: Priority.High,
//       playSound: true,
//       ledColor: Color(0xFF3EB16F),
//       ledOffMs: 1000,
//       ledOnMs: 1000,
//       enableLights: true,
//
//     );
//     var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//     var platformChannelSpecifics = NotificationDetails(
//         androidPlatformChannelSpecifics,iOSPlatformChannelSpecifics);
//
//     for (int i = 0; i < (24 / medicine.interval).floor(); i++) {
//       if ((hour + (medicine.interval * i) > 23)) {
//         hour = hour + (medicine.interval * i) - 24;
//       } else {
//         hour = hour + (medicine.interval * i);
//       }
// //
//       await flutterLocalNotificationsPlugin.showDailyAtTime(
//           int.parse(medicine.notificationIDs[i]),
//           'Elderly Squire: ${medicine.medicineName}',
//           medicine.medicineType.toString() != MedicineType.None.toString()
//               ? 'It is time to take ${medicine.medicineType.toLowerCase()}, according to schedule'
//               : 'It is time to take your medicine, according to schedule',
//           Time(hour, minute, 0),
//           platformChannelSpecifics);
//       hour = ogValue;
//     }
//
//
//
//
//
//
//
//
//     //await flutterLocalNotificationsPlugin.cancelAll();
//   }

  Future <void> scheduleNotification(Medicine medicine) async {
    // var hour = int.parse(medicine.startTime.substring(0, 2));
    // var ogValue = hour;
    // var minute = int.parse(medicine.startTime.substring(2, 4));
    var hour = int.parse(medicine.startTime[0] + medicine.startTime[1]);
    var ogValue = hour;
    var minute = int.parse(medicine.startTime[2] + medicine.startTime[3]);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'repeatDailyAtTime channel id',
      'repeatDailyAtTime channel name',
      // 'repeatDailyAtTime description',
      importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('sound'),
      priority: Priority.high,

      playSound: true,
      ledColor: Color(0xFF3EB16F),
      ledOffMs: 1000,
      ledOnMs: 1000,
      enableLights: true,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    for (int i = 0; i < (24 / medicine.interval).floor(); i++) {
      if ((hour + (medicine.interval * i) > 23)) {
        hour = hour + (medicine.interval * i) - 24;
      } else {
        hour = hour + (medicine.interval * i);
      }
      await flutterLocalNotificationsPlugin.showDailyAtTime(
        int.parse(medicine.notificationIDs[i]),
        'Elderly Squire: ${medicine.medicineName}',
        medicine.medicineType.toString() != MedicineType.None.toString()
            ? 'It is time to take ${medicine.medicineType.toLowerCase()}, according to the schedule'
            : 'It is time to take your medicine, according to the schedule',
        Time(hour, minute, 0),
        platformChannelSpecifics,
      );
      hour = ogValue;
    }
  }


}

class IntervalSelection extends StatefulWidget {
  @override
  _IntervalSelectionState createState() => _IntervalSelectionState();
}

class _IntervalSelectionState extends State<IntervalSelection> {
  var _intervals = [
//    6,
//    8,
//    12,
//    24,
    4,
    6,
    8,
    12,
  ];
  var _selected = 0;

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc _newEntryBloc = Provider.of<NewEntryBloc>(context);
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Remind me every  ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            DropdownButton<int>(
              iconEnabledColor: Colors.blueGrey[900],
              hint: _selected == 0
                  ? Text(
                "Select an Interval",
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              )
                  : null,
              elevation: 4,
              value: _selected == 0 ? null : _selected,
              items: _intervals.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newVal) {
                setState(() {
                  _selected = newVal!;
                  _newEntryBloc.updateInterval(newVal);
                });
              },
            ),
            Text(
              _selected == 1 ? " hour" : " hours",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTime extends StatefulWidget {
  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    final NewEntryBloc _newEntryBloc = Provider.of<NewEntryBloc>(context, listen: false);
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;
        _newEntryBloc.updateTime("${convertTime(_time.hour.toString())}" +
            "${convertTime(_time.minute.toString())}");
      });
    }
    return picked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey, elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Center(
            child: Text(
              _clicked == false
                  ? "Pick Time"
                  : "${convertTime(_time.hour.toString())}:${convertTime(_time.minute.toString())}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: ("OpenSans"),
              ),
            ),
          ),
          onPressed: () {
            _selectTime(context);
          },

        ),
      ),
    );
  }
}

class MedicineTypeColumn extends StatelessWidget {
  final MedicineType type;
  final String name;
  final int iconValue;
  final bool isSelected;

  MedicineTypeColumn(
      {required Key key,
        required this.type,
        required this.name,
        required this.iconValue,
        required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewEntryBloc _newEntryBloc = Provider.of<NewEntryBloc>(context);
    return GestureDetector(
      onTap: () {
        _newEntryBloc.updateSelectedMedicine(type);
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Colors.blueGrey: Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 14.0),
                child: Icon(
                  IconData(iconValue, fontFamily: "Ic"),
                  size: 75,
                  color: isSelected ? Colors.white : Colors.blueGrey,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blueGrey : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.white : Colors.blueGrey[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  PanelTitle({
    required Key key,
    required this.title,
    required this.isRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 4),
      child: Text.rich(
        TextSpan(children: <TextSpan>[
          TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: isRequired ? " *" : "",
            style: TextStyle(fontSize: 14, color: Colors.blueGrey[900]),
          ),
        ]),
      ),
    );
  }
}
