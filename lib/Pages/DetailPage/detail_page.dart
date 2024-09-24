import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:fastival_application/model/all_data_model.dart';
import 'package:flutter/material.dart';
import '../../Utils/Routes/routes.dart';
import '../../Utils/fonts_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Festival data = ModalRoute.of(context)?.settings.arguments as Festival;
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      data.festivalName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: fastivalFontFamily[6].fontFamily,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FanCarouselImageSlider.sliderType2(
                          imagesLink: (imageList: data.detailing,).imageList,
                          isAssets: false,
                          sliderHeight:
                              MediaQuery.of(context).size.height * 0.5,
                          sliderWidth: MediaQuery.of(context).size.width * 0.95,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: fastivalFontFamily[6].fontFamily,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Date",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: fastivalFontFamily[6].fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.date,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: fastivalFontFamily[6].fontFamily,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Region",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: fastivalFontFamily[6].fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.region,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: fastivalFontFamily[6].fontFamily,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Moral",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: fastivalFontFamily[6].fontFamily,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.moral,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: fastivalFontFamily[6].fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.editPage, arguments: data);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
