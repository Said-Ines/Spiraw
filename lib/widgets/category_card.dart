import '../bases/screens/exports.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.image, required this.title}) : super(key: key);
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.cardRadius)),
        child: SizedBox(
          width: 160,
          height: 144,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Center(
                child: Text(title, style: AppStyles.urbanistboldHeadline3.withSize(FontSizes.headline4).withColor(Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
