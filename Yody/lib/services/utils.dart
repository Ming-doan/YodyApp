import 'package:clothing_store_app_ui/components/constants.dart';
import 'package:clothing_store_app_ui/models/categories.dart';
import 'package:clothing_store_app_ui/models/product.dart';

class MockedDataCategories {
  static List<Category> data = [
    Category(
        id: 0001,
        name: 'Woman',
        detail: 'Style for Woman. Berrylush Collection',
        image: 'woman.jpg',
        color: ColorPalette.berrylush,
        products: [
          Product(
              id: 1001,
              name: 'Berrylush',
              detail:
                  'Berrylush is a casualwear In Wastern syle that is relaxed,occasinal and suited fir everyday use.',
              images: [
                "1.jpg",
                "2.jpg",
                "3.jpg",
                "4.jpg",
              ],
              price: 120,
              colors: [
                ColorPalette.lavender,
                ColorPalette.naviblue,
                ColorPalette.coralred
              ]),
          Product(
              id: 1001,
              name: 'Berrylush',
              detail:
                  'Berrylush is a casualwear In Wastern syle that is relaxed,occasinal and suited fir everyday use.',
              images: [
                "1.jpg",
                "2.jpg",
                "3.jpg",
                "4.jpg",
              ],
              price: 120,
              colors: [ColorPalette.berrylush]),
          Product(
              id: 1001,
              name: 'Berrylush',
              detail:
                  'Berrylush is a casualwear In Wastern syle that is relaxed,occasinal and suited fir everyday use.',
              images: [
                "1.jpg",
                "2.jpg",
                "3.jpg",
                "4.jpg",
              ],
              price: 120,
              colors: [ColorPalette.berrylush]),
          Product(
              id: 1001,
              name: 'Berrylush',
              detail:
                  'Berrylush is a casualwear In Wastern syle that is relaxed,occasinal and suited fir everyday use.',
              images: [
                "1.jpg",
                "2.jpg",
                "3.jpg",
                "4.jpg",
              ],
              price: 120,
              colors: [ColorPalette.berrylush]),
        ]),
    Category(
        id: 0002,
        name: 'Men',
        detail: 'Style for Man. Yody Collection',
        image: 'men.jpg',
        color: ColorPalette.yodyyellow,
        products: []),
    Category(
        id: 0003,
        name: 'Shoes',
        detail: 'Style for Man. Yody Collection',
        image: 'shoes.jpeg',
        color: ColorPalette.yodyblue,
        products: []),
    Category(
        id: 0004,
        name: 'Kid',
        detail: 'Style for Man. Yody Collection',
        image: 'kid.jpg',
        color: ColorPalette.yodyyellow,
        products: []),
    Category(
        id: 0004,
        name: 'Kid',
        detail: 'Style for Man. Yody Collection',
        image: 'kid.jpg',
        color: ColorPalette.yodyyellow,
        products: []),
    Category(
        id: 0004,
        name: 'Kid',
        detail: 'Style for Man. Yody Collection',
        image: 'kid.jpg',
        color: ColorPalette.yodyyellow,
        products: [])
  ];
}
