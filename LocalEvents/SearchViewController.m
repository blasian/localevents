//
//  SearchViewController.m
//  LocalEvents
//
//  Created by Michael Spearman on 3/6/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "SearchViewController.h"
#import "EventViewController.h"
#import "EventManager.h"
#import "Event.h"
#import "Task.h"
#import "Constant.h"

@interface SearchViewController ()

@property (strong, nonatomic) NSMutableArray* results;
@property (weak, nonatomic) IBOutlet UITableView* resultsTableView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _resultsTableView.delegate = self;
    _resultsTableView.dataSource = self;
    _results = [NSMutableArray array];
    
    Event *event1 = [[Event alloc] init];
    event1.name = @"Soup Kitchen";
    event1.info = @"We are planning on organizing an event to help feed the homeless. Anything helps!";
    Task *task1 = [[Task alloc] init];
    task1.name = @"Food";
    task1.info = @"We need volunteers to bring food down to the shelters.";
    task1.status = kTodoStatus;
    Task *task2 = [[Task alloc] init];
    task2.name = @"Setup";
    task2.info = @"We need volunteers to help setup chairs and tents for the event.";
    task2.status = kTodoStatus;
    [event1 addTask:task1];
    [event1 addTask:task2];
    
    [_results addObject:event1];
    [[EventManager sharedInstance] addEvent:event1];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ResultCell"];
    cell.textLabel.text = ((Event*)[_results objectAtIndex:indexPath.row]).name;
    return cell;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Suggested Events";
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _results.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Event *event = [_results objectAtIndex:indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EventViewController *eventVC = [storyboard instantiateViewControllerWithIdentifier:@"Event"];
    eventVC.event = event;
    [self.navigationController pushViewController:eventVC animated:YES];
}

@end
