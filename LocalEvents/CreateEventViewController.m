//
//  CreateEvent.m
//  LocalEvents
//
//  Created by Michael Spearman on 3/5/17.
//  Copyright © 2017 Blasian. All rights reserved.
//

#import "CreateEventViewController.h"
#import "CreateTaskViewController.h"
#import "ViewController.h"

@interface CreateEventViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *typeTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property (weak, nonatomic) IBOutlet UITextField *locationTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *typesPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *timesPickerView;
@property (strong, nonatomic) NSArray* times;
@property (strong, nonatomic) NSArray* types;

@end

@implementation CreateEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _typesPickerView.delegate = self;
    _typesPickerView.dataSource = self;
    _timesPickerView.delegate = self;
    _timesPickerView.dataSource = self;
    _typeTextField.delegate = self;
    _timeTextField.delegate = self;
    _typesPickerView.hidden = true;
    _timesPickerView.hidden = true;
    
    _times = [NSArray arrayWithObjects:@"1 - 2 weeks", @"3 - 5 weeks", @"6 - 8 weeks", @"8+ weeks", nil];
    _types = [NSArray arrayWithObjects:@"Concert", @"Gathering", @"Sports", @"Other", nil];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    _typesPickerView.hidden = YES;
    _timesPickerView.hidden = YES;
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self.view endEditing:YES];
    if (textField.tag == 0) {
        _typesPickerView.hidden = YES;
        _timesPickerView.hidden = NO;
    }
    if (textField.tag == 1) {
        _timesPickerView.hidden = YES;
        _typesPickerView.hidden = NO;
    }
    return NO;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView.tag == 0) {
        [_typeTextField setText:[_types objectAtIndex:row]];
    }
    if (pickerView.tag == 1) {
        [_timeTextField setText:[_times objectAtIndex:row]];
    }
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *str = @"";
    if (pickerView.tag == 0) {
        str = [_types objectAtIndex:row];
    }
    if (pickerView.tag == 1) {
        str = [_times objectAtIndex:row];
    }
    return str;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger
    len = 0;
    if (pickerView.tag == 0) {
        len = [_types count];
    }
    if (pickerView.tag == 1) {
        len = [_times count];
    }
    return len;
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (IBAction)createButtonPressed:(id)sender {
    Event *event = [[Event alloc] init];
    event.subscribed = true;
    event.name = _nameTextField.text;
    event.location = _locationTextField.text;
    event.date = _timeTextField.text;
    EventManager *emgmt = [EventManager sharedInstance];
    [emgmt addEvent:event];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
