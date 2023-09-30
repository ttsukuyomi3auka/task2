import 'package:task2/task2.dart' as task2;
import "package:dio/dio.dart";
import 'package:freezed/builder.dart';

import 'models/prodResp/prodResp.dart';
import 'models/product/product.dart';

void main(List<String> arguments) async {
  Dio client = Dio();
  Response response = await client.get('https://dummyjson.com/products');
  ProdResp data = ProdResp.fromJson(response.data);
  print(data.products[0].brand);
  // int count = 0;
  // for (var elem in data.products) {
  //   if (elem.brand == "Apple") {
  //     count++;
  //   }
  // }
  // print(count);
  List<Product> productMassive = data.products;
  List<Product> resultMassive = [];
  String brand="OPPO";
  String textResult = "Техника $brand ";
  resultMassive = productMassive.where((el) => el.brand == brand).toList();

  for (var element in resultMassive) {
    textResult += "\n${element.title} за \$${element.price}";
    if (element.brand == "Apple") {
      resultMassive.add(element);
    }
  }
  print(textResult);
}
