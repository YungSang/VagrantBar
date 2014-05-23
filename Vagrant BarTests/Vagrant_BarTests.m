//
//  Vagrant_BarTests.m
//  Vagrant BarTests
//
//  Created by Paul on 22/05/2014.
//  Copyright (c) 2014 BipSync. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"

@interface Vagrant_BarTests : XCTestCase

@end

@implementation Vagrant_BarTests

- (void)testAppDelegate {
    
    AppDelegate * delegate = [[AppDelegate alloc] init];
    
    NSArray * machineStatuses = [delegate parseGlobalStatus:@""];
    XCTAssertTrue( [machineStatuses count] == 0, @"Empty response" );
    
    machineStatuses =
    [delegate parseGlobalStatus:
     @"id       name        provider  state   directory\n"
     @"-------------------------------------------------------------------------------------------------------------\n"
     @"abc123  machinename parallels running /Users/user/path \n"
     @"\n"
     @"The above shows information about all known Vagrant environments\n"
     @"on this machine. This data is cached and may not be completely\n"
     @"up-to-date. To interact with any of the machines, you can go to\n"
     @"that directory and run Vagrant, or you can use the ID directly\n"
     @"with Vagrant commands from any directory. For example:\n"
     @"\"vagrant destroy 1a2b3c4d\"\n"];
    
    XCTAssertTrue( [machineStatuses count] == 1, @"Response with one machine" );
    
    machineStatuses =
    [delegate parseGlobalStatus:
     @"id       name        provider  state   directory\n"
     @"-------------------------------------------------------------------------------------------------------------\n"
     @"abc123  machinename1 parallels running /Users/user/path \n"
     @"abc124  machinename2 parallels running /Users/user/path \n"
     @"abc125  machinename3 parallels running /Users/user/path \n"
     @"abc126  machinename4 parallels running /Users/user/path \n"
     @"abc127  machinename5 parallels running /Users/user/path \n"
     @"abc128  machinename6 parallels running /Users/user/path \n"
     @"\n"
     @"The above shows information about all known Vagrant environments\n"
     @"on this machine. This data is cached and may not be completely\n"
     @"up-to-date. To interact with any of the machines, you can go to\n"
     @"that directory and run Vagrant, or you can use the ID directly\n"
     @"with Vagrant commands from any directory. For example:\n"
     @"\"vagrant destroy 1a2b3c4d\"\n"];
    
    XCTAssertTrue( [machineStatuses count] == 6, @"Response with six machines" );
    
    
}

@end
