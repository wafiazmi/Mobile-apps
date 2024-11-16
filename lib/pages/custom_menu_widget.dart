import 'package:flutter/material.dart';
import 'sample.dart';

@immutable
class CustomMenuWidget extends StatelessWidget {
  final Widget tujuanHalaman;
  final String image_path;
  final String text_menu;

  const CustomMenuWidget({
    super.key,
    this.tujuanHalaman = const SamplePage(),
    required this.image_path,
    this.text_menu = "Menu NaN",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => tujuanHalaman,
            ));
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image_path,
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text_menu,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
} 