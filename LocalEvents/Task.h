//
//  Task.h
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic) int taskId;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* info;
@property (nonatomic) int priority;
@property (nonatomic) bool assigned;
@property (strong, nonatomic) NSString* type;
@property (nonatomic) int status;
@property (strong, nonatomic) NSMutableArray* people;

@end
