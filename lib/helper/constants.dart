import 'package:flutter/cupertino.dart';
import 'package:taif/controller/app_controller.dart';

// Colors
Color defaultColor = Color.fromRGBO(0, 124, 157, 1);

//Fonts
String fontName = "JF Flat";

//API
int userId = AppController.instance.getId();
//https://opencart3.const-tech.biz/tf/api
const String URL = 'https://taif-app.com/api/';
const String LOGIN = 'login';
const String COMMENT = 'comments';
const String REGISTER = 'register';
const String PACKAGES = 'packages';
const String REQUEST_PACKAGES = 'subscriptions';
const String BANK_TRANSACTIONS = 'bank_transactions';
const String SLIDER = 'sliders';
const String ESTATE = 'estates';
const String SERVICES = 'home_services';
const String SERVICES_CATEGORY = 'home_service_categories';
const String LEASE = 'lease_contracts';
const String REQUEST_LEASE = 'lease_contract_orders';
const String REQUEST_DOCUMENTATION = 'documentation_orders';
const String EVENT_SECTIONS = 'events_sections';
const String OFFERS_SECTIONS = 'offers_sections';
const String MAP = 'app/categories';
const String DOCUMENTATIONS = 'documentations';
const String TAIF = 'posts?tag_id=2';

String harajs = 'harajs';
const String HARAJ_CATEGORY = 'haraj_categories';
const String EVENTS = 'events';
const String OFFERS = 'posts?tag_id=3';


String getAnyUserData(int id) {
  return 'users/$id';
}

String packageUrl(int id) {
  return 'packages/$id';
}

// Routes
String launchScreenRoute = "/launch_screen";
String chooseLanguageRoute = "/choose_language_screen";
String outBoardingRoute = "/out_boarding_screen";
String welcomeRoute = "/welcome_screen";
String loginRoute = "/login_screen";
String pinRoute = "/pin_screen";
String activationRoute = "/activation_screen";
String editProfileRoute = "/edit_profile_screen";
String editFirstProfileRoute = "/edit_first_profile_screen";
String bottomNavRoute = "/bottom_nav_screen";
String contactRoute = "/contact_screen";
String notificationsRoute = "/notifications_screen";
String profileRoute = "/profile_screen";
String chatsRoute = "/chat_screen";
String estateRoute = "/estate_screen";
String searchRoute = "/search_screen";
String myAdsRoute = "/my_ads_screen";
String eventRoute = "/event_screen";
String offerRoute = "/offer_screen";
String favoriteRoute = "/favorite_screen";
String membershipRoute = "/membership_screen";
String estateDetailsRoute = "/estate_details_screen";
String adsConditionRoute = "/ads_condition_screen";
String addAdRoute3 = "/add_ad_screen"; //1
String memberDetailsRoute = "/member_details_screen";
String privateChatScreenRoute = "/private_chat_screen";
String registerRoute = "/register_screen";
String privateChatRoute = "/private_chat_screen";
String addAdRoute1 = "/add_ad_screen1";//2
String addAdRoute2 = "/add_ad_screen2";//3
String addressRoute = "/address_screen";
String addAddressRoute = "/add_address_screen";//4
String addressConditionRoute = "/address_condition_screen";
String addedSuccefullyRoute = "/added_succefully_screen";
String addressDetailsRoute = "/address_details_screen";
String servicesProvidersRoute = "/services_providers_screen";
String servicesProviderDetailsRoute = "/services_provider_details_screen";
String requestRentalRightRoute = "/request_rental_right_screen";
String contractsRoute = "/contracts_screen";
String documentationRoute = "/documentation_screen";
String taifRoute = "/taif_screen";
String tourismGuidingRoute = "/tourism_guiding_screen";

