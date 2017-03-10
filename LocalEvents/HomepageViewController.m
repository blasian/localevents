//
//  HomepageViewController.m
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "HomepageViewController.h"
#import "EventViewController.h"
#import "CreateEventViewController.h"

// TableView tags
enum {
    kInvolved = 0,
    kSubscribed = 1
};

@interface HomepageViewController ()

@property (weak, nonatomic) IBOutlet UITableView *involvedTable;
@property (weak, nonatomic) IBOutlet UITableView *subscribedTable;

@end

@implementation HomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Profile" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [self refreshTables];
}

- (void)refreshTables {
    [self.involvedTable reloadData];
    [self.subscribedTable reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    switch (tableView.tag) {
        case kInvolved:
            count = [[[EventManager sharedInstance] getInvolvedEvents] count];
            break;
        case kSubscribed:
            count = [[[EventManager sharedInstance] getSubscribedEvents] count];
            break;
        default:
            break;
    }
    return count;
}



- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    switch (tableView.tag) {
        case kInvolved:
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TaskCell"];
            cell.textLabel.text = [[[[EventManager sharedInstance] getInvolvedEvents] objectAtIndex:indexPath.row] name];
            break;
        case kSubscribed:
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TaskCell"];
            cell.textLabel.text = [[[[EventManager sharedInstance] getSubscribedEvents] objectAtIndex:indexPath.row] name];
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EventViewController *eventVC = [storyboard instantiateViewControllerWithIdentifier:@"Event"];
    Event *event;
    switch (tableView.tag) {
        case kInvolved:
            event = [[[EventManager sharedInstance] getInvolvedEvents] objectAtIndex:indexPath.row];
            break;
        case kSubscribed:
            event = [[[EventManager sharedInstance] getSubscribedEvents] objectAtIndex:indexPath.row];
            break;
        default:
            return;
    }
    eventVC.event = event;
    [self.navigationController pushViewController:eventVC animated:YES];
}

- (IBAction)createEventPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CreateEventViewController *createEventVC = [storyboard instantiateViewControllerWithIdentifier:@"CreateEvent"];
    [self.navigationController pushViewController:createEventVC animated:YES];
}

@end
