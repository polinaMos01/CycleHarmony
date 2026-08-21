import os
import re

base_dir = "lib"

# Define mappings from old path to new path
mappings = {
    "lib/routes.dart": "lib/core/router/app_router.dart",
    "lib/screens/splash_screen.dart": "lib/features/auth/presentation/screens/splash_screen.dart",
    "lib/screens/auth/pin_screen.dart": "lib/features/auth/presentation/screens/pin_screen.dart",
    "lib/screens/auth/language_screen.dart": "lib/features/language/presentation/screens/language_screen.dart",
    "lib/screens/auth/role_selection_screen.dart": "lib/features/role_selection/presentation/screens/role_selection_screen.dart",
    "lib/screens/auth/password_recovery_screen.dart": "lib/features/auth/presentation/screens/password_recovery_screen.dart",
    "lib/screens/onboarding/onboarding_screen.dart": "lib/features/onboarding/presentation/screens/onboarding_screen.dart",
    "lib/screens/questionnaire/calendar_screen.dart": "lib/features/questionnaire/presentation/screens/calendar_screen.dart",
}

# 1. Create directories and move files
for old_path, new_path in mappings.items():
    if os.path.exists(old_path):
        os.makedirs(os.path.dirname(new_path), exist_ok=True)
        os.rename(old_path, new_path)

# 2. Update imports in ALL .dart files
import_mappings = {
    "package:frontend/routes.dart": "package:frontend/core/router/app_router.dart",
    "package:frontend/screens/splash_screen.dart": "package:frontend/features/auth/presentation/screens/splash_screen.dart",
    "package:frontend/screens/auth/pin_screen.dart": "package:frontend/features/auth/presentation/screens/pin_screen.dart",
    "package:frontend/screens/auth/language_screen.dart": "package:frontend/features/language/presentation/screens/language_screen.dart",
    "package:frontend/screens/auth/role_selection_screen.dart": "package:frontend/features/role_selection/presentation/screens/role_selection_screen.dart",
    "package:frontend/screens/auth/password_recovery_screen.dart": "package:frontend/features/auth/presentation/screens/password_recovery_screen.dart",
    "package:frontend/screens/onboarding/onboarding_screen.dart": "package:frontend/features/onboarding/presentation/screens/onboarding_screen.dart",
    "package:frontend/screens/questionnaire/calendar_screen.dart": "package:frontend/features/questionnaire/presentation/screens/calendar_screen.dart",
    "'routes.dart'": "'core/router/app_router.dart'"
}

for root, _, files in os.walk(base_dir):
    for file in files:
        if file.endswith(".dart"):
            filepath = os.path.join(root, file)
            with open(filepath, 'r') as f:
                content = f.read()
            
            new_content = content
            for old_import, new_import in import_mappings.items():
                new_content = new_content.replace(old_import, new_import)
            
            if new_content != content:
                with open(filepath, 'w') as f:
                    f.write(new_content)

# Remove empty dirs
os.system("rm -rf lib/screens")
