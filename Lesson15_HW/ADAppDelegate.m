//
//  ADAppDelegate.m
//  Lesson15_HW
//
//  Created by A D on 12/28/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import "ADAppDelegate.h"
#import "ADStudent.h"

@implementation ADAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    /******************** LEVEL LEARNER **********************/
    
    NSMutableArray *students = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < 10; i++){
        
        ADStudent *student = [[ADStudent alloc] init];
        student.name = [NSString stringWithFormat:@"Student%d", i+1];
        
        //assign random set of subjects (decimal 1-31, binary 00001 - 11111)
        student.subject = arc4random()%30 + 1;
        
        [students addObject:student];
    }
    
    NSLog(@"\nStudents - %@", students);
    
 
    /******************** LEVEL STUDENT **********************/
    /*
    
    NSMutableArray *engineers = [[NSMutableArray alloc] init];
    NSMutableArray *botanists = [[NSMutableArray alloc] init];
    NSInteger automataCounter = 0;
    
    for (ADStudent *student in students){
        
        if(student.subject & ADStudentSubjectAutomata){
            automataCounter++;
        }
        
        if(student.subject & ADStudentSubjectBiology){
            [botanists addObject:student];
            NSLog(@"Student - %@, is botanists", student.name);
        }else{
            [engineers addObject:student];
            NSLog(@"Student - %@, is engineer", student.name);
        }
    }
    
    NSLog(@"\nBotanists: %@", botanists);
    NSLog(@"\nEngineers: %@", engineers);
    NSLog(@"The number of students learning automata is %d\n\n", automataCounter);
    
    */
    /******************** LEVEL MASTER **********************/
    
    
    for(ADStudent *student in students){
        
        if (student.subject & ADStudentSubjectBiology) {

            //do AND of the compliment of the bit to drop
            
            //reset the bit
            student.subject = student.subject & ~ADStudentSubjectBiology;
            
            NSLog(@"Student - %@ has dropped biology", student.name);
        }
    }
    NSLog(@"\nStudents - %@", students);

    

    
    /******************** LEVEL SUPERMAN **********************/
    

    for(int i = 0; i<5; i++){
    
        NSInteger decimalNumber = abs(arc4random());
        NSMutableString *binaryNumber = [NSMutableString string];
        
        for(int j = 0; j<sizeof(int)*8; j++){
            
            [binaryNumber insertString:decimalNumber & 1<<j? @"1" : @"0" atIndex:0];
        }
        
        NSLog(@"Decimal = %ld, binary = %@", (long)decimalNumber, binaryNumber);
    }
    
    
    
    
    
        /*
        for(int j = 0; j<sizeof(int); j++){
            
            //find max bit
            if( (1 << j) > decimalNumber){
                
                //generate the sting of necessary length and call the recurcive method
                binaryNumber = [NSMutableString stringWithFormat:@"%@",[@"" stringByPaddingToLength:j+1 withString:@"0" startingAtIndex:0]];
                NSLog(@"j = %d",j);
                
                binaryNumber = [self binaryFromInt:decimalNumber andPower:j-1 toBinary:binaryNumber];
                break;
            }
        }
        NSLog(@"Decimal %d is equal to binary %@", decimalNumber, binaryNumber);
    }
     
     */
    return YES;
}
/*
-(NSMutableString*) binaryFromInt:(NSInteger) decimal andPower:(NSInteger) power toBinary:(NSMutableString*) binaryNumber{
    
    if(power == -1){
        return binaryNumber;
    
    }else if(1<< power <= decimal){
        
        //change the bit to 1, substract the decimal value of the bit and recursively pass to the nect digit
        [binaryNumber replaceCharactersInRange:NSMakeRange([binaryNumber length] - (1 + power), 1) withString:@"1"];
        binaryNumber = [self binaryFromInt:decimal - (1<<power) andPower:power-1 toBinary:binaryNumber];
        return binaryNumber;
        
    }else // 1<<power > decimal
        
        //- don't substruct, don't change the bit, recursively pass to the next digit
        binaryNumber = [self binaryFromInt:decimal andPower:power-1 toBinary:binaryNumber];
        return binaryNumber;
}
*/

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
