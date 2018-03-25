//
//  ViewController.h
//  CameraApp
//
//  Created by 이상협 on 2018. 3. 25..
//  Copyright © 2018년 이상협. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImageStillCamera.h"

@interface ViewController : UIViewController

-(void)initCamera{
    
    // 카메라 생성 및 세팅
    m_stillCamera = [[GPUImageStillCamera alloc] init];
    m_stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    
    // 필터 생성 및 카메라에 필터 추가
    m_cropFilter = [[GPUImageCropFilter alloc] initWithCropRegion:CGRectMake( 0.f, 0.125f, 1.0f, 0.75f)];
    [m_stillCamera addTarget:m_cropFilter];
    
    // 카메라 뷰에 필터 추가
    [m_cropFilter addTarget:m_caremaView];
    
    // view 크기에 맞게 꽉차게
    m_caremaView.fillMode = kGPUImageFillModePreserveAspectRatioAndFill;
    
    // 카메라 캡쳐 시작
    [m_stillCamera startCameraCapture];
    
    
}

@end

