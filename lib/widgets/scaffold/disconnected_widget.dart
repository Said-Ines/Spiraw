part of 'smart_scaffold.dart';

class _DisconnectedWidget extends StatelessWidget {
  const _DisconnectedWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withOpacity(.7),
      body: Wrap(
        children: [
          Card(
            color: AppColors.greyLight,
            elevation: 40,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: <Widget>[
                Image.asset(
                  AppImages.appLogo,
                  height: 150,
                ).customPadding(top: 30, bottom: 40),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'You are not connected\nto Internet'.toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.secondary,
                          letterSpacing: 2,
                          height: 1.5,
                          shadows: [
                            const BoxShadow(
                                color: AppColors.secondary, blurRadius: 5)
                          ]),
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSpacing(30),
                    Text(
                      'This app requires an internet connection to function. Please reconnect to continue using our services.',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.primary,
                            fontSize: 13,
                            height: 1.5,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSpacing(50),
                  ],
                ).symmetricPadding(
                    horizontal: AppConstants.bodyMaxSymetricHorizontalPadding),
              ],
            ),
          ),
        ],
      ).center(),
    );
  }
}
