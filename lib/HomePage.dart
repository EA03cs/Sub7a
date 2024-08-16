import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num = 0;
  var counter = 0;
  int colorHex = 0xffB1001C;
  int time = 0;

  int all = 0;

  TextDirection textDirection = TextDirection.rtl;
  bool isActive = false;

  resettozero() {
    setCount(counter = 0);
    setTime(time = 0);
    setNum(num = 0);
  }

  setCount(int value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('counter', value);
    getCount();
  }

  setcolor(int value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('colorHex', value);
    getCount();
  }

  setTime(int value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('time', value);
    getTime();
  }

  setNum(int value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('num', value);
    getNum();
  }

  getCount() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      counter = preferences.getInt('counter')!;
      colorHex = preferences.getInt('colorHex')!;
    });
  }

  getTime() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      time = preferences.getInt('time')!;
    });
  }

  getNum() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      num = preferences.getInt('num')!;
    });
  }

  @override
  void initState() {
    getCount();
    getNum();
    getTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color? mainColor = Color(colorHex);
    return Directionality(
      textDirection: textDirection,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            resettozero();
          },
          child: Icon(Icons.refresh),
          backgroundColor: mainColor,
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: mainColor,
          actions: [
             GestureDetector(
                 onTap: (){
                   setState(() {
                     isActive = !isActive;
                     });
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Icon(isActive?Icons.color_lens_outlined:Icons.color_lens),
                 )),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: mainColor,
              ),
              child: Column(
                children: [
                  const Text(
                    'الهدف',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            num--;
                          });
                        },
                        heroTag: 'age-',
                        mini: true,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$num',
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            num++;
                          });
                        },
                        heroTag: 'age+',
                        mini: true,
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setNum(num = 3);
                        },
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              '3',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          setNum(num = 33);
                        },
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              '33',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          setNum(num = 100);
                        },
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              '100',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          setNum(num = 500);
                        },
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              '500',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          setNum(num = 1000);
                        },
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              '1000',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'الأستغفار',
                  style: TextStyle(fontSize: 30, color: mainColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$counter',
                  style: TextStyle(fontSize: 30, color: mainColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                CircularPercentIndicator(
                  radius: 70.0,
                  lineWidth: 5.0,
                  percent: counter / num,
                  center: InkWell(
                    onTap: () {
                      setState(() {
                        if (counter >= num) {
                          setTime(time + 1);
                          setCount(counter = 1);
                        } else {
                          setCount(counter + 1);
                        }
                      });
                    },
                    child: Icon(
                      Icons.touch_app,
                      size: 60,
                      color: mainColor,
                    ),
                  ),
                  progressColor: mainColor,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'مرات التكرار : $time',
                  style: TextStyle(fontSize: 30, color: mainColor),
                ),
                Text(
                  'المجموع : ${time * num + counter}',
                  style: TextStyle(fontSize: 30, color: mainColor),
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: isActive,
                child: Row(
                  children: [
                    Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color(0xffB1001C)),
                        value: 0xffB1001C,
                        groupValue: colorHex,
                        onChanged: (val) {
                          setState(() {
                            setcolor(val!);
                          });
                        }),
                    Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color(0xff14212A)),
                        value: 0xff14212A,
                        groupValue: colorHex,
                        onChanged: (val) {
                          setState(() {
                            setcolor(val!);
                          });
                        }),
                    Radio(
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Color(0xff62249F)),
                        value: 0xff62249F,
                        groupValue: colorHex,
                        onChanged: (val) {
                          setState(() {
                            setcolor(val!);
                          });
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
