%hook QuizletDefaultFeatureGateService
- (bool)canUseNightTheme {
    return 1;
} 
- (bool)canUsePremiumThemes {
    return 1;
} 
- (bool)isNightThemeFeatureEnabled {
    return 1;
} 
%end

%hook QuizletUserDefaultsOCROnboardingAuthorizer
+ (bool)shouldShowPlusUpsell {
    return 0;
} 
%end

%hook QuizletDefaultFeatureGateService
- (bool)canSeePremiumThemes {
    return 1;
} 
%end

%hook FIRAInAppPurchaseItem
- (bool)isFreeTrial {
    return 0;
} 
%end

%hook FIRAInAppPurchaseItem
- (void)setFreeTrial:(bool)arg1 {
    arg1 = 0;
    %orig;
} 
%end

%hook QuizletDefaultFeatureGateService
- (bool)isProductFreeTrial7Days {
    return 1;
} 
%end

%hook QuizletApptimizeFeatureFlagService
+ (bool)isPermanentAdsFreeUser {
    return 1;
} 
%end

%hook QuizletDefaultFeatureGateService
- (bool)shouldSaveSetsForOfflineUse {
    return %orig;
} 
%end

%hook QuizletDefaultFeatureGateService
- (bool)shouldShowOfflineFeature {
    return 1;
} 
%end

%hook QuizletDefaultFeatureGateService
- (bool)shouldShowOfflineFeatureWithSet:(id)arg1 {
    return %orig;
} 
%end

%hook QuizletDefaultFeatureGateService
- (bool)offlineFeatureCanShowOneSet {
} 
%end

%hook QuizletDefaultFeatureGateService
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

