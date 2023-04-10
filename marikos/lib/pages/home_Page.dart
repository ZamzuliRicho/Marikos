import 'package:flutter/material.dart';
import 'package:marikos/models/city.dart';
import 'package:marikos/models/space.dart';
import 'package:marikos/models/tips.dart';
import 'package:marikos/providers/space_providers.dart';
import 'package:marikos/theme.dart';
import 'package:marikos/widgets/buttom_navbar_Item.dart';
import 'package:marikos/widgets/city_Cart.dart';
import 'package:marikos/widgets/space_Cart.dart';
import 'package:marikos/widgets/tips_Card.dart';
import 'package:provider/provider.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Mencari Kosan Wenak',
                style: grayTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            //NOTE: KOTA TERPOPULER
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Kota Terpopuler',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  cityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  cityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  cityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/city3.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  cityCard(
                    City(
                      id: 3,
                      name: 'Palembang',
                      imageUrl: 'assets/city4.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  cityCard(
                    City(
                      id: 3,
                      name: 'Makasar',
                      imageUrl: 'assets/city5.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  cityCard(
                    City(
                      id: 3,
                      name: 'Aceh',
                      imageUrl: 'assets/city6.png',
                      isPopular: true,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),

            //NOTE: TEMPAT REKOMENDASI
            Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'Tempat Rekomendasi',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommededSpace(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data as List<Space>;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: spaceCard(item),
                        );
                      }).toList(),
                    );
                  }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE : TIPS AND GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips And Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                        id: 1,
                        imageUrl: 'assets/tips1.png',
                        title: 'City Guideline',
                        updatedAt: '20 Desember 2022'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                        id: 1,
                        imageUrl: 'assets/tips2.png',
                        title: 'Jombang Fairship',
                        updatedAt: '22 Desember 2022'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xfff6f7f8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            bottomNavbarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            bottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            bottomNavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
