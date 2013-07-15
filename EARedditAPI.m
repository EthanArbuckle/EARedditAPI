//
//  EARedditAPI.m
//  EARedditAPI
//
//  Created by Ethan Arbuckle on 7/13/13.
//  Copyright (c) 2013 Ethan Arbuckle. All rights reserved.
//

#import "EARedditAPI.h"

@implementation EARedditAPI

@synthesize modHash;
@synthesize cookieString;
@synthesize authenticatedUser;
@synthesize linkKarma;
@synthesize commentKarma;
@synthesize authenticated;
@synthesize isMod;
@synthesize hasGold;
@synthesize isOver18;
@synthesize hasVerifiedEmail;

- (id)initWithUsername:(NSString *)uname andPassword:(NSString *)psword {
    self = [self init];
    connectionData = [[NSMutableDictionary alloc] init];
    userName = uname;
    password = psword;
    authenticated = NO;
    isMod = NO;
    hasGold = NO;
    isOver18 = NO;
    hasVerifiedEmail = NO;
    return self;
}

- (void)login {
    NSURL *url = [self constructURLWithEnding:[NSString stringWithFormat:@"login/%@", userName]];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&user=%@&passwd=%@", userName, password];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:@"loginResponse:"];
}

- (void)upvoteThing:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"vote"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&dir=1&id=%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)unvoteThing:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"vote"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&dir=0&id=%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)downvoteThing:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"vote"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&dir=-1&id=%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)hidePostWithID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"hide"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&executed=hidden&id=t3_%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)unhidePostWithID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"unhide"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&executed=hidden&id=t3_%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)savePostWithID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"save"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&executed=saved&id=t3_%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)unsavePostWithID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"unsave"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&executed=saved&id=t3_%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)addReplyText:(NSString *)text toThingID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"comment"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&text=%@&thing_id=%@&uh=%@", text, thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)deleteReplyWithID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"del"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&id=t1_%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)editCommentWithID:(NSString *)thingid newText:(NSString *)text {
    NSURL *url = [self constructURLWithEnding:@"editusertext"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&text=%@&thing_id=t1_%@&uh=%@", text, thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)editPostTextWithID:(NSString *)thingid newText:(NSString *)text {
    NSURL *url = [self constructURLWithEnding:@"editusertext"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&text=%@&thing_id=t3_%@&uh=%@", text, thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)deletePostWithID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"del"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&id=t3_%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)reportThingWithThingID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"report"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&thing_id=%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)markNSFWWithThingID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"marknsfw"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&thing_id=%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)unmarkNSFWWithThingID:(NSString *)thingid {
    NSURL *url = [self constructURLWithEnding:@"unmarknsfw"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&thing_id=%@&uh=%@", thingid, modHash];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (void)sendPMTo:(NSString *)user withSubject:(NSString *)subject andMessage:(NSString *)text {
    NSURL *url = [self constructURLWithEnding:@"compose"];
    NSString *params = [[NSString alloc] initWithFormat:@"api_type=json&to=%@&uh=%@&subject=%@&text=%@", user, modHash, subject, text];
    [self doPostToURL:url withParams:params callBackTarget:self callBackMethod:nil];
}

- (NSDictionary *)getPostsFromSubreddit:(NSString *)subreddit howMany:(int)count sortBy:(NSString *)sort afterID:(NSString *)after {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.reddit.com/r/%@/%@.json", subreddit, sort]];
    NSString *params = [NSString stringWithFormat:@"api_type=json&limit=%d&after=%@", count, after];
    return [self getDictionaryForURL:url withParams:params];
}

- (NSDictionary *)getAllMessagesAfterID:(NSString *)after howMany:(int)count {
    NSURL *url = [NSURL URLWithString:@"http://www.reddit.com/message/inbox/.json"];
    NSString *params = [NSString stringWithFormat:@"api_type=json&limit=%d&after=%@", count, after];
    return [self getDictionaryForURL:url withParams:params];
}

- (NSDictionary *)getUnreadMessagesWithLimit:(int)count {
    NSURL *url = [NSURL URLWithString:@"http://www.reddit.com/message/unread/.json"];
    NSString *params = [NSString stringWithFormat:@"api_type=json&limit=%d", count];
    return [self getDictionaryForURL:url withParams:params];
}

- (NSDictionary *)getSentMessagesAfterID:(NSString *)after howMany:(int)count {
    NSURL *url = [NSURL URLWithString:@"http://www.reddit.com/message/sent/.json"];
    NSString *params = [NSString stringWithFormat:@"api_type=json&limit=%d&after=%@", count, after];
    return [self getDictionaryForURL:url withParams:params];
}

- (void)loginResponse:(id)sender {
    NSData *data = (NSData *)sender;
    NSDictionary *response = [[NSJSONSerialization JSONObjectWithData:data options:0 error:nil] objectForKey:@"json"];
    if ([[response objectForKey:@"data"] objectForKey:@"modhash"]) {
        NSDictionary *loginResult = [response objectForKey:@"data"];
        modHash = (NSString *)[[loginResult valueForKey:@"modhash"] copy];
        cookieString = (NSString *)[[loginResult valueForKey:@"cookie"] copy];
        authenticated = YES;
        [self setUserInfo];
    } else {
        modHash = @"";
        cookieString = @"";
        authenticated = NO;
        NSLog(@"Login Failed");
    }
}

- (void)setUserInfo {
    if (authenticated) {
        NSURL *url = [self constructURLWithEnding:@"me.json"];
        [self doGetURL:url callBackTarget:self callBackMethod:@"setUserInfoResponse:"];
    }
}

- (void)setUserInfoResponse:(id)sender {
    NSData *data = (NSData *)sender;
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    authenticatedUser = [[response objectForKey:@"data"] objectForKey:@"name"];
    linkKarma = [[response objectForKey:@"data"] objectForKey:@"link_karma"];
    commentKarma = [[response objectForKey:@"data"] objectForKey:@"comment_karma"];
    if ([[[response objectForKey:@"data"] objectForKey:@"is_mod"] boolValue]) {
        isMod = YES;
    }
    if ([[[response objectForKey:@"data"] objectForKey:@"is_gold"] boolValue]) {
        hasGold = YES;
    }
    if ([[[response objectForKey:@"data"] objectForKey:@"over_18"] boolValue]) {
        isOver18 = YES;
    }
    if ([[[response objectForKey:@"data"] objectForKey:@"has_verified_email"] boolValue]) {
        hasVerifiedEmail = YES;
    }
}

- (NSURL *)constructURLWithEnding:(NSString *)ending {
    NSString *base = @"http://www.reddit.com/api/";
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", base, ending]];
}

- (void)doPostToURL:(NSURL *)urlstring withParams:(NSString *)params callBackTarget:(id)target callBackMethod:(NSString *)method {
    NSData *postData = [params dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:urlstring];
    if (cookieString && [cookieString length] > 0) {
        NSDictionary *properties = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"http://www.reddit.com", NSHTTPCookieDomain,
                                    @"/", NSHTTPCookiePath,
                                    @"reddit_session", NSHTTPCookieName,
                                    cookieString, NSHTTPCookieValue,
                                    nil];
        NSHTTPCookie *http_cookie = [NSHTTPCookie cookieWithProperties:properties];
        NSArray *cookies = [NSArray arrayWithObjects:http_cookie, nil];
        NSDictionary *headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        [request setAllHTTPHeaderFields:headers];
    }
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    NSString *connectionKey = [NSString stringWithFormat:@"%ld", ((intptr_t)connection)];
    NSMutableDictionary *dl = [[NSMutableDictionary alloc] init];
    [dl setValue:connectionKey forKey:@"connectionKey"];
    [dl setValue:target forKey:@"afterCompleteTarget"];
    [dl setValue:method forKey:@"afterCompleteAction"];
    [connectionData setValue:dl forKey:connectionKey];
}

- (void)doGetURL:(NSURL *)urlstring callBackTarget:(id)target callBackMethod:(NSString *)method {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:urlstring];
    if (cookieString && [cookieString length] > 0) {
        NSDictionary *properties = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @".reddit.com", NSHTTPCookieDomain,
                                    @"/", NSHTTPCookiePath,
                                    @"reddit_session", NSHTTPCookieName,
                                    cookieString, NSHTTPCookieValue,
                                    nil];
        NSHTTPCookie *http_cookie = [NSHTTPCookie cookieWithProperties:properties];
        NSArray *cookies = [NSArray arrayWithObjects:http_cookie, nil];
        NSDictionary *headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        [request setAllHTTPHeaderFields:headers];
    }
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    NSString *connectionKey = [NSString stringWithFormat:@"%ld", ((intptr_t)connection)];
    NSMutableDictionary *dl = [[NSMutableDictionary alloc] init];
    [dl setValue:connectionKey forKey:@"connectionKey"];
    if (target && method) {
        [dl setValue:target forKey:@"afterCompleteTarget"];
        [dl setValue:method forKey:@"afterCompleteAction"];
    }
    [connectionData setValue:dl forKey:connectionKey];
}

- (NSDictionary *)getDictionaryForURL:(NSURL *)purl withParams:(NSString *)params {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?%@", purl, params]];
    NSLog(@"%@", url);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageNotAllowed timeoutInterval:60.0];
    [request setHTTPMethod:@"GET"];
    if (cookieString && [cookieString length] > 0) {
        NSDictionary *properties = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @".reddit.com", NSHTTPCookieDomain,
                                    @"/", NSHTTPCookiePath,
                                    @"reddit_session", NSHTTPCookieName,
                                    cookieString, NSHTTPCookieValue,
                                    nil];
        NSHTTPCookie *http_cookie = [NSHTTPCookie cookieWithProperties:properties];
        NSArray *cookies = [NSArray arrayWithObjects:http_cookie, nil];
        NSDictionary *headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
        [request setAllHTTPHeaderFields:headers];
    }
    NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:result options:0 error:nil];
    return dict;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSString *connectionKey = [NSString stringWithFormat:@"%ld", ((intptr_t)connection)];
    NSMutableDictionary *dl = [connectionData objectForKey:connectionKey];
    NSMutableData *data = [[NSMutableData alloc] init];
    [dl setObject:data forKey:@"data"];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString *connectionKey = [NSString stringWithFormat:@"%ld", ((intptr_t)connection)];
    NSMutableDictionary *dl = [connectionData objectForKey:connectionKey];
    NSMutableData *oldData = (NSMutableData *)[dl objectForKey:@"data"];
    [oldData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Error");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *connectionKey = [NSString stringWithFormat:@"%ld", ((intptr_t)connection)];
    NSMutableDictionary *dl = [connectionData objectForKey:connectionKey];
    if ([dl objectForKey:@"afterCompleteAction"]) {
        SEL action = NSSelectorFromString([dl valueForKey:@"afterCompleteAction"]);
        [[dl objectForKey:@"afterCompleteTarget"] performSelector:action withObject:[dl objectForKey:@"data"]];
    }
   // NSLog(@"%@", [[NSString alloc] initWithData:[dl objectForKey:@"data"] encoding:NSUTF8StringEncoding]);
    [connectionData removeObjectForKey:connectionKey];
}

@end
