%hook QuizletDefaultFeatureGateService
- (bool)canUseNightTheme {
    return TRUE;
    } 
- (bool)canUsePremiumThemes {
    return TRUE;
} 
- (bool)isNightThemeFeatureEnabled {
    return TRUE;
} 
- (bool)canSeePremiumThemes {
    return TRUE;
} 
- (bool)isProductFreeTrial7Days {
   return TRUE;
} 
%end
%hook QuizletUserDefaultsOCROnboardingAuthorizer
+ (bool)shouldShowPlusUpsell {
    return FALSE;
} 
%end
%hook FIRAInAppPurchaseItem
- (bool)isFreeTrial {
    return FALSE;
} 
- (void)setFreeTrial:(bool)arg1 {
    arg1 = FALSE;
    %orig;
} 
%end
%hook QuizletApptimizeFeatureFlagService
+ (bool)isPermanentAdsFreeUser {
    return TRUE;
} 
%end
%hook QuizletDefaultFeatureGateService
- (bool)shouldSaveSetsForOfflineUse {
    return %orig;
} 

- (bool)shouldShowOfflineFeature {
    return TRUE;
} 

- (bool)shouldShowOfflineFeatureWithSet:(id)arg1 {
    return %orig;
} 

- (bool)canEnableOfflineFeature {
    return TRUE;
} 
%end
%hook QLIAPManager
- (id)quizletGoProduct {
    return %orig;
} 
%end
%hook QuizletApptimizeFeatureFlagService
+ (bool)quizletGoEnabled {
    return %orig;
} 
%end
%ctor {
    %init(QuizletDefaultFeatureGateService = objc_getClass("Quizlet.DefaultFeatureGateService"),
        QuizletUserDefaultsOCROnboardingAuthorizer = objc_getClass("Quizlet.UserDefaultsOCROnboardingAuthorizer"),
        QuizletApptimizeFeatureFlagService = objc_getClass("Quizlet.ApptimizeFeatureFlagService"));

}

