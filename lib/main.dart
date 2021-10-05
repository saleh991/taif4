import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/secondary_screens/english_section_screens/english_section_screen.dart';

import 'package:taif/screens/auth_screen/edit_profile/cubit/cubit.dart';
import 'package:taif/screens/auth_screen/login_screen/login_screen.dart';
import 'package:taif/screens/auth_screen/out_boarding_screen.dart';
import 'package:taif/screens/auth_screen/register_screen/register_screen.dart';
import 'package:taif/screens/primary_screens/main_screen/bottom_nav_controller.dart';
import 'screens/primary_screens/estates_section/add_ad_screen1.dart';
import 'screens/primary_screens/estates_section/add_ad_screen2.dart';
import 'screens/primary_screens/estates_section/add_ad_screen3.dart';
import 'package:taif/screens/primary_screens/estates_section/estate_screen.dart';
import 'package:taif/screens/primary_screens/membership_screen/membership_screen.dart';
import 'package:taif/screens/primary_screens/search/search_screen.dart';

import 'package:taif/screens/secondary_screens/address_section_screens/tourism_guiding_section/tourism_guiding_screen.dart';

import 'package:taif/screens/secondary_screens/address_section_screens/add_address_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/addedd_succefully_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/address_conditon_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/address_detailes_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/events_sections/events_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/offers_sections/offers_screen.dart';
import 'package:taif/screens/primary_screens/estates_section/ads_conditions_screen.dart';
import 'package:taif/screens/secondary_screens/chat_screen/chats_screen.dart';
import 'package:taif/screens/secondary_screens/contact_screen/contact_screen.dart';
import 'package:taif/screens/auth_screen/edit_profile/edit_profile_screen.dart';
import 'package:taif/screens/auth_screen/launch_screen.dart';
import 'package:taif/screens/auth_screen/localizations_screen.dart';
import 'package:taif/screens/primary_screens/notifications_screen.dart';
import 'package:taif/screens/auth_screen/pin_screen.dart';
import 'package:taif/screens/primary_screens/profile_screen.dart';
import 'package:taif/screens/secondary_screens/contracts_section_screens/contracts_screen.dart';
import 'package:taif/screens/secondary_screens/contracts_section_screens/request_rental_right_screen.dart';
import 'package:taif/screens/secondary_screens/documentation_screen/documentation_screen.dart';
import 'package:taif/screens/secondary_screens/favorite_screen.dart';
import 'package:taif/screens/secondary_screens/know_taif/know_taif.dart';
import 'package:taif/screens/secondary_screens/my_ads_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/tourism_guiding_section/add_guide_screen.dart';
import 'package:taif/screens/secondary_screens/chat_screen/private_chat_screen.dart';
import 'package:taif/screens/secondary_screens/public_services_screens/services_provider_details_screen.dart';
import 'package:taif/screens/secondary_screens/public_services_screens/services_providers_screen.dart';
import 'package:taif/screens/test.dart';
import 'package:taif/screens/auth_screen/welcome_screen.dart';
import 'package:taif/screens/secondary_screens/add_subject_to_toursim/add_subject_conditon_screen.dart';

import 'cubit/bloc_observer.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'languages', // <-- change the path of the translation files
      fallbackLocale: Locale('ar'),
      child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainCubit()
              ..getSlider()
              ..getLease(),
          ),
          BlocProvider(
            create: (context) => ProfileCubit()..getUserData(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color.fromRGBO(249, 251, 255, 1),
          ),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          initialRoute: launchScreenRoute,
          routes: {
            launchScreenRoute: (context) => LaunchScreen(),


            chooseLanguageRoute: (context) => ChooseLanguageScreen(),
            outBoardingRoute: (context) => OutBoardingScreen(),
            welcomeRoute: (context) => WelcomeScreen(),
            loginRoute: (context) => LoginScreen(),
            registerRoute: (context) => RegisterScreen(),
            // activationRoute: (context) => ActivationScreen(),
            // pinRoute: (context) => PinScreen(),
            editProfileRoute: (context) => EditProfileScreen(),
            // editFirstProfileRoute: (context) => EditFirstProfileScreen(),
            bottomNavRoute: (context) => BottomNavigationController(),
            englishSectionRoute: (context) => EnglishSectionScreen(),
             addSubjectCondtionsRoute: (context) => AddSubjectCondtionsScreen(),
            contactRoute: (context) => ContactScreen(),
            notificationsRoute: (context) => NotificationsScreen(),
            profileRoute: (context) => ProfileScreen(),
            chatsRoute: (context) => ChatScreen(),
            estateRoute: (context) => EstateScreen(),
            searchRoute: (context) => SearchScreen(),
            myAdsRoute: (context) => MyAdsScreen(),
            eventRoute: (context) => EventsScreen(),
            offerRoute: (context) => OffersScreen(),
            favoriteRoute: (context) => FavoriteScreen(),

            // estateDetailsRoute: (context) => EstateDetailsScreen(),


            // memberDetailsRoute: (context) => MemberDetailsScreen(),
            // privateChatRoute: (context) => PrivateChatScreen(),


            // addressRoute: (context) => AddressScreen(),
            addAddressRoute: (context) => AddAddressScreen(),
            addressConditionRoute: (context) => AddressCondtionsScreen(),
            addedSuccefullyRoute: (context) => AddedSuccefullyScreen(),
            // addressDetailsRoute: (context) => AddressDetailsScreen(),
            addGuideRoute: (context) => AddGuideScreen(),

            servicesProvidersRoute: (context) => ServicesProviderScreen(),
            servicesProviderDetailsRoute: (context) =>
                ServicesProviderDetailsScreen(),
            // requestRentalRightRoute:(context)=>RequestRentalRightScreen(),
            contractsRoute: (context) => ContractsScreen(),
            documentationRoute: (context) => DocumentationScreen(),

            tourismGuidingRoute: (context) => TourismGuidingScreen(),
            '/test': (context) => Test()
          },
        ),
      ),
    );
  }
}
