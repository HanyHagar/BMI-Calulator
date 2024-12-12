import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(InitialState());
  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  bool isMale = true;
  Color containerBackground = const Color.fromARGB(249, 36, 36, 47);
  Color textColor = Colors.white;
  void male()
  {
    isMale = true;
    emit(ChangeGenderState());
  }
  void female()
  {
    isMale = false;
    emit(ChangeGenderState());
  }
  double height = 150;
  void changeHeight(value)
  {
    height = value;
    emit(ChangeHeightState());
  }
  double weight = 80;
  void plusWeight()
  {
    weight++;
    emit(ChangeWeightState());
  }
  void minusWeight()
  {
    weight--;
    emit(ChangeWeightState());
  }
  double age = 21;
  void plusAge()
  {
    age++;
    emit(ChangeAgeState());
  }
  void minusAge()
  {
    age--;
    emit(ChangeAgeState());
  }
  late double result ;
  late int resultType ;
  late double overWeight;
  late double resultPadding;
  late double lowHealthyWeight;
  late double highHealthyWeight;
  late double idealWeight;
  void setResult()
  {
    result = weight / pow(height/100, 2);
    resultType = setResultValue(result);
    overWeight = setOverWeight(result);
    resultPadding = setPadding(result);
    lowHealthyWeight = setLowHealthyWeight();
    highHealthyWeight = setHighHealthyWeight();
    idealWeight = setIdealWeight();
    emit(ChangeShowBottomSheetState());
  }
  int setResultValue (value){
    if (value<18.5) {
      return 0 ;
    }
    else if (value>= 18.5  && value< 25) {
      return 1 ;
    }
    else if (value>= 25  && value< 30) {
      return 2 ;
    }
    else if (value>= 30  && value< 40) {
      return 3 ;
    }
    else{
      return 4 ;
    }
  }
  double setOverWeight(value){
    return value>25 ?((value-25.0)*4): 0;
  }
  double setPadding(value){
    return value*5 < 292.5 ? value*5 : 292.5 ;
  }
  double setIdealWeight()
  {
     return isMale ?  50+1.9*(height%152.4) :  49+1.7*(height%152.4);
  }

  double setLowHealthyWeight()
  {
    return 18.5*pow(weight /100, 2);
  }
  double setHighHealthyWeight()
  {
    return 25.0*pow(weight /100, 2);
  }
}