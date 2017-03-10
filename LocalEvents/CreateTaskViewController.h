//
//  CreateTaskViewController.h
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "ViewController.h"
#import "Event.h"

@interface CreateTaskViewController : ViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) Event *event;

@end
