//
//  ViewController.m
//  Deprecrastinator
//
//  Created by dan rudolf on 5/19/14.
//  Copyright (c) 2014 Dan Rudolf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) NSMutableArray *itemsArray;
@property (nonatomic) UIAlertView *alert;
@property (nonatomic) UIButton *deleteButton;
@property (nonatomic) NSIndexSet *indexesToDelete;

@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;



@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.itemsArray = [[NSMutableArray alloc] init];
    [self setNeedsStatusBarAppearanceUpdate];

}

- (IBAction)onDeletePressed:(id)sender{

}

- (IBAction)addTask:(id)sender {
    
  self.alert = [[UIAlertView alloc] initWithTitle:@"New Event" message:@"EnterEvent"delegate:self cancelButtonTitle:@"Add Task" otherButtonTitles:@"Cancel", nil];
    [self.alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [self.alert show];
}

#pragma TableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.itemsArray.count;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.itemsArray removeObjectAtIndex:indexPath.row];
    [self.tableViewOutlet reloadData];

    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *task = [self.itemsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = task;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:indexPath];
      tableView.tintColor = [UIColor whiteColor];
    
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.contentView.superview.backgroundColor = [UIColor greenColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    
    else if (cell.accessoryType ==UITableViewCellAccessoryCheckmark){
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.contentView.superview.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
    }
}


#pragma TextField Delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.itemsArray addObject:[[alertView textFieldAtIndex:0]text]];
    [self.tableViewOutlet reloadData];

}



@end
