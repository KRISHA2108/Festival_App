import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:fastival_application/Utils/all_data.dart';
import 'package:fastival_application/Utils/fonts_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import '../../model/all_data_model.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  bool isVisible = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  int fontSize = 18;
  String? wish;
  String? bg = " lib/assets/images/Splash.jpg";
  Color? bgcolor = Colors.white.withOpacity(0.2);
  Color textcolor = Colors.white;
  Alignment fontAlignment = Alignment.center;
  String font = fastivalFontFamily[0].fontFamily!;
  GlobalKey key = GlobalKey();

  Future<File> share() async {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(
      pixelRatio: 25,
    );
    ByteData? bytes = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    Uint8List uInt8list = bytes!.buffer.asUint8List();

    final Directory directory = await getTemporaryDirectory();
    File file = await File(
            "${directory.path}/QA-${DateTime.now().millisecondsSinceEpoch}.png")
        .create();
    file.writeAsBytesSync(uInt8list);

    return file;
  }

  Widget saveChild = const Icon(Icons.save_alt_rounded);

  @override
  Widget build(BuildContext context) {
    Festival data = ModalRoute.of(context)?.settings.arguments as Festival;
    Size s = MediaQuery.sizeOf(context);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Text(
                        'Edit Post',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: fastivalFontFamily[6].fontFamily,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        isVisible = false;
                        isVisible2 = false;
                        isVisible3 = false;
                        isVisible4 = false;
                        fontSize = 18;
                        wish;
                        bg = " lib/assets/images/Splash.jpg";
                        bgcolor = Colors.white.withOpacity(0.2);
                        textcolor = Colors.white;
                        fontAlignment = Alignment.center;
                        font = fastivalFontFamily[0].fontFamily!;

                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                RepaintBoundary(
                  key: key,
                  child: Container(
                    height: 350,
                    width: 400,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: bgcolor ?? Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      image: bg != null
                          ? DecorationImage(
                              image: NetworkImage(
                                bg!,
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Column(
                      children: List.generate(
                        1,
                        (index) => Align(
                          alignment: fontAlignment,
                          child: Text(
                            "$wish",
                            style: TextStyle(
                              fontSize: fontSize.toDouble(),
                              color: textcolor,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //Fonts change
                Visibility(
                  visible: isVisible,
                  child: Container(
                    width: s.width,
                    height: s.height * 0.35,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListWheelScrollView(
                            onSelectedItemChanged: (value) {
                              wish = data.wishes[value];
                              setState(() {});
                            },
                            itemExtent: 50,
                            diameterRatio: 1,
                            squeeze: 0.8,
                            children: List.generate(
                              data.wishes.length,
                              (index) => Text(
                                data.wishes[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily:
                                      fastivalFontFamily[index].fontFamily,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible4,
                  child: Container(
                    width: s.width,
                    height: s.height * 0.35,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Font Size",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily:
                                          fastivalFontFamily[6].fontFamily,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              fontSize--;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.text_decrease,
                                            color: Colors.white,
                                          )),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            fontSize++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.text_increase,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: s.height * 0.01,
                                  ),
                                  Text(
                                    "Font Align",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily:
                                          fastivalFontFamily[6].fontFamily,
                                    ),
                                  ),
                                  SizedBox(
                                    height: s.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            fontAlignment = Alignment.topLeft;
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.format_align_left,
                                            color: Colors.white,
                                          )),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            fontAlignment = Alignment.center;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.format_align_center,
                                          color: Colors.white,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            fontAlignment =
                                                Alignment.bottomRight;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.format_align_right,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: s.height * 0.01,
                          ),
                          Text(
                            "Font Family",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: fastivalFontFamily[6].fontFamily,
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.01,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                fastivalFontFamily.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    font = fastivalFontFamily[index].fontFamily;
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "ABC",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: fastivalFontFamily[index]
                                            .fontFamily,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.01,
                          ),
                          Text(
                            "Text Color",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: fastivalFontFamily[6].fontFamily,
                            ),
                          ),
                          SizedBox(
                            height: s.height * 0.01,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  FastivalColors.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        textcolor = FastivalColors[index];
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            width: 2,
                                          ),
                                          color: FastivalColors[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //bg change
                Visibility(
                  visible: isVisible2,
                  child: Container(
                    width: s.width,
                    height: s.height * 0.35,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  "Background Color",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily:
                                        fastivalFontFamily[6].fontFamily,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ...List.generate(
                                      FastivalColors.length,
                                      (index) => GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            bgcolor = FastivalColors[index];
                                            bg = null;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                width: 2,
                                              ),
                                              color: FastivalColors[index],
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
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Background Image",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: fastivalFontFamily[6].fontFamily,
                          ),
                        ),
                        SizedBox(
                          height: s.height * 0.01,
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: data.images.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    bg = data.images[index];
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(data.images[index]),
                                        fit: BoxFit.cover),
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.7),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),
                Container(
                  width: s.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          isVisible = !isVisible;
                          isVisible2 = false;
                          isVisible3 = false;
                          isVisible4 = false;
                          setState(() {});
                        },
                        icon: const Icon(Icons.text_fields_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          isVisible4 = !isVisible4;
                          isVisible2 = false;
                          isVisible3 = false;
                          isVisible = false;
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.abc,
                          size: 37,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          isVisible2 = !isVisible2;
                          isVisible3 = false;
                          isVisible = false;
                          isVisible4 = false;
                          setState(() {});
                        },
                        icon: const Icon(Icons.image),
                      ),
                      IconButton(
                        onPressed: () async {
                          saveChild = const CircularProgressIndicator();
                          setState(() {});
                          File file = await share();
                          ImageGallerySaver.saveFile(file.path).then(
                            (value) {
                              saveChild = const Icon(Icons.done)
                                  as CircularProgressIndicator;
                              setState(() {});
                            },
                          );
                        },
                        icon: const Icon(Icons.download),
                      ),
                      IconButton(
                        onPressed: () async {
                          File file = await share();
                          ShareExtend.share(file.path, "file");
                        },
                        icon: const Icon(Icons.share),
                      ),
                    ],
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

extension on ByteData {
  get buffer => null;
}
