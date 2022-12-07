import 'package:acc/models/notification.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final notifications = [
    NotificationModel(
        title: "Your application to Apple company has been read",
        time: "17.00",
        imageUrl: 'assets/tick.png'),
    NotificationModel(
        title: "New Job available", time: "17.00", imageUrl: 'assets/tick.png'),
    NotificationModel(
        title: "Your application to Apple company has been read",
        time: "17.00",
        imageUrl: 'assets/tick.png'),
    NotificationModel(
        title: "Your application to Apple company has been read",
        time: "17.00",
        imageUrl: 'assets/tick.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromRGBO(235, 241, 254, 1),
            ),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: Color.fromRGBO(80, 133, 254, 1),
                )),
          ),
        ),
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Image.asset(notifications[index].imageUrl),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            notifications[index].title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(notifications[index].time,
                            style: const TextStyle(
                                color: Colors.grey,),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
