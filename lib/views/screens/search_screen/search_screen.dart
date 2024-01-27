import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/searchControler.dart';
import '../../widgets/custom_buton_outline.dart';
import '../../widgets/custom_text.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());

  List SearchText = [].obs;

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("======================> ${searchText}");
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white70,
          leading: Icon(Icons.arrow_back),
          title: Container(
            height: 45,
            child: TextFormField(
              controller: searchText,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {
                        // SaveText(searchText.text);
                      },
                      icon: Icon(Icons.search)),
                  hintText: "Search here",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
          actions: const [
            Badge(
                alignment: Alignment.center,
                label: Text("2"),
                child: Icon(Icons.shopping_cart))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF393F42),
                        title: "Search result for “Earphone”",
                      ),
                      Container(
                        height: 20,
                        width: 75,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFF0F2F1))),
                        child: const Row(
                          children: [
                            Text("Filters"),
                            Icon(Icons.filter_alt_outlined)
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: GridView.builder(
                  itemCount: searchScreenController.products.value.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4 / 5, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var product = searchScreenController.products.value[index];
                    return Card(
                      elevation: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Image.asset(
                              "${product["image"]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${product["name"]}"),
                                Text("${product["price"]}"),
                                const SizedBox(
                                  height: 7,
                                ),
                                CustomButtonOutLine(
                                    height: 45,
                                    backgroundColor: Color(0xFF67C4A7),
                                    title: "Add To Cart",
                                    textColor: Colors.white,
                                    onTap: () {})
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
  //
  // Future<void> SaveText(String text) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString("searchText", text);
  // }
  //
  // Future<void> saveText() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String text = preferences.getString("searchText") ?? "";
  //
  //   setState(() {
  //     searchText = text as TextEditingController;
  //     searchText.addListener(() {
  //       text;
  //     });
  //   });
  // }
}
