//
//  STButton.h
//  STKitDemo
//
//  Created by ST on 15/11/15.
//  Copyright © 2015年 st. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface STButton : UIButton

/**
 *  Create an UIButton with a fade animation from image to highlightedImage on touch
 *
 *  @param frame            Button's frame
 *  @param image            Button's image
 *  @param highlightedImage Button's highlighted image
 *  @param fadeDuration     Fade duration
 *
 *  @return Returns the created STButton, subclass of UIButton
 */

- (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 image:(UIImage * _Nonnull)image
                      highlightedImage:(UIImage * _Nonnull)highlightedImage
                          fadeDuration:(CGFloat)fadeDuration;

@end
