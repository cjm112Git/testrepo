//
//  WowUtilsTests.m
//  GuildBrowser
//
//  Created by colin morishita on 13-03-24.
//  Copyright (c) 2013 Charlie Fulton. All rights reserved.
//

#import "WowUtilsTests.h"
#import "WowUtils.h"

@implementation WowUtilsTests
-(void)testCharacterClassNameLookup{
    STAssertEqualObjects(@"Warrior", [WoWUtils classFromCharacterType:1], @"ClassType should be Warrior");
    STAssertFalse([@"Mage" isEqualToString:[WoWUtils classFromCharacterType:2]], nil);
    STAssertTrue([@"Paladin" isEqualToString:[WoWUtils classFromCharacterType:2]], nil);
}
-(void)testRaceTypeLookup
{
    STAssertEqualObjects(@"Human", [WoWUtils raceFromRaceType:1], nil);
    STAssertEqualObjects(@"Orc", [WoWUtils raceFromRaceType:2], nil);
    STAssertFalse([@"Night Elf" isEqualToString:[WoWUtils raceFromRaceType:45]], nil);
}
-(void)testQualityLookup
{
    STAssertEquals(@"Grey", [WoWUtils qualityFromQualityType:1],
                   nil);
    STAssertFalse([@"Purple" isEqualToString:[WoWUtils
                                              qualityFromQualityType:10]],nil);
    // add the rest as an exercise
    
}
@end
