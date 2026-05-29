import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/validator/name/name_validator.dart';
import '../../../../core/widgets/app_bar/glass_app_bar_component.dart';
import '../../../../core/widgets/buttons/button_component.dart';
import '../../../../core/widgets/inputs/text_form_field/text_form_field_component.dart';
import '../../../../core/widgets/layout/background_container_component.dart';
import '../../logic/cubit/register_cubit.dart';
import '../../logic/cubit/register_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const GlassAppBarComponent(title: 'R E G I S T E R'),
      body: BackgroundContainerComponent(
        child: BlocConsumer<RegisterCubit, RegisterState>(
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
                          'Join the Cosmos',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 28,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.5,
                          ),
                        )
                        .animate()
                        .fadeIn(duration: 300.ms)
                        .slideY(begin: 0.2, end: 0, duration: 300.ms),
                    const SizedBox(height: 48),
                    TextFormFieldComponent(
                          label: 'Username',
                          prefixIcon: Icons.person_outline,
                          onChanged: (v) => context
                              .read<RegisterCubit>()
                              .onUsernameChanged(v),
                          isEnabled: !isLoading,
                          errorText: state.formState.username.displayError
                              ?.message(context),
                        )
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 300.ms)
                        .slideX(begin: -0.1, end: 0, duration: 300.ms),
                    const SizedBox(height: 20),
                    TextFormFieldComponent(
                          key: ValueKey(form.deviceId),
                          label: 'Device ID (Auto-generated)',
                          initialValue: form.deviceId,
                          prefixIcon: Icons.devices,
                          readOnly: true,
                          isEnabled: false,
                        )
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 300.ms)
                        .slideX(begin: -0.1, end: 0, duration: 300.ms),
                    CheckboxListTile(
                      value: form.rememberMe,
                      onChanged: isLoading
                          ? null
                          : (value) {
                              unawaited(HapticFeedback.vibrate());
                              context.read<RegisterCubit>().onRememberMeChanged(
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
                    const SizedBox(height: 32),
                    ButtonComponent(
                      label: 'Register',
                      onPressed: form.isValid
                          ? () => context.read<RegisterCubit>().register()
                          : null,
                      isLoading: isLoading,
                      isEnabled: form.isValid && !isLoading,
                    ).animate().slideY(
                      begin: 0.2,
                      end: 0,
                      delay: 400.ms,
                      duration: 300.ms,
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              unawaited(HapticFeedback.vibrate());
                              const LoginRoute().go(context);
                            },
                      child: const Text('Already have an account? Login'),
                    ).animate().slideY(
                      begin: 0.2,
                      end: 0,
                      delay: 500.ms,
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
