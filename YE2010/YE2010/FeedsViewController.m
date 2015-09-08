//
//  FeedsViewController.m
//  YE2010
//
//  Created by Michelle Goldman on 3/10/14.
//  Copyright (c) 2014 Michelle Goldman. All rights reserved.
//

#import "FeedsViewController.h"
#import "DisasterClass.h"

@interface FeedsViewController ()

@end

@implementation FeedsViewController
@synthesize disasterList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        //load name of tab bar button and corresponding header
        self.title = NSLocalizedString(@"Resources", @"Resources");
        self.tabBarItem.image = [UIImage imageNamed:@"rss"];
    }
    return self;
}

- (void)viewDidLoad
{
    //create DisasterClass object to be used in arrays/dictionaries
    //Property list format
    NSString *errorDetails = nil;
    NSPropertyListFormat format;
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Disaster" ofType:@"plist"];
    
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    
    self.disasterList = [[NSMutableDictionary alloc] initWithCapacity:1];
    self.disasterList = (NSMutableDictionary *)[NSPropertyListSerialization
                                             propertyListFromData:plistXML
                                             mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                             format:&format
                                             errorDescription:&errorDetails];
   // DisasterClass *disasterClass = [[DisasterClass alloc] init];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadResources:(id)sender
{
    //Get support number from property list
    NSDictionary *resourceDictionary = (NSDictionary *)[self.disasterList objectForKey:@"Resource"];
    NSString *addlResources = [resourceDictionary objectForKey:@"Contact"];
    
    self->additionalResources.text = addlResources;
}




@end
