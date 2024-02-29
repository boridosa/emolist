import 'package:flutter/material.dart';

// 홈화면 플레이리스트 부분에 들어갈 위젯
class Playlist extends StatelessWidget {
  final String id;
  final String title;
  final List<String> artists;
  final String cover;
  final bool liked;

  const Playlist({
    super.key,
    required this.id,
    required this.title,
    required this.artists,
    required this.cover,
    required this.liked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: Image.asset(cover),
        ),
        //const SizedBox(height: 5,),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
