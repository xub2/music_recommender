import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'views/music_recommendation_screen/music_recommendation_screen.dart';
import 'view_2/music_player.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Recommender',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff19093C)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff19093C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Text(
                'My\nSpotify',
                textAlign: TextAlign.center,
                style: GoogleFonts.rubikMonoOne(
                  textStyle: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MusicPlayer()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.all(0),
                    fixedSize: Size(130, 130),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.asset(
                          'assets/images/play.png',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        right: 5,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            'Player',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff19093C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MusicRecommendationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.all(0),
                    fixedSize: Size(130, 130),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.asset(
                          'assets/images/Search.png',
                          fit: BoxFit.cover,
                          width: 130,
                          height: 130,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        right: 5,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            'Search',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff19093C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://open.spotify.com/'));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.all(0),
                    fixedSize: Size(130, 130),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.asset(
                          'assets/images/Spotify.png',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        right: 5,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            'Spotify Web',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff19093C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.all(0),
                    fixedSize: Size(130, 130),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18.0),
                        child: Image.asset(
                          'assets/images/Exit1.png',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        right: 5,
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            'Exit',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff19093C),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
