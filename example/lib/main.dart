import 'package:flutter/material.dart';
import 'package:loader_button/loader_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loader Button Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  bool isLoadingIcon = false;
  bool isLoadingText = false;
  bool isLoadingIconText = false;
  bool isLoadingShimmer = false;
  bool isLoadingShimmerGrnt = false;
  bool isLoadingOutLineShimmer = false;

  final shimmerTextKey = ValueKey(
    'shimmer-text',
  ); //Use this key on the widget where you want to apply the shimmer effect, but only for the loaderWidget of LoaderButtonShimmer.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Loader Button Examples",
          style: TextStyle(
            color: Colors.white60,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Default Loader Button
              Center(
                child: LoaderButton(
                  isLoading: isLoading,
                  onClick: () {
                    setState(() {
                      isLoading = true;
                    });
                    Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  onDoubleTap: () => showSnckBar("For Loading just tap"),
                  onLongPress: () => showSnckBar("For Loading just tap"),
                ),
              ),
              SizedBox(height: 20),

              // Loader Icon button
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoaderButton.icon(
                      maxSize: Size(200, 70),
                      icon: Icon(Icons.favorite_border, color: Colors.red),
                      border: StadiumBorder(),
                      isLoading: isLoadingIcon,
                      loadingWidget: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.red,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      splashColor: Colors.red.shade300,
                      mouseCursor: SystemMouseCursors.click,
                      onDoubleTap: () {
                        setState(() {
                          isLoadingIcon = true;
                        });
                        Future.delayed(Duration(seconds: 5), () {
                          setState(() {
                            isLoadingIcon = false;
                          });
                        });
                      },
                      onClick: () => showSnckBar("For Like double tap"),
                      onLongPress: () => showSnckBar("For Like double tap"),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "For Like double tap",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              //Loader Text Button
              //Hold Button for Sometime (Long Press)
              Center(
                child: LoaderButton.text(
                  text: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Click Here",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  isLoading: isLoadingText,
                  backgroundColor: Colors.black12,
                  splashColor: Colors.black38,
                  loadingWidget: CircularProgressIndicator(color: Colors.white),
                  onLongPress: () {
                    setState(() {
                      isLoadingText = true;
                    });
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        isLoadingText = false;
                      });
                    });
                  },
                  onClick:
                      () =>
                          showSnckBar("Hold Button for Sometime (Long Press)"),
                  onDoubleTap:
                      () =>
                          showSnckBar("Hold Button for Sometime (Long Press)"),
                ),
              ),
              SizedBox(height: 20),

              //Loader Icon Text Button
              //Hold Button for Sometime (Long Press)
              Center(
                child: LoaderButton.iconText(
                  label: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "Saved",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  icon: Icon(Icons.save, color: Colors.white, size: 30),
                  backgroundColor: Colors.amber,
                  splashColor: Colors.red,
                  isLoading: isLoadingIconText,
                  iconPosition: IconTextPosition.iconStart,
                  loadingWidget: CircularProgressIndicator(color: Colors.white),
                  onDoubleTap:
                      () =>
                          showSnckBar("Hold Button for Sometime (Long Press)"),
                  onClick:
                      () =>
                          showSnckBar("Hold Button for Sometime (Long Press)"),
                  onLongPress: () {
                    setState(() {
                      isLoadingIconText = true;
                    });
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        isLoadingIconText = false;
                      });
                    });
                  },
                ),
              ),
              SizedBox(height: 20),

              //Loader Shimmer Button using highligth and base color
              Center(
                child: LoaderButton.shimmer(
                  isLoading: isLoadingShimmer,
                  shimmerChildKey: shimmerTextKey, //Assign shimmerChildkey
                  loadingWidget: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Loading',
                        key:
                            shimmerTextKey, //use this key to show shimmer effect only for key containing widget
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  baseColor: Colors.white54,
                  highlightColor: Colors.grey,
                  duration: const Duration(seconds: 2),
                  direction: ButtonShimmerDirection.ltr,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  onClick: () {
                    setState(() {
                      isLoadingShimmer = true;
                    });
                    Future.delayed(Duration(seconds: 5), () {
                      setState(() {
                        isLoadingShimmer = false;
                      });
                    });
                  },
                  onDoubleTap:
                      () => showSnckBar("For loading single tap/click"),
                  onLongPress:
                      () => showSnckBar("For loading single tap/click"),
                ),
              ),
              SizedBox(height: 20),

              //Loader Shimmer Button using gradient
              Center(
                child: LoaderButton.shimmer(
                  isLoading: isLoadingShimmerGrnt,
                  shimmerChildKey: shimmerTextKey, //Assign shimmerChildkey
                  loadingWidget: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      key:
                          shimmerTextKey, //use this key to show shimmer effect only for key containing widget.
                      "Loading Gradient..",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  /// Instead of baseColor & highlightColor, we use a gradient.
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.shade200,
                      Colors.blue.shade100,
                      Colors.red,
                      Colors.purple.shade200,
                      Colors.blue.shade100,
                      Colors.red,
                      Colors.purple.shade200,
                      Colors.blue.shade100,
                      Colors.red,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  isGradient:
                      true, //To use gradient in shimmer use isGradient = true.
                  duration: Duration(seconds: 2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black38,
                    ),
                    child: const Text(
                      'Show Gradient',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  onClick: () {
                    setState(() {
                      isLoadingShimmerGrnt = true;
                    });
                    Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        isLoadingShimmerGrnt = false;
                      });
                    });
                  },
                  onLongPress:
                      () =>
                          showSnckBar("Forgggg loading just single tap/click"),
                  onDoubleTap:
                      () => showSnckBar("For loading just single tap/click"),
                ),
              ),
              SizedBox(height: 20),

              //Loader Animated OutLine Button
              Center(
                child: LoaderButton.animatedOutline(
                  isLoading: isLoadingOutLineShimmer,
                  animatedOutlineStyle: AnimatedOutlineStyles(
                    borderColor: Colors.teal,
                    borderWidth: 10.0,
                    backgroundColor: Colors.white,
                    animationColors: [
                      Colors.red,
                      Colors.orange,
                      Colors.green,
                      Colors.yellow,
                    ],
                    animationDuration: Duration(seconds: 2),
                    animationDirection: AnimationDirection.ltr,
                    glowBlurRadius: 6.0,
                  ),
                  loadingWidget: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.0,
                      color: Colors.red,
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text(
                      'Outline Button',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  onClick: () {
                    setState(() {
                      isLoadingOutLineShimmer = true;
                    });
                    Future.delayed(Duration(seconds: 3), () {
                      setState(() {
                        isLoadingOutLineShimmer = false;
                      });
                    });
                  },
                  onDoubleTap:
                      () => showSnckBar("For Loading just single tap/click"),
                  onLongPress:
                      () => showSnckBar("For Loading just single tap/click"),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void showSnckBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
