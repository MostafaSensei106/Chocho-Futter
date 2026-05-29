import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m3e_collection/m3e_collection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/app_bar/glass_app_bar_component.dart';
import '../../../../core/widgets/buttons/button_component.dart';
import '../../../../core/widgets/inputs/text_form_field/text_form_field_component.dart';
import '../../../../core/widgets/layout/background_container_component.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const GlassAppBarComponent(title: 'L O G I N'),
      body: BackgroundContainerComponent(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (form, data) {
                const HomeRoute().go(context);
              },
              failure: (form, error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
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
                        )
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .slideY(begin: 0.2, end: 0, duration: 300.ms),
                    const SizedBox(height: 48),
                    TextFormFieldComponent(
                          label: 'Username',
                          prefixIcon: Icons.person_outline,
                          onChanged: (v) =>
                              context.read<LoginCubit>().onUsernameChanged(v),
                          isEnabled: !isLoading,
                        )
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 300.ms)
                        .slideX(begin: -0.1, end: 0, duration: 300.ms),

                    CheckboxListTile(
                      value: form.rememberMe,
                      onChanged: isLoading
                          ? null
                          : (value) {
                              unawaited(HapticFeedback.vibrate());
                              context.read<LoginCubit>().onRememberMeChanged(
                                value ?? false,
                              );
                            },
                      activeColor: Theme.of(context).colorScheme.primary,
                      title: Text(
                        'Remember Me',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                    ).animate().slideX(
                      begin: -0.1,
                      end: 0,
                      delay: 300.ms,
                      duration: 300.ms,
                    ),
                    ButtonComponent(
                          label: 'Login',
                          onPressed: form.isValid
                              ? () => context.read<LoginCubit>().login()
                              : null,
                          isLoading: isLoading,
                        )
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 300.ms)
                        .slideY(begin: 0.2, end: 0, duration: 300.ms),
                    const SizedBox(height: 16),
                    ButtonM3E(
                          icon: const Icon(Icons.g_mobiledata),
                          label: const Text('Continue with Google'),
                          enabled: !isLoading,
                          onPressed: isLoading
                              ? null
                              : () => context
                                    .read<LoginCubit>()
                                    .loginWithGoogle(),
                          style: ButtonM3EStyle.outlined,
                        )
                        .animate()
                        .fadeIn(delay: 250.ms, duration: 300.ms)
                        .slideY(begin: 0.2, end: 0, duration: 300.ms),
                    const SizedBox(height: 8),
                    ButtonM3E(
                          icon: const Icon(Icons.apple),
                          label: const Text('Continue with Apple'),
                          onPressed: isLoading
                              ? null
                              : () =>
                                    context.read<LoginCubit>().loginWithApple(),
                          enabled: !isLoading,
                          style: ButtonM3EStyle.outlined,
                        )
                        .animate()
                        .fadeIn(delay: 300.ms, duration: 300.ms)
                        .slideY(begin: 0.2, end: 0, duration: 300.ms),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              unawaited(HapticFeedback.vibrate());
                              const RegisterRoute().go(context);
                            },
                      child: const Text("Don't have an account? Register"),
                    ).animate().slideY(
                      begin: 0.2,
                      end: 0,
                      delay: 300.ms,
                      duration: 300.ms,
                    ),
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
