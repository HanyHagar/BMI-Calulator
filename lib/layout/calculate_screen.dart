import 'package:bmi_calculater/shared/components/components.dart';
import 'package:bmi_calculater/shared/cubit/cubit.dart';
import 'package:bmi_calculater/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
var scaffoldKey = GlobalKey<ScaffoldState>();
class CalculateScreen extends StatelessWidget {
  const CalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>AppCubit(),
        child: BlocConsumer<AppCubit,AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AppCubit.get(context);
              return Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.black,
                appBar: AppBar(
                  title: const Text(
                    'BMI CALCULATOR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight:FontWeight.w600,

                    ),
                    textAlign: TextAlign.center,
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.black,
                ),
                body:Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  cubit.male();
                                },
                                child: defaultGenderContainer(
                                    isMale: cubit.isMale,
                                    color: cubit.isMale ?  Colors.blue : cubit.containerBackground,
                                    icon: 'assets/male.png',
                                    text: 'Male',
                                  textColor: cubit.textColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  cubit.female();
                                },
                                child: defaultGenderContainer(
                                    isMale: cubit.isMale,
                                    color: cubit.isMale ? cubit.containerBackground :Colors.pinkAccent,
                                    icon: 'assets/female.png',
                                    text: 'Female',
                                  textColor: cubit.textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: cubit.containerBackground,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'HEIGHT',
                                    style: TextStyle(
                                        color: cubit.textColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline:TextBaseline.alphabetic ,
                                      children: [
                                        Text(
                                          '${cubit.height.round()}',
                                          style:  TextStyle(
                                              color: cubit.textColor,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'CM',
                                          style: TextStyle(
                                              color: cubit.textColor,
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                    child: Slider(
                                      value: cubit.height,
                                      activeColor: cubit.isMale ? Colors.blue : Colors.pinkAccent ,
                                      min: 0.0,
                                      max: 250.0,
                                      onChanged:(double value){
                                          cubit.changeHeight(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: defaultDetailsContainer(
                                title: 'Weight',
                                color: cubit.containerBackground,
                                weight: cubit.weight,
                                plusFunction: cubit.plusWeight,
                                minusFunction: cubit.minusWeight,
                              ),
                            ),
                            const SizedBox(width:20 ,),
                            Expanded(
                              child: defaultDetailsContainer(
                                title: 'Age',
                                color: cubit.containerBackground,
                                weight: cubit.age,
                                plusFunction: cubit.plusAge,
                                minusFunction: cubit.minusAge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: cubit.isMale ? Colors.blue : Colors.pink,
                      child: TextButton(
                        onPressed: () {
                          cubit.setResult();
                          scaffoldKey.currentState!.showBottomSheet((context){
                            return GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: defaultResultContainer(
                                  paddingColor: cubit.isMale ? Colors.blue : Colors.pinkAccent,
                                  backGroundColor: Colors.black,
                                  result: cubit.result,
                                  resultPadding: cubit.resultPadding,
                                  setResultValue: cubit.resultType,
                                idealWeight: cubit.idealWeight,
                                highHealthyWeight: cubit.highHealthyWeight,
                                lessHealthWeight: cubit.lowHealthyWeight,
                                overWeight: cubit.overWeight,
                              ),
                            );
                          }).closed.then((value){});
                        },
                        child: const Text(
                          'CALCULATE',
                          style: TextStyle(
                            fontWeight:FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
        )

    );
  }
}

