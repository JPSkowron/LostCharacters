//
//  LostCharacter.h
//  LostCharacters
//
//  Created by JP Skowron on 1/27/15.
//  Copyright (c) 2015 JP Skowron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface LostCharacter : NSManagedObject

@property (nonatomic, retain) NSString * actor;
@property (nonatomic, retain) NSString * passenger;
@property (nonatomic, retain) NSNumber * seat;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * gender;

@end
