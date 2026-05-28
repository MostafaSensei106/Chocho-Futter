import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/app_bar/glass_app_bar_component.dart';
import '../../../../core/widgets/buttons/button_component.dart';
import '../../../../core/widgets/inputs/text_field_component.dart';
import '../../../../core/widgets/layout/background_container_component.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const GlassAppBarComponent(
        title: 'L O G I N',
      ),
      body: BackgroundContainerComponent(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (form, data) {
                const HomeRoute().go(context);
              },
              failure: (form, error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error), backgroundColor: Theme.of(context).colorScheme.error),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            final form = state.formState;
            final isLoading = state is Loading;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 32,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 2,
                      ),
                    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2, end: 0, duration: 300.ms),
                    const SizedBox(height: 48),
                    TextFieldComponent(
                      label: 'Username',
                      prefixIcon: Icons.person_outline,
                      onChanged: (v) => context.read<LoginCubit>().onUsernameChanged(v),
                      enabled: !isLoading,
                    ).animate().fadeIn(delay: 100.ms, duration: 300.ms).slideX(begin: -0.1, end: 0, duration: 300.ms),
                    const SizedBox(height: 40),
                    ButtonComponent(
                      label: 'Login',
                      onPressed: form.isValid ? () => context.read<LoginCubit>().login() : null,
                      isLoading: isLoading,
                    ).animate().fadeIn(delay: 200.ms, duration: 300.ms).slideY(begin: 0.2, end: 0, duration: 300.ms),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () => const RegisterRoute().go(context),
                      child: Text(
                        "Don't have an account? Register",
                        style: TextStyle(color: Theme.of(context).colorScheme.primary),
                      ),
                    ).animate().slideY(begin: 0.2, end: 0, delay: 300.ms, duration: 300.ms),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
