//
//  EventViewController.h
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "ViewController.h"
#import "Event.h"

@interface EventViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) Event *event;

@end
