import 'package:flutter/material.dart';
import 'package:shimmer_effect/Skeleton.dart';
import 'package:shimmer_effect/constants.dart';
import 'package:shimmer_effect/news_card.dart';
import 'package:shimmer_effect/news_card_skelton.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Shimmer Effect App",
            style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: _isLoading
              ? ListView.separated(
                  itemBuilder: (context, index) => const NewsCardSkelton(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: defaultPadding),
                  itemCount: 5)
              : ListView.separated(
                  itemBuilder: (context, index) =>
                      NewsCard(image: "assert/images/android_jetpack.png"),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: defaultPadding),
                  itemCount: 6)
          ),
    );
  }
}
