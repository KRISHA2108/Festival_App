import 'package:flutter/material.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../../Utils/Routes/routes.dart';
import '../../Utils/all_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: const Image(
              image: AssetImage('lib/assets/images/Splash.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: StackedCardCarousel(
              spaceBetweenItems: 290,
              items: [
                ...festival.map(
                  (e) => Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          Routes.detailPage,
                          arguments: e,
                        );
                      },
                      child: Container(
                        height: 300,
                        width: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(e.thumbnail),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
