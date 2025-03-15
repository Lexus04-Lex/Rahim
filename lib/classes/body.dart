import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Products>> fetchAlbum() async {
    try {
      final response = await http.get(Uri.parse(''));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['status'] == 'success') {
          List<dynamic> productsJson = data['data'];
          return productsJson.map((json) => Products.fromJson(json)).toList();
        } else {
          throw Exception(data['message']);
        }
      } else {
        throw Exception("Error fetching Album");
      }
    } catch (e) {
      throw Exception("Error fetching Album");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchAlbum(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final Products product = snapshot.data![index];
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.purple, Colors.white],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    leading: Image.network(
                      product.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(product.name),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    trailing: Text(product.createdAt.toString()),
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: 
                          SlideImages())
                        ],
                      )
                    ],
                  ),

                ],

              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class Products {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final DateTime createdAt;

  Products({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.createdAt,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['image_url'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

class SlideImages extends StatefulWidget {
  const SlideImages({super.key});

  @override
  State<SlideImages> createState() => _SlideImagesState();
}

class _SlideImagesState extends State<SlideImages> {
  final myList = [
    Image.network('https://mega.nz/file/rYQgRAqB#5VLN73QHKx0A8F1tBg7ZFsY8JGBnKUZsie0LMAyvJj8'),
    Image.network('https://mega.nz/file/GVRCHZxb#ZLMIPiIpJRgVWiKZZA8j_e1TyPpIUlNGOrnXvzj0S9g'),
    Image.network('https://mega.nz/file/eMoQQKJS#ahn-G9CyfpvZxm7sZLtHJ-glORuzt8cH5wqKstBm7FQ'),
    Image.network('https://mega.nz/file/PNZQQD6D#KTZU45IGU7JSkRkppY_lhSgEFUjrQZuAsCSd6CziEbY'),
    Image.network('https://mega.nz/file/qJBlBSQD#-XTtIt-BUp3oT_bW5N1hL8-nhLSBXiv-5GzY0emycDM'),
    Image.network('https://mega.nz/file/3cJzQKhJ#csJUVasi9P8Mx_O-82cH9fdFNtk6o6lmA4OEqjoR-34'),
    Image.network('https://mega.nz/file/SN5WxQZa#frph-bECcMgh46lWzOVW_wfLy6qPpArYgEdsNC4itwY'),
    Image.network('https://mega.nz/file/DAgVVKQY#IZuASy5PuRMmySHZXMxkS5asM75F_rI_ZuyhD9SCub4'),
    Image.network('https://mega.nz/file/CURi3SxY#JtCUxUjccc7Kefxi5SuP-u00kSFzlZ8bKydTJTqWNLk'),
    Image.network('https://mega.nz/file/Kc5RQbJa#ROOmjtgtuWqbSsApV4Z_yjaif_6ktkahCiwOaHd5B9s'),
    Image.network('https://mega.nz/file/SQgWgCyQ#fRnp3LjHmYcDOM6xPDPP_ENR33b-r7lho16vfmP1IS0'),
    Image.network('https://mega.nz/file/LEQkgQDQ#Rh_zjN5N3WCM0UW2bb-t0wSaU27nW_iIg3J6wQmbopo'),
    Image.network('https://mega.nz/file/SN5WxQZa#frph-bECcMgh46lWzOVW_wfLy6qPpArYgEdsNC4itwY'),
    Image.network('https://mega.nz/file/DAgVVKQY#IZuASy5PuRMmySHZXMxkS5asM75F_rI_ZuyhD9SCub4'),
    Image.network('https://mega.nz/file/CURi3SxY#JtCUxUjccc7Kefxi5SuP-u00kSFzlZ8bKydTJTqWNLk'),

  ];
  int mycurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: CarouselSlider(items: myList,
       options: CarouselOptions(
        autoPlay: true,
        height: 200,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.bounceIn,
        autoPlayInterval: Duration(milliseconds: 1200),
        onPageChanged: (index, reason) => 
        setState((){
          mycurrentIndex = index;
        }
        ,)
       ),

       
       ),
    );
  }
}