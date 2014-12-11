//
//  Friend.h
//  HelloCoreData
//
//  Created by Liu Kent on 2011/3/17.
//  Copyright (c) 2011年 SoftArt Laboratory. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Friend : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * FirstName;
@property (nonatomic, retain) NSString * LastName;
@property (nonatomic, retain) NSString * Telephone;
@property (nonatomic, retain) NSDate * addTimeStamp;

@end
