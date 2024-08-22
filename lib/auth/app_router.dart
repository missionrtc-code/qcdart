import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qcdart/auth/app_auth.dart';
import 'package:qcdart/screen/dashboard.dart';
import 'package:qcdart/screen/forget.dart';
import 'package:qcdart/screen/login.dart';
import 'package:qcdart/screen/manage/plant_management.dart';
import 'package:qcdart/screen/manage/plant_management_edit.dart';
import 'package:qcdart/screen/register.dart';

enum RoutePath {
  signIn(path: '/'),
  signUp(path: 'sign_up'),
  forgetPassword(path: 'forget_password'),

  dashboard(path: '/dashboard'),

  dashboardPlantManagement(path: 'plant_management'),
  dashboardPlantManagementDetail(path: ':id'),;

  // dashboardUserManagement(path: '/dashboard/user_management'),
  // dashboardUserManagementDetail(path: '/dashboard/user_management/:id'),
  
  // dashboardChecklistManagement(path: '/dashboard/checklist_management'),
  // dashboardChecklistManagementDetail(path: '/dashboard/checklist_management/:id'),
  
  // dashboardAuditPlanning(path: '/dashboard/audit_planning'),
  // dashboardAuditPlanningDetail(path: '/dashboard/audit_planning/:id'),
  
  // dashboardAuditExecution(path: '/dashboard/audit_execution'),
  // dashboardAuditExecutionDetail(path: '/dashboard/audit_execution/:id');

  const RoutePath({ required this.path });
  final String path;
}

/// The global router for the app
final router = GoRouter(
  redirect:(context, state) async {
    // Check if the token is expired
    final token = await isTokenExpired();

    // Redirect to the sign in page if the token is expired
    if (token &&  [RoutePath.signIn.name, RoutePath.signUp.path, RoutePath.forgetPassword.path].contains(state.topRoute!.name)) {
      return RoutePath.signIn.path;
    } else if (!token && state.topRoute!.name == RoutePath.signIn.name) {
      return RoutePath.dashboard.path;
    }

    // Return null if no redirection is needed
    return null;
  },
  routes: [
    // Sign in & Sign up route
    GoRoute(
      path: RoutePath.signIn.path,
      name: RoutePath.signIn.name,
      pageBuilder: (context, state) => const MaterialPage(
        child: LoginScreen(),
      ),
      routes: [
        GoRoute(
          path: RoutePath.signUp.path,
          name: RoutePath.signUp.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: RegisterScreen(),
          ),
        ),
        GoRoute(
          path: RoutePath.forgetPassword.path,
          name: RoutePath.forgetPassword.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: ForgetScreen(),
          )
        )
      ]
    ),

    // Dashboard route
    GoRoute(
      path: RoutePath.dashboard.path,
      name: RoutePath.dashboard.name,
      pageBuilder: (context, state) => const MaterialPage(
        child: DashboardScreen(),
      ),
      routes: [
        GoRoute(
          path: RoutePath.dashboardPlantManagement.path,
          name: RoutePath.dashboardPlantManagement.name,
          pageBuilder: (context, state) => const MaterialPage(
            child: PlantManagementScreen(),
          ),
          routes: [
            GoRoute(
              path: RoutePath.dashboardPlantManagementDetail.path,
              name: RoutePath.dashboardPlantManagementDetail.name,
              pageBuilder: (context, state) => const MaterialPage(
                child: PlantManagementEditScreen(),
              )
            )
          ]
        ),
      ]
    ),
  ],
);
