import 'package:flutter/material.dart';
import 'package:music_recommender/models/music.dart';
import 'package:music_recommender/views/music_recommendation_screen/music_recommender.dart';

import 'widgets/music_list_tile.dart';

class MusicRecommendationScreen extends StatefulWidget {
  const MusicRecommendationScreen({super.key});

  @override
  State<MusicRecommendationScreen> createState() =>
      _MusicRecommendationScreenState();
}

class _MusicRecommendationScreenState extends State<MusicRecommendationScreen> {
  List<String> selectedGenres = [];
  final TextEditingController artistController = TextEditingController();
  bool isSearched = false;
  List<Music> musicList = [
    // Music(
    //     name: "Mercy",
    //     link: "https://open.spotify.com/track/0AS63m1wHv9n4VVRizK6Hc",
    //     artist: "Shawn Mendes",
    //     imageLink:
    //         "https://i.scdn.co/image/ab67616d0000b273ea3ef7697cfd5705b8f47521")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111427),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SafeArea(
              child: SizedBox(
                height: 36,
              ),
            ),
            Text(
              '당신의 음악 취향을 알려주세요',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: const Color(0xFF1a2038),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: TextField(
                      controller: artistController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "음악 또는 아티스트 명",
                          hintStyle: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      isSearched = true;
                      if (artistController.text.trim().isNotEmpty) {
                        musicList = await MusicRecommender.search(
                            artistController.text.trim(), selectedGenres);
                      }
                      setState(() {});
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.search),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (musicList.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: musicList.length,
                  itemBuilder: (context, index) => MusicListTile(
                    music: musicList[index],
                    index: index,
                  ),
                ),
              )
            else
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isSearched ? Icons.refresh : Icons.search,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.3,
                      ),
                      Text(
                        isSearched
                            ? '유사 음악 검색 중'
                            : '좋아하는 아티스트명을 입력해주세요',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}