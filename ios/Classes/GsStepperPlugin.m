#import "GsStepperPlugin.h"
#if __has_include(<gs_stepper/gs_stepper-Swift.h>)
#import <gs_stepper/gs_stepper-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "gs_stepper-Swift.h"
#endif

@implementation GsStepperPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGsStepperPlugin registerWithRegistrar:registrar];
}
@end
