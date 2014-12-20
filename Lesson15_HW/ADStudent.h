//
//  ADStudent.h
//  Lesson15_HW
//
//  Created by A D on 12/28/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import <Foundation/Foundation.h>

    typedef enum{
        
        ADStudentSubjectBiology  = 1 << 0,
        ADStudentSubjectMath     = 1 << 1,
        ADStudentSubjectPhysics  = 1 << 2,
        ADStudentSubjectEnglish  = 1 << 3,
        ADStudentSubjectAutomata = 1 << 4
        
    } ADStudentSubject;


@interface ADStudent : NSObject

@property (assign, nonatomic) ADStudentSubject subject;
@property (strong, nonatomic) NSString *name;

@end
