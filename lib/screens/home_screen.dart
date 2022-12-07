import 'package:acc/models/job_model.dart';
import 'package:acc/screens/notification_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> recomendations = ["All Job", "Writer", "Design", "Finance"];
  List<Job> jobs = [
    Job(
        title: "UI/UX Designer",
        companyName: "AirBNB",
        location: "United States",
        type: "Full Time",
        rate: '2.350',
        imageUrl: 'assets/airbnb.png'),
    Job(
        title: "Financial Planner",
        companyName: "Twitter",
        location: "United Kingdom",
        type: "Part Time",
        rate: '2.200',
        imageUrl: 'assets/twitter.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Image.asset(
          "assets/search.png",
          height: 10,
          width: 10,
        ),
        title: const Text(
          "Hello, Adam !",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(235, 241, 254, 1),
              ),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NotificationScreen()));
                  },
                  icon: const Icon(
                    Icons.notifications,
                    color: Color.fromRGBO(80, 133, 254, 1),
                  )),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromRGBO(235, 241, 254, 1),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.sort,
                          color: Color.fromRGBO(80, 133, 254, 1),
                        )),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Tips for you",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset("assets/banner.png")),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Job Recommendation",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                ),
              ],
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
                itemCount: jobs.length,
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
                          Image.asset(jobs[index].imageUrl),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                jobs[index].title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                jobs[index].companyName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "${jobs[index].location} - ${jobs[index].type}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
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
                              const Icon(
                                Icons.bookmark,
                                color: Colors.blue,
                              ),
                              Text(
                                jobs[index].rate,
                                style: const TextStyle(
                                  color: Colors.blue,
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
