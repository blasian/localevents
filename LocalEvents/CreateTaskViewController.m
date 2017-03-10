//
//  CreateTaskViewController.m
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "CreateTaskViewController.h"

@interface CreateTaskViewController ()

@property (strong, nonatomic) NSMutableArray *people;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *priorityControl;
@property (weak, nonatomic) IBOutlet UITextField *peopleTextField;
@property (weak, nonatomic) IBOutlet UITableView *peopleTableView;

@end

@implementation CreateTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _peopleTextField.delegate = self;
    _peopleTableView.delegate = self;
    _peopleTableView.dataSource = self;
    _people = [NSMutableArray array];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _people.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PeopleCell"];
    cell.textLabel.text = [_people objectAtIndex:indexPath.row];
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _peopleTextField) {
        [_people addObject:_peopleTextField.text];
        [textField setText:@""];
        [textField resignFirstResponder];
        [_peopleTableView reloadData];
    }
    return NO;
}

- (IBAction)doneButtonPressed:(id)sender {
    Task *task = [[Task alloc] init];
    task.name = _nameTextField.text;
    task.info = _infoTextView.text;
    task.priority = (int)_priorityControl.selectedSegmentIndex;
    task.people = _people;
    [_event addTask:task];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
