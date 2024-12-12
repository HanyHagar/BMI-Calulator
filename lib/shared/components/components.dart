

import 'package:flutter/material.dart';

Widget defaultGenderContainer ({
  required bool isMale,
  required Color color,
  required String icon,
  required String text,
   Color textColor = Colors.white,
}) => Container(
  decoration: BoxDecoration(
    color: color ,
    borderRadius: BorderRadius.circular(5),
  ),
  child:Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
       Image(
        image:AssetImage(icon),
        width: 80,
        height: 90,
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        text,
        style:  TextStyle(
            fontSize: 25,
            color: textColor,
            fontWeight: FontWeight.normal
        ),
      )
    ],
  ),
);

Widget defaultDetailsContainer({
  required String title,
  Color textColor = Colors.white,
  required Color color,
  required double weight,
  required Function()? plusFunction,
  required Function()? minusFunction,

})=>Container(
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(5),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 15,
            color: textColor,
            fontWeight: FontWeight.normal
        ),
      ),
      Text(
        '$weight',
        style:  TextStyle(
            color: textColor,
            fontSize: 30,
            fontWeight: FontWeight.bold
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          FloatingActionButton(
            onPressed:plusFunction,
            mini: true,
            backgroundColor: Colors.blueGrey,
            child:const Icon(
              Icons.add
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed:minusFunction,
            mini: true,
            backgroundColor: Colors.blueGrey,
            child:const Icon(
              Icons.remove
            ),
          ),
        ],
      ),
    ],
  ),
);

Widget defaultResultContainer({
  required Color paddingColor,
  required Color backGroundColor,
  required double result,
  required double resultPadding,
   Color textColor = Colors.white,
  required int setResultValue,
  required double overWeight,
  required double idealWeight,
  required double lessHealthWeight,
  required double highHealthyWeight,
})=>Container(
  height: 380,
  width: double.infinity,
  decoration: BoxDecoration(
      color: backGroundColor,
      borderRadius: BorderRadius.circular(15),
      border: BorderDirectional(
        top: BorderSide(
          width: 2,
          color: paddingColor,
        ),
      )
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 0,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            result.toStringAsFixed(1).toString(),
            style:  TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 92.5,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart:Radius.circular(15) ,
                            bottomStart: Radius.circular(15),
                          ),
                        ),
                      ),
                      Container(
                        width: 32.5,
                        height: 30,
                        color: Colors.green,
                      ),
                      Container(
                          width: 25,
                          height: 30,
                          color: Colors.orange[700]
                      ),
                      Container(
                        width: 50,
                        height: 30,
                        color: Colors.deepOrange[600],
                      ),
                      Container(
                        width: 92.5,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.red[600],
                          borderRadius: const BorderRadiusDirectional.only(
                            topEnd:Radius.circular(15) ,
                            bottomEnd: Radius.circular(15),
                          ),
                        ),

                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsetsDirectional.only(
                      start:  resultPadding,
                    ),
                    child: Container(
                      width: 3,
                      height: 30,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 25,
          decoration: BoxDecoration(
            color: setResultValue == 0 ?Colors.blueGrey[400] : null,
          ),
          padding: EdgeInsets.symmetric(horizontal: setResultValue == 0 ? 5 :0,),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 20,),
              Text(
                'Under Weight',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(child: SizedBox(width: 20,)),
              Text(
                '< 18.5 ',
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: setResultValue == 1 ?Colors.blueGrey[400] : null,
          ),
          padding: EdgeInsets.symmetric(horizontal: setResultValue == 1 ? 5 :0,),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 20,),
              Text(
                'Normal Weight',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(child: SizedBox(width: 20,)),
              Text(
                '18.5 - 25 ',
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: setResultValue == 2 ?Colors.blueGrey[400] : null,
          ),
          padding: EdgeInsets.symmetric(horizontal: setResultValue == 2 ? 5 :0,),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orange[700],
                ),
              ),
              const SizedBox(width: 20,),
              Text(
                'Overweight',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(child: SizedBox(width: 20,)),
              Text(
                '25 - 30 ',
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: setResultValue == 3 ?Colors.blueGrey[400] : null,
          ),
          padding: EdgeInsets.symmetric(horizontal: setResultValue == 3 ? 5 :0,),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.deepOrange[600],
                ),
              ),
              const SizedBox(width: 20,),
              Text(
                'Obesee ',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Expanded(child: SizedBox(width: 20,)),
              Text(
                '30 - 40 ',
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 25,
          decoration: BoxDecoration(
            //borderRadius: setResultValue(result) == 4 ? BorderRadius.circular(10),
            color:setResultValue == 4 ?Colors.blueGrey[400] : null,
          ),
          padding: EdgeInsets.symmetric(horizontal: setResultValue == 4 ? 5 :0,),
          child: Padding(
            padding: const EdgeInsets.symmetric(
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red[600],
                  ),
                ),
                const SizedBox(width: 20,),
                Text(
                  'Morbidly Obese',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox(width: 20,)),
                Text(
                  '> 40 ',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 10
          ),
          child: Container(
            width: double.infinity,
            height: 1,
            color: textColor,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.monitor_weight,
              color: textColor,
            ),
            const SizedBox(width: 20,),
            Text(
              'Ideal Weight',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(child: SizedBox(width: 20,)),
            Text(
              //result>25 ?((result-25.0)*4)
              "${idealWeight.toInt().toString()} kg",
              style:  TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.monitor_weight,
              color: textColor,
            ),
            const SizedBox(width: 20,),
            Text(
              'Healthy Weight',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(child: SizedBox(width: 20,)),
            Text(
              "${highHealthyWeight.toStringAsFixed(1)} kg - ${lessHealthWeight.toStringAsFixed(1)} kg",
              style:  TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.monitor_weight,
              color: textColor,
            ),
            const SizedBox(width: 20,),
            Text(
              'Overweight',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(child: SizedBox(width: 20,)),
            Text(
              overWeight.toStringAsFixed(1),
              style:  TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);