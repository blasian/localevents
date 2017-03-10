//
//  EventViewController.m
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "EventViewController.h"
#import "EventManager.h"
#import "CreateTaskViewController.h"
#import "TaskViewController.h"

@interface EventViewController ()

@property (weak, nonatomic) IBOutlet UITableView *todoTableView;

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _event.name;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Join" style:UIBarButtonItemStylePlain target:self action:@selector(joinPressed)];
}

- (void)joinPressed {
    self.event.subscribed = true;
}

- (void)viewDidAppear:(BOOL)animated {
    [self.todoTableView reloadData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_event getTasksWithStatus:kTodoStatus] count];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Task *task = [[_event getTasksWithStatus:kTodoStatus] objectAtIndex:indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TaskCell"];
    cell.textLabel.text = task.name;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Task *task = [[_event getTasksWithStatus:kTodoStatus] objectAtIndex:indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TaskViewController *taskVC = [storyboard instantiateViewControllerWithIdentifier:@"Task"];
    taskVC.task = task;
    [self.navigationController pushViewController:taskVC animated:YES];
}

- (IBAction)createTaskPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CreateTaskViewController *createTaskVC = [storyboard instantiateViewControllerWithIdentifier:@"CreateTask"];
    createTaskVC.event = _event;
    [self.navigationController pushViewController:createTaskVC animated:YES];
}

@end
