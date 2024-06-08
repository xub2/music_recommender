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
      backgroundColor: Color(0xff19093C),  // 배경 색을 0xff19093C로 설정
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,  // 버튼을 중앙에 배치
          children: [
            Spacer(),  // 남은 공간을 채우기 위한 Spacer 위젯
            Container(
              alignment: Alignment.center, // 텍스트를 중앙 정렬
              child: Text(
                'Music\nRecommender',
                textAlign: TextAlign.center,  // 텍스트 중앙 정렬
                style: GoogleFonts.lobster(  // Lobster 폰트 사용
                  textStyle: TextStyle(
                    fontSize: 65,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),  // 텍스트와 버튼 사이의 간격
            ElevatedButton(
              onPressed: () {
                launchUrl(Uri.parse('https://open.spotify.com/'));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                foregroundColor: Color(0xff19093C),
                backgroundColor: Colors.white,
                minimumSize: Size(300, 60),  // 버튼 최소 크기 설정
              ),
              child: Text('Spotify'),
            ),
            SizedBox(height: 20),  // 버튼 사이에 간격 추가
            ElevatedButton(
              onPressed: () {
                // 버튼을 눌렀을 때 MusicRecommendationScreen으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MusicRecommendationScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),  // 버튼 크기 조정
                textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  // 텍스트 스타일
                foregroundColor: Color(0xff19093C),  // 폰트 색상 설정
                backgroundColor: Colors.white,
                minimumSize: Size(300, 60),  // 버튼 최소 크기 설정
              ),
              child: Text('음악 추천 받기'),
            ),
            SizedBox(height: 20),  // 버튼 사이에 간격 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://xuv2.notion.site/Music-Recommendation-by-Spotify-336c0ed599eb458496e06c4275a68d2b'));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),  // 버튼 크기 조정
                    textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  // 텍스트 스타일
                    foregroundColor: Color(0xff19093C),  // 폰트 색상 설정
                    backgroundColor: Colors.white,
                    minimumSize: Size(145, 60),  // 버튼 최소 크기 설정
                  ),
                  child: Text('Notion'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),  // 버튼 크기 조정
                    textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  // 텍스트 스타일
                    foregroundColor: Colors.red,  // 폰트 색상 설정
                    backgroundColor: Colors.white,
                    minimumSize: Size(145, 60),  // 버튼 최소 크기 설정
                  ),
                  child: Text('나가기'),
                ),
                // 버튼 사이의 간격 추가
              ],
            ),
            SizedBox(height: 220),  // 버튼을 중앙보다 아래로 보내기 위해 추가한 공간
          ],
        ),
      ),
    );
  }
}
