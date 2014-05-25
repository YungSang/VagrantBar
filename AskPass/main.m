//
//  main.m
//  AskPass
//
//  Created by Paul on 23/05/2014.
//  Copyright (c) 2014 BipSync. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

int main( int argc, const char * argv[] ) {
    
    CFUserNotificationRef notification;
	SInt32 error;
	CFOptionFlags response;
	CFStringRef password;
    
    NSURL * iconUrl =
    [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",
                            [[[NSBundle mainBundle] executablePath] stringByDeletingLastPathComponent],
                          @"Vagrant Bar.app/Contents/Resources/64.png"
                          ]];
	
	NSDictionary * panel =
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"Vagrant Bar", kCFUserNotificationAlertHeaderKey,
     @"\nVagrant requires your password to continue:", kCFUserNotificationAlertMessageKey,
     @"",kCFUserNotificationTextFieldTitlesKey,
     @"Cancel",kCFUserNotificationAlternateButtonTitleKey,
     (__bridge CFURLRef)iconUrl, kCFUserNotificationIconURLKey,
     nil];
	
	notification = CFUserNotificationCreate( kCFAllocatorDefault, 0,
                                      kCFUserNotificationPlainAlertLevel | CFUserNotificationSecureTextField(0),
                                      &error,
                                      (__bridge CFDictionaryRef)panel );
	if ( error ){
		CFRelease( notification );
        return 1;
	}
	
	error = CFUserNotificationReceiveResponse( notification, 0, &response );
	if ( error ){
		CFRelease( notification );
        return 1;
	}
	
	int button = response & 0x3;
	if ( button == kCFUserNotificationAlternateResponse ) {
		CFRelease( notification );
        return 1;
	}
	
	password = CFUserNotificationGetResponseValue( notification, kCFUserNotificationTextFieldValuesKey, 0 );
    printf( "%s\r", [(__bridge NSString *)password cStringUsingEncoding:NSUTF8StringEncoding] );
    
	CFRelease( notification );
    
    return 0;
    
}

