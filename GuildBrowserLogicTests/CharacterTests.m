//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by colin morishita on 13-03-24.
//  Copyright (c) 2013 Charlie Fulton. All rights reserved.
//

#import "CharacterTests.h"
#import "Character.h"
#import "Item.h"

@implementation CharacterTests
    NSDictionary *_characterDetailJson;
    Character *_testGuy;

-(void)setUp
{
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class] URLForResource:@"character" withExtension:@"json"];
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    id json = [NSJSONSerialization JSONObjectWithData:sampleData
                                              options:kNilOptions
                                                error:&error];
    STAssertNotNil(json, @"invalid test data");
    // 6
    _characterDetailJson = json;
    _testGuy = [[Character alloc]
                initWithCharacterDetailData:_characterDetailJson];
}

-(void)tearDown{
    _characterDetailJson = nil;
    _testGuy = nil;
}

-(void)testCreateCharacterFromDetailJson
{//
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    STAssertNotNil(testGuy1, @"Could not create character from detail json");
    
    Character *testGuy2 = [[Character alloc]initWithCharacterDetailData:nil];
    STAssertNotNil(testGuy2, @"Could not create character from nil data");
    
}

-(void)testCreateCharacterFromDetailJsonProps
{
    STAssertEqualObjects(_testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail url is wrong");
    STAssertEqualObjects(_testGuy.name, @"Hagrel", @"name is wrong");
    STAssertEqualObjects(_testGuy.battleGroup, @"Emberstorm",@"battlegroup is wrong");
    STAssertEqualObjects(_testGuy.realm, @"Borean Tundra", @"realm is wrong");
    STAssertEqualObjects(_testGuy.achievementPoints, @3130,@"achievement points is wrong");
    STAssertEqualObjects(_testGuy.level,@85, @"level is wrong");
    STAssertEqualObjects(_testGuy.classType, @"Warrior", @"class type is wrong");
    STAssertEqualObjects(_testGuy.race, @"Human", @"race is wrong");
    STAssertEqualObjects(_testGuy.gender, @"Male", @"gener is wrong");
    STAssertEqualObjects(_testGuy.averageItemLevel, @379, @"avg item level is wrong");
    STAssertEqualObjects(_testGuy.averageItemLevelEquipped, @355,@"avg item level is wrong");
}
-(void)testCreateCharacterFromDetailJsonValidateItems
{
    STAssertEqualObjects(_testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    STAssertEqualObjects(_testGuy.wristItem.name,@"Vicious Pyrium Bracers", @"name is wrong");
                                              
}
@end
