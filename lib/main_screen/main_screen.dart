import 'package:flutter/material.dart';
import 'package:flutter_basic/main_screen/body_list_view.dart';
import 'package:flutter_basic/main_screen/card_view.dart';
import 'package:flutter_basic/main_screen/shadow_image_view.dart';
import 'package:flutter_basic/main_screen/title_app_bar.dart';
import 'package:lottie/lottie.dart';

import 'beverage_view.dart';
import 'navigation_icon.dart';
import 'news_car_view.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  List<bool> _isTapped = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const TitleAppBar(),
          const SliverToBoxAdapter(
              child: ShadowImageView(
                  imgUrl:
                      'assets/starbucks-image/01_01_2023_winter_e-frequency.png')),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child:
                  Image.asset('assets/starbucks-image/02_01_siren_order.png'),
            ),
          ),
          SliverToBoxAdapter(
            child: quickOrderWidget(),
          ),
          const SliverToBoxAdapter(
            child: ShadowImageView(
                imgUrl: 'assets/starbucks-image/03_01_chrismas_event.png'),
          ),
          SliverToBoxAdapter(
            child: whatsNewWidget(),
          ),
          const SliverToBoxAdapter(
            child: ShadowImageView(
                imgUrl: 'assets/starbucks-image/05_01_card.png'),
          ),
          const SliverToBoxAdapter(
            child: ShadowImageView(
                imgUrl: 'assets/starbucks-image/05_02_card.png'),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: recommandWidget(),
            ),
          ),
          const SliverToBoxAdapter(
            child: ShadowImageView(
              imgUrl: 'assets/starbucks-image/06_01_card.png',
            ),
          ),
          const SliverToBoxAdapter(
            child: ShadowImageView(
              imgUrl: 'assets/starbucks-image/06_02_card.png',
            ),
          ),
          const SliverToBoxAdapter(
            child: ShadowImageView(
              imgUrl: 'assets/starbucks-image/06_03_card.png',
            ),
          ),
          const SliverToBoxAdapter(
            child: ShadowImageView(
              imgUrl: 'assets/starbucks-image/06_04_card.png',
            ),
          ),
          const SliverToBoxAdapter(
            child: ShadowImageView(
              imgUrl: 'assets/starbucks-image/06_05_card.png',
            ),
          ),
        ],
      ),
      floatingActionButton: TextButton(
        style: TextButton.styleFrom(
            shape: const CircleBorder(),
            fixedSize: const Size(50, 50),
            backgroundColor: Colors.green),
        onPressed: () {},
        child: Image.asset(
          'assets/delivery_bike.png',
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavigationIcon(
                icon: Icons.home,
                label: 'Home',
                isTapped: _isTapped[0],
                onPressed: () {
                  setState(() {
                    _isTapped = _isTapped.map((e) => false).toList();
                    _isTapped[0] = true;
                  });
                }),
            NavigationIcon(
              icon: Icons.payment_outlined,
              label: 'Pay',
              isTapped: _isTapped[1],
              onPressed: () {
                setState(() {
                  _isTapped = _isTapped.map((e) => false).toList();
                  _isTapped[1] = true;
                });
              },
            ),
            NavigationIcon(
                icon: Icons.local_cafe,
                label: 'Order',
                isTapped: _isTapped[2],
                onPressed: () {
                  setState(() {
                    _isTapped = _isTapped.map((e) => false).toList();
                    _isTapped[2] = true;
                  });
                }),
            NavigationIcon(
              icon: Icons.shopping_bag,
              label: 'Shop',
              isTapped: _isTapped[3],
              onPressed: () {
                setState(() {
                  _isTapped = _isTapped.map((e) => false).toList();
                  _isTapped[3] = true;
                });
              },
            ),
            NavigationIcon(
                icon: Icons.more_horiz,
                label: 'Other',
                isTapped: _isTapped[4],
                onPressed: () {
                  setState(() {
                    _isTapped = _isTapped.map((e) => false).toList();
                    _isTapped[4] = true;
                  });
                }),
          ],
        ),
      ),
    );
  }

  Widget bodyList() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 400,
          color: Colors.deepPurple[300],
        ),
      ),
    );
  }

  Widget quickOrderWidget() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Quick Order',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                '최근 주문',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardView(onPressed: () {}),
                Container(
                  width: 30,
                ),
                CardView(onPressed: () {}),
                Container(
                  width: 30,
                ),
                CardView(onPressed: () {}),
                Container(
                  width: 30,
                ),
                CardView(onPressed: () {}),
                Container(
                  width: 30,
                ),
                CardView(onPressed: () {}),
                Container(
                  width: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget whatsNewWidget() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'What\'s New',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.green),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NewsCardView(
                  title: '12월 20일, 그리팅 카드 및 모바일 상품권 잔액 충전 서비스 안내',
                  subTitle: 'Greeting Card & 물품형 모바일 상품권 잔책 충전 기능 오픈!',
                  imgUrl: 'assets/starbucks-image/04_01_cardnews.png',
                  onPressed: () {},
                ),
                Container(
                  width: 15,
                ),
                NewsCardView(
                  title: '스벅TV \'스타벅스 10대 매장\' 선정 기념 구독자 이벤트',
                  subTitle: '스타벅스 코리아 10대 매장을 스벅TV에서 만나보세요!',
                  imgUrl: 'assets/starbucks-image/04_02_cardnews.png',
                  onPressed: () {},
                ),
                Container(
                  width: 15,
                ),
                NewsCardView(
                  title: '스타벅스 앱 보안 강화',
                  subTitle: '안전한 서비스 이용을 위하여 Pay 탭 이용, 다중 기기/해외 로그인 시 인증 절차 적용',
                  imgUrl: 'assets/starbucks-image/04_03_cardnews.png',
                  onPressed: () {},
                ),
                Container(
                  width: 15,
                ),
                NewsCardView(
                  title: '기장임랑원 크리스마스 이벤트',
                  subTitle: '기장임랑원 글라스하우스에서 베어리스타와 특별한 크리스마스 추억을 남겨보세요.',
                  imgUrl: 'assets/starbucks-image/04_04_cardnews.png',
                  onPressed: () {},
                ),
                Container(
                  width: 15,
                ),
                NewsCardView(
                  title: '굿바이 2023 사이즈업 이벤트',
                  subTitle:
                      '골드 회원 고객님, 사이즈업 쿠폰으로 스타벅스와 함께 연말의 즐거움을 더 크게 느껴보세요.',
                  imgUrl: 'assets/starbucks-image/04_05_cardnews.png',
                  onPressed: () {},
                ),
                Container(
                  width: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget recommandWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: '이정민',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.brown[400],
              ),
            ),
            const TextSpan(
                text: '님을 위한 추천메뉴',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ])),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            BeverageView(
              imgUrl: 'assets/beverage/dolche_cold_brew.jpg',
              name: '돌체 콜드 브루',
            ),
            BeverageView(
              imgUrl: 'assets/beverage/ice_starbucks_dolche_latte.jpg',
              name: '아이스 스타벅스 돌체 라떼',
            ),
            BeverageView(
              imgUrl: 'assets/beverage/ice_caffe_latte.jpg',
              name: '아이스 카페 라떼',
            ),
            BeverageView(
              imgUrl: 'assets/beverage/caramel_machiato.jpg',
              name: '카라멜 마키아토',
            ),
            BeverageView(
              imgUrl: 'assets/beverage/ice_caffe_americano.jpg',
              name: '아이스 카페 아메리카노',
            ),
          ]),
        )
      ],
    );
  }
}
