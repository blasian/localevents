//
//  EventManager.m
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "EventManager.h"

@interface EventManager()

@property (strong, nonatomic) NSMutableArray *events;

@end

@implementation EventManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _events = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)sharedInstance {
    static EventManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EventManager alloc] init];
    });
    return sharedInstance;
}

- (NSArray*) getEvents {
    return [_events copy];
}

- (NSArray*) getSubscribedEvents {
    NSMutableArray *subs = [NSMutableArray array];
    for (Event *e in _events) {
        if (e.subscribed) {
            [subs addObject:e];
        }
    }
    return subs;
}

- (NSArray*) getInvolvedEvents {
    NSMutableArray *eves = [NSMutableArray array];
    for (Event *e in _events) {
        for (Task *t in e.tasks) {
            if (t.assigned) {
                [eves addObject:e];
                break;
            }
        }
    }
    return eves;
}

- (void) addEvent:(Event*)event {
    [_events addObject:event];
}

- (Event*) getEventWithId:(int)eventId {
    for (Event *e in _events) {
        if (e.eventId == eventId) return e;
    }
    return nil;
}

- (void) removeEvent:(int)eventId {
    for (Event *e in _events) {
        if (e.eventId == eventId) {
            [_events removeObject:e];
        }
    }
}

@end
