import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:themoviedb/Moviedetailspage.dart';
import 'package:themoviedb/convenientTransition.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12.5),
        child: Column(
          children: [
            for (var i in [1, 2, 3])
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          SlideRightRoute(page: const Moviedetailspage()));
                    },
                    child: Material(
                      elevation: 4,
                      child: Container(
                        alignment: Alignment.center,
                        // decoration: BoxDecoration(
                        //     border: Border.all(width: 1, color: Colors.black)),
                        padding: EdgeInsets.only(
                            top: 10, bottom: 2.5, left: 2.5, right: 12.5),
                        height: 100,
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.orange, shape: BoxShape.circle),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'The matrix',
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '8.1/10',
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
