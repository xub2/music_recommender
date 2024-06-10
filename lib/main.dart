import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'views/music_recommendation_screen/music_recommendation_screen.dart';
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
                'Music\nRecommender',
                textAlign: TextAlign.center,
                style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                    fontSize: 65,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
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
                    fixedSize: Size(150, 150),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.asset(
                      'assets/images/Spotify.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
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
                    fixedSize: Size(150, 150),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.asset(
                      'assets/images/Search.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
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
                    launchUrl(Uri.parse('https://xuv2.notion.site/Music-Recommendation-by-Spotify-336c0ed599eb458496e06c4275a68d2b'));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.all(0),
                    fixedSize: Size(150, 150),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.asset(
                      'assets/images/notion.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
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
                    fixedSize: Size(150, 150),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.asset(
                      'assets/images/Exit.png',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
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
