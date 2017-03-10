//
//  Event.h
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"
#import "Constant.h"

@interface Event : NSObject

@property (nonatomic) int eventId;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* info;
@property (strong, nonatomic) NSString* date;
@property (strong, nonatomic) NSString* location;
@property (strong, nonatomic) NSString* tag;
@property (nonatomic) bool subscribed;
@property (strong, nonatomic) NSArray* tasks;

- (NSArray*) getTasksWithStatus:(int)status;
- (void) addTask:(Task*)task;
@end
