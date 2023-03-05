import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
              "49. Product Card (BoxShadow, RoundedRectangleBorder)"),
          backgroundColor: firstColor,
        ),
        body: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(),
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ProductState>(
                builder: (context, product, _) => ProductCard(
                  imageUrl:
                      "https://www.ptppi.co.id/wp-content/uploads/2021/03/img-buah-buahan.jpg",
                  name: "Buah Mix 1Kg",
                  price: "Rp25.000",
                  notification: (product.quantity > 5) ? "Diskon 10%" : null,
                  quantity: product.quantity,
                  onAddCartTap: () {},
                  onIncrementTap: () {
                    product.quantity++;
                  },
                  onDecrementTap: () {
                    if (product.quantity > 0) product.quantity--;
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;
  set quantity(int newValue) {
    _quantity = newValue;
    notifyListeners();
  }
}

// * Sebaiknya file sendiri
// product_card.dart BEGIN
const Color firstColor = Colors.red;
const Color secondColor = Colors.lightBlue;

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String notification;
  final int quantity;
  final Function onAddCartTap;
  final Function onIncrementTap;
  final Function onDecrementTap;

  final TextStyle textStyle = TextStyle(
    fontFamily: "EBGaramond",
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.grey[800],
  );

  ProductCard(
      {this.imageUrl = "",
      this.name = "",
      this.price = "",
      this.notification = null,
      this.quantity = 0,
      this.onAddCartTap,
      this.onIncrementTap,
      this.onDecrementTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          width: 130,
          height: (notification != null) ? 270 : 250,
          decoration: BoxDecoration(
            color: Colors.green,
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                offset: Offset(1, 1),
                color: Colors.black.withOpacity(0.3),
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              (notification != null) ? notification : "",
              style: textStyle.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),
        // Notifikasi
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      name,
                      style: textStyle,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Text(
                      price,
                      style: textStyle.copyWith(
                        // * copyWith the same value, and replace component
                        fontSize: 12,
                        color: firstColor,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 140,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: firstColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onIncrementTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: textStyle,
                        ),
                        GestureDetector(
                          onTap: onDecrementTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.add_shopping_cart,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
// product_card.dart END