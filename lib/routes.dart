import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:esoger/ui/screens/splash/index.dart';
import 'package:esoger/ui/screens/splash/splash_screen_1.dart';
import 'package:esoger/ui/screens/splash/splash_screen_2.dart';
import 'package:esoger/ui/screens/onboarding/onboard.dart';
import 'package:esoger/ui/screens/onboarding/onboard1.dart';
import 'package:esoger/ui/screens/onboarding/onboard2.dart';

//auth
import 'package:esoger/ui/screens/auth/signin/index.dart';
import 'package:esoger/ui/screens/auth/signup/index.dart';
import 'package:esoger/ui/screens/auth/signup/policy.dart';
import 'package:esoger/ui/screens/auth/verify_email/index.dart';
import 'package:esoger/ui/screens/auth/verify_email/checkmailbox.dart';
import 'package:esoger/ui/screens/auth/forgot_password.dart';
import 'package:esoger/ui/screens/auth/create_login_password.dart';

//home
import 'package:esoger/pages/dashboard.dart';
import 'package:esoger/ui/screens/home/all_design.dart';
import 'package:esoger/ui/screens/home/upgrade.dart';
import 'package:esoger/ui/screens/home/calculator/index.dart';
import 'package:esoger/ui/screens/home/calculator/form.dart';

//school
import 'package:esoger/ui/screens/school/enrolform/index.dart';
import 'package:esoger/ui/screens/school/enrolform/module.dart';

//payment
import 'package:esoger/ui/screens/payment/index.dart';
import 'package:esoger/ui/screens/payment/details.dart';

//profile
import 'package:esoger/ui/screens/profile/index.dart';
import 'package:esoger/ui/screens/profile/aboutme.dart';
import 'package:esoger/ui/screens/profile/setnewpassword.dart';
import 'package:esoger/ui/screens/profile/transactions.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return Splash();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'splash1',
            builder: (BuildContext context, GoRouterState state) {
              return const Splash1();
            },
          ),
          GoRoute(
            path: 'splash2',
            builder: (BuildContext context, GoRouterState state) {
              return const Splash2();
            },
          ),
          GoRoute(
            path: 'onboard',
            builder: (BuildContext context, GoRouterState state) {
              return const Onboard();
            },
          ),
          GoRoute(
            path: 'onboard1',
            builder: (BuildContext context, GoRouterState state) {
              return const Onboard1();
            },
          ),
          GoRoute(
            path: 'onboard2',
            builder: (BuildContext context, GoRouterState state) {
              return const Onboard2();
            },
          ),
          GoRoute(
            path: 'signin',
            builder: (BuildContext context, GoRouterState state) {
              return const SignIn();
            },
          ),
          GoRoute(
            path: 'signup',
            builder: (BuildContext context, GoRouterState state) {
              return const SignUp();
            },
          ),
          GoRoute(
            path: 'policy',
            builder: (BuildContext context, GoRouterState state) {
              return TermsAndConditionsScreen();
            },
          ),
          GoRoute(
            path: 'verifyemail',
            builder: (BuildContext context, GoRouterState state) {
              return const VerifyEmail();
            },
          ),
          GoRoute(
            path: 'verifyemail/:email',
            builder: (BuildContext context, GoRouterState state) {
              final email = state.pathParameters['email']!;
              return CheckEmailBox(email: email);
            },
          ),
          GoRoute(
            path: 'forgotpassword/:method',
            builder: (BuildContext context, GoRouterState state) {
              final method = state.pathParameters['method']!;
              return ForgotPassword(method: method);
            },
          ),
          GoRoute(
            path: 'createloginpassword',
            builder: (BuildContext context, GoRouterState state) {
              return const CreateLoginPassword();
            },
          ),

          //home
          GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return HomePage();
            },
          ),
          GoRoute(
            path: 'calculator',
            builder: (BuildContext context, GoRouterState state) {
              return const CalculatorScreen();
            },
          ),
          GoRoute(
            path: 'calculatorform',
            builder: (BuildContext context, GoRouterState state) {
              return SubmitDesignWorkbookPage();
            },
          ),
          GoRoute(
            path: 'all_design',
            builder: (BuildContext context, GoRouterState state) {
              return AllEngineeringDesign();
            },
          ),
          GoRoute(
            path: 'upgrade',
            builder: (BuildContext context, GoRouterState state) {
              return UpgradePlan();
            },
          ),

          //school
          GoRoute(
            path: 'schoolenrolform',
            builder: (BuildContext context, GoRouterState state) {
              return TrainingFormPage();
            },
          ),
          GoRoute(
            path: 'schoolenrolmodule',
            builder: (BuildContext context, GoRouterState state) {
              return ModuleDetailsPage();
            },
          ),

          GoRoute(
            path: 'payment',
            builder: (BuildContext context, GoRouterState state) {
              return PaymentPage();
            },
          ),
          GoRoute(
            path: 'paymentdetails',
            builder: (BuildContext context, GoRouterState state) {
              return PaymentDetailsScreen();
            },
          ),

          //profile
          GoRoute(
            path: 'profile',
            builder: (BuildContext context, GoRouterState state) {
              return UserProfileScreen();
            },
          ),
          GoRoute(
            path: 'aboutme',
            builder: (BuildContext context, GoRouterState state) {
              return AboutMePage();
            },
          ),
          GoRoute(
            path: 'setnewpassword',
            builder: (BuildContext context, GoRouterState state) {
              return SetNewPassword();
            },
          ),

          GoRoute(
            path: 'transactions',
            builder: (BuildContext context, GoRouterState state) {
              return TransactionHistoryScreen();
            },
          ),
        ],
      ),
    ],
    // redirect: (BuildContext context, GoRouterState state) {
    //   final userProfile = ref.read(userProfileProvider);
    //   final isLoggedIn = userProfile != null;
    //   if (isLoggedIn && state.matchedLocation == '/') {
    //     return '/home';
    //   }

    //   if (!isLoggedIn && state.matchedLocation.startsWith('/home')) {
    //     return '/';
    //   }

    //   return null;
    // },
  );
}
