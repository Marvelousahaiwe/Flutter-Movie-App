import 'package:flutter/material.dart';
import 'package:movies_app/core/presentation/components/custom_app_bar.dart';
import 'package:movies_app/core/resources/app_strings.dart';
import 'package:movies_app/core/resources/app_values.dart';
import 'package:url_launcher/url_launcher.dart';

class DevelopersInfo extends StatelessWidget {
  const DevelopersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'App Info'),
      body: SizedBox(
        height: AppSize.s400,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _info(context, 'App Info', AppStrings.appInfo),
            SizedBox(height: AppSize.s20),
            _buildAboutDataText('Developed By', context),
            _buildLinkText(
              context,
              AppStrings.myName,
              AppStrings.myLinkedinLink,
              'link',
            ),
            SizedBox(height: AppSize.s20),
            _buildAboutDataText('Email', context),
            _buildLinkText(
              context,
              AppStrings.email,
              AppStrings.email,
              'email',
            ),
            SizedBox(height: AppSize.s20),
            _buildAboutDataText('Source Code', context),
            _buildLinkText(
              context,
              'Github',
              AppStrings.projectGithubLink,
              'link',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutDataText(String text, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(text, textAlign: TextAlign.center, style: textTheme.bodyMedium);
  }

  Widget _buildLinkText(
    BuildContext context,
    String text,
    String url,
    String type,
  ) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () async {
        try {
          if (type == 'link') {
            Uri link = Uri.parse(url);
            await launchUrl(link, mode: LaunchMode.externalApplication);
          } else {
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: AppStrings.email,
            );
            await launchUrl(emailLaunchUri);
          }
        } catch (e) {
          // Show error message
        }
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textTheme.labelLarge?.copyWith(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  // Helper Widget
  Widget _info(BuildContext context, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            desc,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
