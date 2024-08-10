class OnboardingModel {
  String? image;
  String? title;
  String? description;
  String? next;

  OnboardingModel({
    this.image,
    this.title,
    this.description,
    this.next,
  });
}

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
      image: "onboarding1.png",
      title: "Browse Al Categor",
      description: " gfkjgfkkjfgkjfgjfgkjfg",
      next: "Next Chart (1).png"),
  OnboardingModel(
      image: "onboarding2.png",
      title: "Browse Al Categor",
      description: " gfkjgfkkjfgkjfgjfgkjfg",
      next: "Next Chart (2).png"),
  OnboardingModel(
      image: "onboarding3.png",
      title: "Browse Al Categor",
      description: " gfkjgfkkjfgkjfgjfgkjfg",
      next: "Next Chart (3).png"),
];
