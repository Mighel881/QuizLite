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
    return 0;
} 
%end



%hook FIRAInAppPurchaseItem
- (bool)isFreeTrial {
    return 0;
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
    return 1;
} 

- (bool)shouldShowOfflineFeatureWithSet:(id)arg1 {
    return %orig;
} 

- (bool)canEnableOfflineFeature {
    return 1;
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

