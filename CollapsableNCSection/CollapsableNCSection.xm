
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos


#import "JBPCollapsableNCController.h"
#import <UIKit/UIKit.h>
#import <SpringBoard/SBBulletinHeaderView.h>
#import <SpringBoard/SBBulletinListController.h>
#import <SpringBoard/SBBulletinListSection.h>

%hook SBBulletinHeaderView 

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSMutableArray *cSIDs = [[JBPCollapsableNCController sharedInstance] collapsedSIDs];
    if ([cSIDs containsObject:[self sectionID]]) {
        [cSIDs removeObject:[self sectionID]];
    } else {
        [cSIDs addObject:[self sectionID]];
    }
    [(SBBulletinListController *)[%c(SBBulletinListController) sharedInstance] _reloadTableView];
    NSString *newStr = [self _sectionNameForSectionID:[self sectionID]];
    UILabel *&_sectionLabel(MSHookIvar<UILabel *>(self, "_sectionLabel"));
    [_sectionLabel setText:newStr];
}

- (id)_sectionNameForSectionID:(id)arg1 {
    if ([[[JBPCollapsableNCController sharedInstance] collapsedSIDs] containsObject:[self sectionID]]) {
        NSDictionary *&_enabledSectionsByID(MSHookIvar<NSDictionary *>([%c(SBBulletinListController) sharedInstance], "_enabledSectionsByID"));
        return [NSString stringWithFormat:@"%@ (%i)", %orig, [(SBBulletinListSection *)[_enabledSectionsByID objectForKey:[self sectionID]] bulletinCount]];
    } else {
        return %orig;
    }
}

%end

%hook SBBulletinListController 

- (int)tableView:(id)arg1 numberOfRowsInSection:(int)arg2 {
    NSArray *csids = [[JBPCollapsableNCController sharedInstance] collapsedSIDs];
    NSArray *&_visibleSectionIDs(MSHookIvar<NSArray *>(self, "_visibleSectionIDs"));
    NSString *currentSID = [_visibleSectionIDs objectAtIndex:arg2];
    if ([csids containsObject:currentSID]) {
        return 0;
    }
    return %orig;
}

%end