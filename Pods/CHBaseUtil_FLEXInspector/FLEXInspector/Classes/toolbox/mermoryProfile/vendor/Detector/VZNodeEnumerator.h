/**
 * Copyright (c) 2016-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Foundation/Foundation.h>

@class VZObjectiveCGraphElement;

/**
 VZNodeEnumerator wraps any object graph element (VZObjectiveCGraphElement) and lets you enumerate over its
 retained references
 */
@interface VZNodeEnumerator : NSEnumerator

/**
 Designated initializer
 */
- (nonnull instancetype)initWithObject:(nonnull VZObjectiveCGraphElement *)object;

- (nullable VZNodeEnumerator *)nextObject;

@property (nonatomic, strong, readonly, nonnull) VZObjectiveCGraphElement *object;

@end
