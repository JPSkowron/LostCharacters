//
//  ViewController.m
//  LostCharacters
//
//  Created by JP Skowron on 1/27/15.
//  Copyright (c) 2015 JP Skowron. All rights reserved.
//

#import "CharacterListViewController.h"
#import <CoreData/CoreData.h>
#import "LostCharacter.h"
#import "AppDelegate.h"
@interface CharacterListViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSManagedObjectContext *moc;
@property (nonatomic) NSArray *characters;
@end

@implementation CharacterListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;

    [self loadCharacters];

}
-(void)setCharacters {

    }
-(void)loadCharacters {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"LostCharacter"];
    NSSortDescriptor *actorSorter = [[NSSortDescriptor alloc] initWithKey:@"actor" ascending:YES];
    NSSortDescriptor *passengerSorter = [[NSSortDescriptor alloc] initWithKey:@"passenger" ascending:YES];

   self.characters = [self.moc executeFetchRequest:request error:nil];

    

}

- (void)prepopulateCoreData {
    NSURL *plistURL = [NSURL URLWithString:@"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/2/lost.plist"];
    NSArray *charactersFromPenis = [NSMutableArray arrayWithContentsOfURL:plistURL];


    for (NSDictionary *dictionary in charactersFromPenis) {
        NSManagedObject *mo = [NSEntityDescription insertNewObjectForEntityForName:@"LostCharacter" inManagedObjectContext:self.moc];
        [mo setValue:[dictionary valueForKey:@"actor"] forKey:@"actor"];
        [mo setValue:[dictionary valueForKey:@"passenger"] forKey:@"passenger"];
        [self.moc save:nil];

    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characters.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // Warrior *warrior = [self.warriors objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    //cell.textLabel.text = warrior.name;
    //cell.detailTextLabel.text = warrior.prowess.stringValue;

    return cell;
    
}

@end
