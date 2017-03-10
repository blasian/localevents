//
//  Constant.h
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

// Task Status
enum {
    kTodoStatus = 0,
    kDoingStatus = 1,
    kDoneStatus = 2,
};

// Task Priority
enum {
    kLowPriority = 0,
    kMediumPriority = 1,
    kHighPriority = 2,
};

@end