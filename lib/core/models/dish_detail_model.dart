import 'package:getx_task/core/constants/image_constants.dart';

class DetailModel {
  String name;
  String price;
  String images;
  DetailModel({
    required this.name,
    required this.price,
    required this.images,
  });

  static List<DetailModel> dishDetail = [
    DetailModel(
        name: 'Veggie tomato mix',
        price: 'N1,900',
        images: ImageConstant.dish1Img),
    DetailModel(
        name: 'Egg and cucmber...',
        price: 'N1,300',
        images: ImageConstant.dish2Img),
    DetailModel(
        name: 'Fried chicken m.',
        price: 'N2,500',
        images: ImageConstant.dish3Img),
    DetailModel(
        name: 'Moi-moi',
        price: 'N3,100',
        images: ImageConstant.dish4Img),
    DetailModel(
        name: 'Veggie tomato mix',
        price: 'N1,900',
        images: ImageConstant.dish1Img),
    DetailModel(
        name: 'Egg and cucmber...',
        price: 'N1,300',
        images: ImageConstant.dish2Img),
    DetailModel(
        name: 'Fried chicken m.',
        price: 'N2,500',
        images: ImageConstant.dish3Img),
    DetailModel(
        name: 'Moi-moi and ekpa.',
        price: 'N3,100',
        images: ImageConstant.dish4Img),
  ];
}
