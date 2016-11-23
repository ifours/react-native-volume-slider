#import "VolumeSlider.h"

@implementation VolumeSlider

- (id)init {
  if (self = [super init]) {
    for (id current in self.subviews) {
      if ([current isKindOfClass:[UISlider class]]) {
        _slider = (UISlider *) current;
        [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
      }
        
      if([current isKindOfClass:[UIButton class] ]) {
        _thumb = (UIButton *) current;
      }
    }
      
    _thumbTintColor = [UIColor whiteColor];
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
  [self setTintColor:color];
  [self setThumb];
}

- (void)setThumbImage:(UIImage *)thumbImage {
  _thumbImage = thumbImage;
  [self setThumb];
}

- (void)setThumb {
  static UIImage *thumb = nil;

  if (_thumbWidth > 0.0f && _thumbWidth > 0.0f) {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(_thumbWidth, _thumbWidth), NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);

    CGRect rect = CGRectMake(0, 0, _thumbWidth, _thumbHeight);
    CGContextSetFillColorWithColor(ctx, _thumbTintColor.CGColor);
    CGContextFillEllipseInRect(ctx, rect);

    if ([_thumbImage CGImage] != nil || [_thumbImage CIImage] != nil) {
      [_thumbImage drawInRect:rect];
    }

    CGContextRestoreGState(ctx);

    thumb = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  
  // default tintColor for the route button
  [self setRouteButtonImage:[_thumb.currentImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
  
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
