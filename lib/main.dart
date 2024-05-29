import 'package:flutter/material.dart';

import 'views/music_recommendation_screen/music_recommendation_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


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
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse('https://open.spotify.com/'));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                textStyle: TextStyle(fontSize: 20),
                foregroundColor: Colors.green,
              ),
              child: Text('Spotify'),
            ),SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MusicRecommendationScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text('음악 추천을 받아볼까요?'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 버튼을 눌렀을 때 앱을 종료
                SystemNavigator.pop();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                textStyle: TextStyle(fontSize: 20),
                foregroundColor: Colors.red,
              ),
              child: Text('나가기'),
            ),
            SizedBox(height: 20),

            SizedBox(height: 220),
          ],
        ),
      ),
    );
  }
}