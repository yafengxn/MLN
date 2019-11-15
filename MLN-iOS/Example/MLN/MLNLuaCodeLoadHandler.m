//
//  MLNLuaCodeLoadHandler.m
//  MLN_Example
//
//  Created by Feng on 2019/11/15.
//  Copyright © 2019 liu.xu_1586. All rights reserved.
//

#import "MLNLuaCodeLoadHandler.h"
#import "MLNGalleryNative.h"

@implementation MLNLuaCodeLoadHandler

+ (NSString *)luaCodeDirectory
{
    if (kTestWithBinaryLuaCode) {
        return [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"/gallery_binary"];
    } else {
        return [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"/gallery_source"];
    }
    return nil;
}

@end
