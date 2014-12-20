//
//  ADStudent.m
//  Lesson15_HW
//
//  Created by A D on 12/28/13.
//  Copyright (c) 2013 AD. All rights reserved.
//

#import "ADStudent.h"


@implementation ADStudent

@synthesize subject = _subject;
@synthesize name = _name;


-(NSString *) answerByType:(ADStudentSubject) type{
    return self.subject & type ? @"Yes" : @"No";
}


-(NSString *) description{
    
    return [NSString stringWithFormat:@"student - %@ studies: "
            "biology - %@, math - %@, physics - %@, english - %@, automata - %@",
            self.name,
            [self answerByType:ADStudentSubjectBiology],
            [self answerByType:ADStudentSubjectMath],
            [self answerByType:ADStudentSubjectPhysics],
            [self answerByType:ADStudentSubjectEnglish],
            [self answerByType:ADStudentSubjectAutomata]];
    
}

@end
