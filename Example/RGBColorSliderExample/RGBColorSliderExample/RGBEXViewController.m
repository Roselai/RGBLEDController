//
//  RGBEXViewController.m
//  RGBColorSliderExample
//
//  Created by Shukti Azad on 6/11/15.
//  Copyright (c) 2015 Shukti Azad. All rights reserved.
//

#import "RGBEXViewController.h"
#import "RGBColorSlider.h"
#import "RGBColorSliderDelegate.h"

@interface RGBEXViewController () <RGBColorSliderDataOutlet>
{
   // NSString *ip;
}

@property (nonatomic, strong) UIView *colorView;

@property (nonatomic, strong) RGBColorSliderDelegate *delegate;

@end

@implementation RGBEXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.colorView = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2 - 50), 50, 100, 100)];
    [self.view addSubview:self.colorView];
    
    self.delegate = [[RGBColorSliderDelegate alloc] init];
    self.delegate.delegate = self;
    
    RGBColorSlider *redSlider = [[RGBColorSlider alloc] initWithFrame:CGRectMake(20, 200, 280, 44) sliderColor:RGBColorTypeRed trackHeight:6 delegate:self.delegate];
    RGBColorSlider *greenSlider = [[RGBColorSlider alloc] initWithFrame:CGRectMake(20, 250, 280, 44) sliderColor:RGBColorTypeGreen trackHeight:6 delegate:self.delegate];
    RGBColorSlider *blueSlider = [[RGBColorSlider alloc] initWithFrame:CGRectMake(20, 300, 280, 44) sliderColor:RGBColorTypeBlue trackHeight:6 delegate:self.delegate];

    
    /*
    //ip address fields
    int x = 20;
    int y = 400;
    int w = 50;
    int h = 30;
    
    UILabel *ipDelim = [[UILabel alloc]initWithFrame:CGRectMake(x+w+1, y+5, 10, h)];
    ipDelim.font =[UIFont fontWithName:@"Helvetica-Bold" size:25];
    ipDelim.text = @".";
    ipDelim.textAlignment = NSTextAlignmentCenter;
    
    CGRect ipField1 = CGRectMake(x, y, w, h);
    UITextField *ipAddress1 = [[UITextField alloc] initWithFrame:ipField1];
    ipAddress1.textColor = [UIColor blackColor];
    ipAddress1.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    ipAddress1.backgroundColor=[UIColor whiteColor];
    ipAddress1.borderStyle = UITextBorderStyleLine;
    ipAddress1.keyboardType = UIKeyboardTypeNumberPad;
    
    CGRect ipField2 = CGRectMake(ipField1.origin.x+ipField1.size.width+10, y, w, h);
    UITextField *ipAddress2 = [[UITextField alloc] initWithFrame:ipField2];
    ipAddress2.textColor = [UIColor blackColor];
    ipAddress2.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    ipAddress2.backgroundColor=[UIColor whiteColor];
    ipAddress2.borderStyle = UITextBorderStyleLine;
    ipAddress2.keyboardType = UIKeyboardTypeNumberPad;
    
    CGRect ipField3 = CGRectMake(ipField2.origin.x+ipField2.size.width+10, y, w, h);
    UITextField *ipAddress3 = [[UITextField alloc] initWithFrame:ipField3];
    ipAddress3.textColor = [UIColor blackColor];
    ipAddress3.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    ipAddress3.backgroundColor=[UIColor whiteColor];
    ipAddress3.borderStyle = UITextBorderStyleLine;
    ipAddress2.keyboardType = UIKeyboardTypeNumberPad;

    
     
     
    [self.view addSubview:ipAddress1];
    [self.view addSubview:ipAddress2];
    [self.view addSubview:ipAddress3];
    [self.view addSubview:ipDelim];
    ipAddress1.delegate = self;
    ipAddress2.delegate = self;
    ipAddress3.delegate = self;
    */
   // [self initNetworkCommunication];


    
    
    /* Uncomment the following lines to include a slider for the alpha value.  Defaults to 1.0 */
    //    RGBColorSlider *alphaSlider = [[RGBColorSlider alloc] initWithFrame:CGRectMake(20, 320, 280, 44) sliderColor:RGBColorTypeAlpha trackHeight:6 delegate:self.delegate];
    //    [self.view addSubview:alphaSlider];
    
    
    [self.view addSubview:redSlider];
    [self.view addSubview:greenSlider];
    [self.view addSubview:blueSlider];

}

/*
-(UIButton *) submit{
    UIButton *submit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submit setTitle:@"Submit" forState:UIControlStateNormal];
    submit.frame = CGRectMake(80.0, self.view.frame.size.height -100, 160.0,100);
    [self.view addSubview:submit];
    return submit;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //[textField resignFirstResponder];
    if ([textField.text isEqualToString:@""] == NO) {
        NSLog(@"Submit");
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
 
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return newLength <= 3;
 
 
    // allow backspace
    if (!string.length)
    {
        return YES;
    }
    
    // Prevent invalid character input, if keyboard is numberpad
    if (textField.keyboardType == UIKeyboardTypeNumberPad)
    {
        if ([string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound)
        {
            // BasicAlert(@"", @"This field accepts only numeric entries.");
            return NO;
        }
    }
    
    // verify max length has not been exceeded
    NSString *updatedText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (updatedText.length > 3) // 4 was chosen for SSN verification
    {
        // suppress the max length message only when the user is typing
        // easy: pasted data has a length greater than 1; who copy/pastes one character?
        if (string.length > 1)
        {
            // BasicAlert(@"", @"This field accepts a maximum of 4 characters.");
        }
        
        return NO;
    }
    
    // only enable the OK/submit button if they have entered all numbers for the last four of their SSN (prevents early submissions/trips to authentication server)
    self.submit.enabled = (updatedText.length == 3);
    
    return YES;
}

*/

-(void)reconnect{
    [self initNetworkCommunication];
}

-(void)viewDidDisappear:(BOOL)animated{
    NSString *response  = [NSString stringWithFormat:@"0,0,0,"];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    //NSLog(@"%@",data);
    [_outputStream write:[data bytes] maxLength:[data length]];
     [_outputStream close];
}

- (void)updateColor:(UIColor *)color
{
    [self.colorView setBackgroundColor:color];
    
    int R = [self.delegate getRedColorComponent]*100;
    int G = [self.delegate getGreenColorComponent]*100;
    int B = [self.delegate getBlueColorComponent]*100;
    NSLog(@"R:%d, G:%d, B:%d",R,G,B);
    
    
    if ([_outputStream streamStatus] != NSStreamStatusOpen) {
       NSLog(@"reconnecting...", nil);
        [self initNetworkCommunication];
    }
    
        
    NSString *response  = [NSString stringWithFormat:@"%d,%d,%d,",R,G,B];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
   // NSLog(@"%@",data);
    [_outputStream write:[data bytes] maxLength:[data length]];
    
    
}

- (void)initNetworkCommunication {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    NSString *ip = @"192.168.0.21"; // home
    //NSString *ip = @"192.168.2.121"; // lab
    
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)ip, 8000, &readStream, &writeStream);
    _inputStream = (NSInputStream *)CFBridgingRelease(readStream);
    _outputStream = (NSOutputStream *)CFBridgingRelease(writeStream);
    
   // [_inputStream setDelegate:self];
    [_outputStream setDelegate:self];
    
   // [_inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [_outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    //[_inputStream open];
    [_outputStream open];
    
}

@end
