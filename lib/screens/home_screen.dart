import 'package:electronicss_shop/screens/cart_screen.dart';
import 'package:electronicss_shop/screens/dataModel/item_model.dart';
import 'package:electronicss_shop/services/items_network_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ItemNetworkService itemNetworkService = ItemNetworkService();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.pushNamed(context, CartScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
      body: FutureBuilder<List<ItemModel>>(
        future: itemNetworkService.fetchItem(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var currentproduct = snapshot.data![index];
                return Column(
                  children: [
                    Image(image: NetworkImage("image:${currentproduct.image}")),
                    Text("name:${currentproduct.name}"),
                    Text("price:${currentproduct.price}"),
                    Text("stock:${currentproduct.stock}"),
                    Text("createDate:${currentproduct.createdate}"),
                    Text("category:${currentproduct.category}"),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            print('the error is ${snapshot.error}');
            return Text('the error: ${snapshot.error}');
          }
          return const Text("Loading...");
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        iconSize: 30,
        backgroundColor: Colors.lightBlue,
        // currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
