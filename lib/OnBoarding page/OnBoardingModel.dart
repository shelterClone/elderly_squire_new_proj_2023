class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demoData = [
  OnBoard(
    // image: "assets/images/elderly_squire_logo_classic_icon.png",
    image: "assets/images/book.png",
    title: "Getting Started",
    description: "Elderly squire is a mobile application intended mostly for Senior Citizens. "
        "With its awesome features it guarantees the reliability that you ever needed."

  ),
  OnBoard(
    image: "assets/images/ID.png",
    title: "ID Registration",
    description:
    "As a Senior Citizen, ID Registration has never been so easy. You can now apply for your Senior Citizen's ID, through your fingertips.",
  ),
  OnBoard(
    image: "assets/images/reminder.png",
    title: "Medicine Reminder",
    description:
    "With medicine reminder, there will be no more timed dosages to be missed.",
  ),
  OnBoard(
    image: "assets/images/todolist.png",
    title: "To Do List",
    description:
    "You can now make your own list of To Dos, to reminder yourself and set your priorities.",
  ),

  OnBoard(
    image: "assets/images/healthy.png",
    title: "Health Tips",
    description:
    "Read and learn about some health tips that will give you a scope to a healthy lifestyle.",
  ),

  OnBoard(
    image: "assets/images/scardbene.png",
    title: "Benefits",
    description:
    "As a Senior Citizen, this is where you will know what are the benefits and privileges that you will get.",
  ),

  OnBoard(
    image: "assets/images/chat2.png",
    title: "Chat Support",
    description:
    "With our Chat Support feature, it's time for you to voice out your concerns and we will get into you to guide you.",
  ),


];