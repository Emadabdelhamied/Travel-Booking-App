class Onboard {
  final String image;
  final String title;
  final String description;

  const Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> onboardingData = [
  const Onboard(
    image: "assets/icons/plane_one.png",
    title: "Check in baggae before flight",
    description:
        "loruaemk jdrders xefst rkokojpo jojloru aemkjd rdersxe fstrkokoj pojojloru aemkjdrdersxe fstrk okojpojojl oruaemkjdrdersxefstrkokojpojoj",
  ),
  const Onboard(
    image: "assets/icons/plane_two.png",
    title: "Confirm documents on the app",
    description:
        "loruaemk jdrders xefst rkokojpo jojloru aemkjd rdersxe fstrkokoj pojojloru aemkjdrdersxe fstrk okojpojojl oruaemkjdrdersxefstrkokojpojoj",
  ),
  const Onboard(
    image: "assets/icons/plane_three.png",
    title: "Internet connection during flight",
    description:
        "loruaemk jdrders xefst rkokojpo jojloru aemkjd rdersxe fstrkokoj pojojloru aemkjdrdersxe fstrk okojpojojl oruaemkjdrdersxefstrkokojpojoj",
  )
];
