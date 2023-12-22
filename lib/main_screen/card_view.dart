import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  void Function() onPressed;

  CardView({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.primaries[17][50],
      ),
      padding: EdgeInsets.all(8.0),
      width: 270,
      height: 150,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.favorite_border,
              size: 20,
            ),
          ),
          Row(
            children: [
              Image.asset(
                'assets/food/melting_cheese.png',
                width: 60,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('멜팅 치즈 베이컨 샌드위치'),
                  Text(
                    '따뜻하게 데움',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.brown[100],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Row(
              children: [
                Icon(Icons.location_on_outlined,
                  size: 20,
                  color: Colors.brown[200],),
                Text(
                  'Home Front DT',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    textBaseline: TextBaseline.ideographic,
                    fontSize: 12,
                    color: Colors.brown[200],
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 80,
                  height: 30,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        )),
                    onPressed: () {},
                    child: Text(
                      '바로 주문하기',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
