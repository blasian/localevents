//
//  Event.m
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "Event.h"

@interface Event ()

@property (strong, nonatomic) NSMutableArray *privateTasks;

@end

@implementation Event

- (instancetype)init
{
    self = [super init];
    if (self) {
        static int eventId = 0;
        self.eventId = eventId++;
        self.privateTasks = [NSMutableArray array];
    }
    return self;
}

- (NSArray*) getTasksWithStatus:(int)status {
    NSMutableArray *tasks = [NSMutableArray array];
    for (Task *t in _privateTasks) {
        if (t.status == status) {
            [tasks addObject:t];
        }
    }
    return tasks;
}

- (NSArray*)tasks {
    return _privateTasks;
}

- (void) addTask:(Task*)task {
    [_privateTasks addObject:task];
}

@end
