import 'package:flutter/material.dart';

// 플레이리스트 화면에 들어갈 트랙묶음 위젯
class Track extends StatelessWidget {
  final String id;
  final String title;
  final List<String> artists;
  final String cover;
  final bool liked;

  const Track(
      {super.key,
      required this.id,
      required this.title,
      required this.artists,
      required this.cover,
      required this.liked});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  artists.join(', '),
                  style: const TextStyle(color: Colors.white),
                ),
                leading: Image.asset(
                  cover,
                  width: 50,
                  height: 50,
                ),
                trailing: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
        //const SizedBox(height: 5,),
      ],
    );
  }
}
