//
//  RGBEXViewController.h
//  RGBColorSliderExample
//
//  Created by Shukti Azad on 6/11/15.
//  Copyright (c) 2015 Shukti Azad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGBEXViewController : UIViewController <NSStreamDelegate>


@property (nonatomic, retain) NSInputStream *inputStream;
@property (nonatomic, retain) NSOutputStream *outputStream;


@end
