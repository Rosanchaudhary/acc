import 'package:acc/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final recomendations = ["All Chats", "Unread", "Archived"];
  final chats = [
    Chat(
        name: "AirBNB",
        text: "Hi Adam Smith,",
        time: "20.00",
        imageUrl: 'assets/airbnb_circular.png'),
    Chat(
        name: "Apple Music",
        text: "Congratulations",
        time: "20.00",
        imageUrl: 'assets/apple_music.png'),
    Chat(
        name: "Android",
        text: "Congratulations",
        time: "20.00",
        imageUrl: 'assets/android.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Image.asset(
          "assets/search.png",
          height: 10,
          width: 10,
        ),
        title: const Text(
          "Chat Box",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "Search",
                  suffixIcon: const Icon(Icons.search),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(18))),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: recomendations.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 90,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(18)),
                        child: Center(
                            child: Text(
                          recomendations[index],
                          style: const TextStyle(color: Colors.blue),
                        )),
                      ),
                    );
                  }),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: chats.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(chats[index].imageUrl),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                chats[index].name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                chats[index].text,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                chats[index].time,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
