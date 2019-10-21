import 'package:flutter/material.dart';
import 'package:player_one/appTheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController animationController;
  bool multiple = false;
  List<String> homeList = [
    "assets/images/famille.jpeg",
    "assets/images/soireeAmis.jpeg",
    "assets/images/restaurant.jpeg",
    "assets/images/hot.jpeg"
  ];

  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        minimum: EdgeInsets.only(bottom: 20),
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: AppTheme.nearlyWhite,
            body: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  appBar(),
                  Expanded(
                    child: GridView(
                      padding: EdgeInsets.only(top: 0, left: 12, right: 12),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                        homeList.length,
                        (index) {
                          var count = homeList.length;
                          var animation = Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn),
                            ),
                          );
                          animationController.forward();
                          return AnimatedBuilder(
                            animation: animationController,
                            builder: (BuildContext context, Widget child) {
                              return FadeTransition(
                                opacity: animation,
                                child: new Transform(
                                  transform: new Matrix4.translationValues(
                                      0.0, 50 * (1.0 - animation.value), 0.0),
                                  child: AspectRatio(
                                    aspectRatio: 1.5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0)),
                                      child: Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: <Widget>[
                                          Image.asset(
                                            homeList[index],
                                            fit: BoxFit.cover,
                                          ),
                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              splashColor:
                                                  Colors.grey.withOpacity(0.1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0)),
                                              onTap: () {
                                                print('gab');
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: multiple ? 2 : 1,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                        childAspectRatio: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "Flutter UI",
                  style: new TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: AppTheme.dark_grey,
                  ),
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
