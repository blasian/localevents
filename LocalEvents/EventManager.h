//
//  EventManager.h
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
#import "Event.h"
#import "Task.h"

@interface EventManager : NSObject

+ (instancetype)sharedInstance;
- (NSArray*) getEvents;
- (Event*) getEventWithId:(int)eventId;
- (NSArray*) getSubscribedEvents;
- (NSArray*) getInvolvedEvents;
- (void) addEvent:(Event*)event;
- (void) removeEvent:(int)eventId;

@end
