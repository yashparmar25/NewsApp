import 'package:flutter/material.dart';
import 'package:newsappmad/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/building.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.7,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome to YP News App",
                style: TextStyle(
                    color: const Color.fromARGB(255, 217, 6, 6),
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\nNews from around the\n       word for you",
                style: TextStyle(
                    color: const Color.fromARGB(255, 38, 38, 40),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Best time to read, take your time to read\n            a little more of this world",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 21.0,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 90.0),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(40),
                  elevation: 5.0,
                  color: Colors.blue,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
