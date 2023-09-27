import 'package:flutter/material.dart';
import '../data/products_data_source.dart';
import 'product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (DataSource.productsList.isEmpty) {
      Future.delayed(
        Duration.zero,
            () async {
          var data = await DataSource.getData();
          setState(() {
            DataSource.productsList = data;
            isLoading = false;
          });
        },
      );
    } else {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: GridView.builder(
          itemCount: DataSource.productsList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(
                      product: DataSource.productsList[index],
                    ),
                  ),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: Image.network(
                      DataSource.productsList[index].image,
                    ).image,
                  ),
                ),
                margin: const EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(8),
                  child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Expanded(
                              child: Text(
                                DataSource.productsList[index].detail,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                          ),
                        ),
                        Text(
                          '${DataSource.productsList[index].price.toString()} \$',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        )
                        ),
                      ],
                ),
              ),
              )
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}


