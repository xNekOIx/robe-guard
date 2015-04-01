//
//  RBGTagsStorage.m
//  Robe Guard
//
//  Created by Kostya Bychkov on 4/1/15.
//  Copyright (c) 2015 DAloG ltd. All rights reserved.
//

#import "RBGTagsStorage.h"
#import "NSObject+RBGUpdateState.h"
#import "RBGTag.h"


@interface RBGTagsStorage ()

@property NSMutableSet* tags;

@end

@implementation RBGTagsStorage

- (instancetype)init
{
    self = [super init];
    
    if (self == nil) return nil;
    
    _tags = [NSMutableSet new];
    
    return self;
}

- (void)addTag:(RBGTag*)tag
{
    NSParameterAssert(tag != nil);
    NSAssert(![self.tags containsObject:tag],
             @"Tag you are trying to add has already been added to storage. Tag: %@", tag);
    
    [self.tags addObject:tag];
}

- (void)removeTag:(RBGTag*)tag
{
    NSParameterAssert(tag != nil);
    NSAssert([self.tags containsObject:tag],
             @"Tag you are trying to remove is not in the storage. Tag: %@", tag);
    
    [self.tags removeObject:tag];
}

- (NSArray*)allTags
{
    return self.tags.allObjects;
}

@end