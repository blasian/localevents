//
//  Task.m
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "Task.h"

@implementation Task

- (instancetype)init
{
    self = [super init];
    if (self) {
        static int taskId = 0;
        self.taskId = taskId++;
    }
    return self;
}

@end
