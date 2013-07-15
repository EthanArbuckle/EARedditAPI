//
//  EARedditAPI.h
//  EARedditAPI
//
//  Created by Ethan Arbuckle on 7/13/13.
//  Copyright (c) 2013 Ethan Arbuckle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EARedditAPI : NSObject {
    NSString *userName;
    NSString *password;
    NSMutableDictionary *connectionData;
}

@property (retain) NSString *modHash;
@property (retain) NSString *cookieString;
@property (retain) NSString *authenticatedUser;
@property (retain) NSString *linkKarma;
@property (retain) NSString *commentKarma;
@property BOOL authenticated;
@property BOOL isMod;
@property BOOL hasGold;
@property BOOL isOver18;
@property BOOL hasVerifiedEmail;

- (id)initWithUsername:(NSString *)uname andPassword:(NSString *)psword;
- (void)login;
- (void)upvoteThing:(NSString *)thingid;
- (void)unvoteThing:(NSString *)thingid;
- (void)downvoteThing:(NSString *)thingid;
- (void)hidePostWithID:(NSString *)thingid;
- (void)unhidePostWithID:(NSString *)thingid;
- (void)savePostWithID:(NSString *)thingid;
- (void)unsavePostWithID:(NSString *)thingid;
- (void)addReplyText:(NSString *)text toThingID:(NSString *)thingid;
- (void)deleteReplyWithID:(NSString *)thingid;
- (void)editCommentWithID:(NSString *)thingid newText:(NSString *)text;
- (void)editPostTextWithID:(NSString *)thingid newText:(NSString *)text;
- (void)deletePostWithID:(NSString *)thingid;
- (void)reportThingWithThingID:(NSString *)thingid;
- (void)markNSFWWithThingID:(NSString *)thingid;
- (void)unmarkNSFWWithThingID:(NSString *)thingid;
- (void)sendPMTo:(NSString *)user withSubject:(NSString *)subject andMessage:(NSString *)text;
- (NSDictionary *)getPostsFromSubreddit:(NSString *)subreddit howMany:(int)count sortBy:(NSString *)sort afterID:(NSString *)after;
- (NSDictionary *)getAllMessagesAfterID:(NSString *)after howMany:(int)count;
- (NSDictionary *)getUnreadMessagesWithLimit:(int)count;
- (NSDictionary *)getSentMessagesAfterID:(NSString *)after howMany:(int)count;
- (void)loginResponse:(id)sender;
- (void)setUserInfo;
- (void)setUserInfoResponse:(id)sender;
- (NSURL *)constructURLWithEnding:(NSString *)ending;
- (void)doPostToURL:(NSURL *)urlstring withParams:(NSString *)params callBackTarget:(id)target callBackMethod:(NSString *)method;
- (void)doGetURL:(NSURL *)urlstring callBackTarget:(id)target callBackMethod:(NSString *)method;
- (NSDictionary *)getDictionaryForURL:(NSURL *)url withParams:(NSString *)params;
@end
