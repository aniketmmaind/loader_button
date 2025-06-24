# loader_button   ![Pub Version](https://img.shields.io/pub/v/loader_button)

A versatile Flutter button widget with built-in shimmer animation, icons, text and animated outline styles — **7 different types of buttons** to cover all your button use cases!


<p align="center">
  <img src="https://github.com/aniketmmaind/loader_button/blob/main/example/screen_shots/fullscreen.gif" alt="Demo" width="250" height="500">
</p>

---

## ✨ Features

### All-in-One Powerful Button Widget

- **Custom child button**  
  Use any widget inside your button — fully flexible.

- **Loading state**  
  Shows a custom loading widget when performing async operations.

- **Icon-only button**  
  Easily show an icon with built-in loading support.

- **Text-only button**  
  Quick setup for simple labeled buttons with loading.

- **Icon + Text button**  
  Combine icon and text — position icon before, after, above or below the text!

- **Shimmer effect**  
  Add a shimmer animation to indicate loading widget — supports gradient too!

- **Animated outline**  
  Give your button an attractive animated border.

---

## 🚀 Getting Started

Getting up and running is simple!

### 1️⃣ Add dependency

In your `pubspec.yaml`:

```yaml
dependencies:
  loader_button: ^<latest_version>
```  

### 2️⃣ Install the package

Run this in your terminal:

```treminal
flutter pub add loader_button
flutter pub get
```  

### 3️⃣ Import it in your Dart file

```dart
import 'package:loader_button/loader_button.dart';
```  

## 📌 Usage

Below are practical examples for each `LoaderButton` variant — with code snippets and outputs.

---

### 1. Default Loader Button

**Code:**

```dart
LoaderButton(
  isLoading: isLoading,
  child: Text('Submit'),
  loadingWidget: CircularProgressIndicator(),
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
)
```
**Output:**

<p align="center">
  <img src="https://github.com/aniketmmaind/loader_button/blob/main/example/screen_shots/default.gif" alt="Demo" width="250" height="150">
</p>

---

### 2. Icons Loader Button

**Code:**

```dart
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
),
```
**Output:**

<p align="center">
  <img src="https://github.com/aniketmmaind/loader_button/blob/main/example/screen_shots/icon.gif" alt="Demo" width="250" height="150">
</p>


---

### 3. Text Loader Button

**Code:**

```dart
LoaderButton.text(
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
        Future.delayed(Duration(seconds: 5), (){
            setState(() {
                isLoadingText = false;
            });
        });
    },
),
```
**Output:**

<p align="center">
  <img src="https://github.com/aniketmmaind/loader_button/blob/main/example/screen_shots/text.gif" alt="Demo" width="250" height="150">
</p>

---

### 4. Icon-Text Loader Button

**Code:**

```dart
LoaderButton.iconText(
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
```
**Output:**

<p align="center">
  <img src="https://github.com/aniketmmaind/loader_button/blob/main/example/screen_shots/icon_text.gif" alt="Demo" width="250" height="150">
</p>

---

### 5. Shimmer Loader Button (highligth and base color)

**Code:**

```dart
 final shimmerTextKey = ValueKey(
    'shimmer-text',
  ); //Use this key on the widget where you want to apply the shimmer effect, but only for the loadingWidget of LoaderButton.shimmer.

LoaderButton.shimmer(
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
    highlightColor: Colors.white,
    period: const Duration(seconds: 2),
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
),
```
**Output:**

<p align="center">
  <img src="https://github.com/aniketmmaind/loader_button/blob/main/example/screen_shots/shimmer.gif" alt="Demo" width="250" height="150">
</p>

---

### 6. Shimmer Loader Button (Using Gradient)

**Code:**

```dart
 final shimmerTextKey = ValueKey(
    'shimmer-text',
  ); //Use this key on the widget where you want to apply the shimmer effect, but only for the loaderWidget of LoaderButtonShimmer.

LoaderButton.shimmer(
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
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
    ),
    /// Instead of baseColor & highlightColor, we use a gradient.
    gradient: LinearGradient(
        colors: [
        Colors.purple.shade200,
        Colors.blue.shade100,
        Colors.purple.shade200,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
    ),
    isGradient:
        true, //To use gradient in shimmer use isGradient = true.
    period: Duration(seconds: 2),
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
),
```
**Output:**

<p align="center">
  <img src="https://github.com/aniketmmaind/loader_button/blob/main/example/screen_shots/shimmer_grd.gif" alt="Demo" width="250" height="150">
</p>

---

### 7. Animated Outline Loader Button

**Code:**

```dart
LoaderButton.animatedOutline(
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
),
```
**Output:**

<p align="center">
  <img src="https://github.com/aniketmmaind/loader_button/blob/main/example/screen_shots/outline.gif" alt="Demo" width="250" height="150">
</p>

## 🤝 Contributing

We love contributions and feedback!
Whether it's fixing bugs, adding new features, improving documentation, or sharing ideas — **all contributions are welcome.**
