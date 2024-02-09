// This code is lifted from Apple's Developer Documenation.
// Source: https://developer.apple.com/library/mac/documentation/cocoa/conceptual/DrawColor/Tasks/StoringNSColorInDefaults.html

#import "NSUserDefaults+myColorSupport.h"

@implementation NSUserDefaults(myColorSupport)

- (void)setColor:(NSColor *)aColor forKey:(NSString *)aKey {
    NSError *error = nil;
    NSData *theData = [NSKeyedArchiver archivedDataWithRootObject:aColor requiringSecureCoding:NO error:&error];
    if (error) {
        // Handle the error appropriately
    }
    [self setObject:theData forKey:aKey];
}

/*
- (void)setColor:(NSColor *)aColor forKey:(NSString *)aKey {
    NSData *theData=[NSKeyedArchiver archivedDataWithRootObject:aColor];
    [self setObject:theData forKey:aKey];
}
*/

/*
- (NSColor *)colorForKey:(NSString *)aKey {
    NSColor *theColor=nil;
    NSData *theData=[self dataForKey:aKey];
    if (theData != nil)
        theColor=(NSColor *)[NSKeyedUnarchiver unarchiveObjectWithData:theData];
    return theColor;
}
*/

- (NSColor *)colorForKey:(NSString *)aKey {
    NSColor *theColor = nil;
    NSData *theData = [self dataForKey:aKey];
    if (theData != nil) {
        NSError *error = nil;
        theColor = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSColor class] fromData:theData error:&error];
        if (error) {
            // Handle the error appropriately
        }
    }
    return theColor;
}

@end
