//
//  ICDColorMacros.h
//  rank
//
//  Created by wenky on 16/1/19.
//  Copyright © 2016年 wenky. All rights reserved.
//

#ifndef ICDColorMacros_h
#define ICDColorMacros_h

#ifndef UIColorFromRGB
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((CGFloat)(rgbValue & 0x0000FF))/255.0 \
alpha:1.0]
#endif

#ifndef UIColorFromRGBA
#define UIColorFromRGBA(rgbValue, alphaValue) \
[UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((CGFloat)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]
#endif

#ifndef RGBCOLOR
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:((CGFloat)((r)/255.0)) green:((CGFloat)((g)/255.0)) blue:((CGFloat)((b)/255.0)) alpha:((CGFloat)(1))]
#endif

#ifndef RGBACOLOR
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:((CGFloat)((r)/255.0)) green:((CGFloat)((g)/255.0)) blue:((CGFloat)((b)/255.0)) alpha:((CGFloat)((a)))]
#endif

#endif /* ICDColorMacros_h */
