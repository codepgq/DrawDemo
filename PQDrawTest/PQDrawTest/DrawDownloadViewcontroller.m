//
//  DrawDownloadViewcontroller.m
//  PQDrawTest
//
//  Created by ios on 16/8/13.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "DrawDownloadViewcontroller.h"
#import "DrawDownloadView.h"
@interface DrawDownloadViewcontroller ()
@property (weak, nonatomic) IBOutlet DrawDownloadView *downloadView;

@end

@implementation DrawDownloadViewcontroller

+ (instancetype)loadForStoryboard{
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:@"download"];
}

- (IBAction)sender:(UISlider *)sender {
    _downloadView.progress = sender.value;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
