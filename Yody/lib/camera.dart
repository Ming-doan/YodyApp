import 'package:camera/camera.dart';
import 'package:clothing_store_app_ui/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Camera extends StatefulWidget {
  final List<CameraDescription> cameras;
  const Camera({Key? key, required this.cameras}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController controller;
  late XFile pictureFile;
  late CameraDescription currentCamera;

  void camSetup() {
    controller = CameraController(currentCamera, ResolutionPreset.max);
    controller.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    currentCamera = widget.cameras[0];
    camSetup();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleChangeCamera(camIndex) {
    if (camIndex == widget.cameras[0]) {
      currentCamera = widget.cameras[1];
      camSetup();
    } else {
      currentCamera = widget.cameras[0];
      camSetup();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorPalette.yodyyellow,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 0,
                child: Container(
                  width: width,
                  height: (width / 9) * 16,
                  child: !controller.value.isInitialized
                      ? Container()
                      : CameraPreview(controller),
                )),
            Positioned(
                top: 0,
                width: width,
                child: Padding(
                  padding: EdgeInsets.all(BoxSpace.paddingSmall),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          color: ColorPalette.yodyyellow,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            size: 30,
                          )),
                      IconButton(
                          color: ColorPalette.yodyyellow,
                          onPressed: () {
                            handleChangeCamera(currentCamera);
                          },
                          icon: Icon(
                            Icons.switch_camera_rounded,
                            size: 30,
                          ))
                    ],
                  ),
                )),
            Positioned(
                bottom: 10.0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ClothesCategories(),
                    SizedBox(
                      height: BoxSpace.paddingSmall,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(
                                color: ColorPalette.yodyyellow, width: 5)),
                        width: 65,
                        height: 65,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60)),
                              padding: EdgeInsets.zero,
                              primary: Colors.white),
                          onPressed: () {},
                          child: Container(
                            margin: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                color: ColorPalette.yodyyellow,
                                borderRadius: BorderRadius.circular(60)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class ClothesCategories extends StatefulWidget {
  const ClothesCategories({Key? key}) : super(key: key);

  @override
  State<ClothesCategories> createState() => _ClothesCategoriesState();
}

class _ClothesCategoriesState extends State<ClothesCategories> {
  late bool isToggle;
  late int currentIndex;

  @override
  void initState() {
    currentIndex = -1;
    isToggle = false;
    super.initState();
  }

  List<String> images = [
    '1.jpg',
    '2.jpg',
    '3.jpg',
    '4.jpg',
    '3.jpg',
    '2.jpg',
    '1.jpg',
  ];

  void handleOpenClothesCategory(toggleState) {
    print(123);
    isToggle = !toggleState;
    setState(() {});
  }

  void handleSelectClothes(index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TextButton(
            style: TextButton.styleFrom(
                primary: ColorPalette.yodyyellow,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0)),
            onPressed: () {
              handleOpenClothesCategory(isToggle);
            },
            child: Icon(
              isToggle
                  ? Icons.arrow_drop_down_rounded
                  : Icons.arrow_drop_up_rounded,
              color: ColorPalette.yodyyellow,
              size: 40,
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          height: isToggle ? 120.0 : 0.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: ((context, index) => ClothesCategoryItem(
                  callback: handleSelectClothes,
                  index: index,
                  image: images[index],
                  currentIndex: currentIndex))),
        ),
      ],
    );
  }
}

class ClothesCategoryItem extends StatelessWidget {
  final int index;
  final String image;
  final int currentIndex;
  final Function callback;
  const ClothesCategoryItem(
      {Key? key,
      required this.index,
      required this.image,
      required this.currentIndex,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: 100,
        height: 120,
        decoration: BoxDecoration(
            border: Border.all(
                color: ColorPalette.yodyyellow,
                width: currentIndex == index ? 5.0 : 0.0),
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/$image'))),
      ),
    );
  }
}
