#import "VolumeSlider.h"

@implementation VolumeSlider

- (id)init {
  if (self = [super init]) {
    for (id current in self.subviews) {
      if ([current isKindOfClass:[UISlider class]]) {
        _slider = (UISlider *) current;
        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
      }
    }
  }
  return self;
}

- (void)setMaximumTrackTintColor:(UIColor*) color {
  [_slider setMaximumTrackTintColor: color];
}

- (void)setMinimumTrackTintColor:(UIColor*) color {
  [_slider setMinimumTrackTintColor: color];
}

- (void)setThumbTintColor:(UIColor*) color {
  _thumbTintColor = color;
  [self setThumbImage:color];
}

- (void)setThumbWidth:(float) width {
  _thumbWidth = width;
  [self setThumbImage:_thumbTintColor];
}

- (void)setThumbHeight:(float) height {
  _thumbHeight = height;
  [self setThumbImage:_thumbTintColor];
}

- (void)setThumbImage:(UIColor*) thumbColor {
  static UIImage *thumb = nil;

  if (_thumbWidth > 0.0f && _thumbWidth > 0.0f) {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(_thumbWidth, _thumbWidth), NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGRect rect = CGRectMake(0, 0, _thumbWidth, _thumbHeight);
    CGContextSetFillColorWithColor(ctx, thumbColor.CGColor);
    CGContextFillEllipseInRect(ctx, rect);
    
    CGContextRestoreGState(ctx);
    thumb = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  [_slider setThumbImage:thumb forState:UIControlStateNormal];
}

- (void)sliderValueChanged:(UISlider *)sender {
  float value = sender.value;
  if (self.onValueChange) {
    self.onValueChange(@{
      @"value": @(value),
    });
  }
}

@end