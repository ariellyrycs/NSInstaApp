//
//  instaDataModel.h
//  
//
//  Created by Ariel Robles on 2/10/15.
//
//

#import <Foundation/Foundation.h>

@interface InstaDataModel : NSObject
@property id responseObject;
- (void)getInstaInfo:(NSString *)phoneType withSuccessBlock:(void(^)(id))success andFailureBlock:(void(^)(NSError *))failure;
-(NSMutableArray *) formating:(id)instagramData;
@end
