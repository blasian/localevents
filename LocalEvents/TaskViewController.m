//
//  TaskViewController.m
//  LocalEvents
//
//  Created by Michael Spearman on 3/6/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "TaskViewController.h"
#import "Constant.h"

@interface TaskViewController()

@property (weak, nonatomic) IBOutlet UITextView* infoTextView;
@property (weak, nonatomic) IBOutlet UILabel* helpLabel;
@property (weak, nonatomic) IBOutlet UIButton* startButton;
@property (weak, nonatomic) IBOutlet UIImageView* chatImage;
@property (weak, nonatomic) IBOutlet UITextField* chatTextField;

@end

@implementation TaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.infoTextView setText:_task.info];
    [self setupFrame];
}

- (void)setupFrame {
    _chatImage.hidden = !_task.assigned;
    _chatTextField.hidden = !_task.assigned;
    _helpLabel.hidden = _task.assigned;
    _startButton.hidden = _task.assigned;
}

- (IBAction)startButtonPressed:(id)sender {
    _task.assigned = true;
    _task.status = kDoingStatus;
    [self setupFrame];
}

@end
