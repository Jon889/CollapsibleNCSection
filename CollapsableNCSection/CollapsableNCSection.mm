#line 1 "/Users/Jonathan/Desktop/CollapsableNCSection/CollapsableNCSection/CollapsableNCSection.xm"





#import "JBPCollapsableNCController.h"
#import <UIKit/UIKit.h>
#import <SpringBoard/SBBulletinHeaderView.h>
#import <SpringBoard/SBBulletinListController.h>
#import <SpringBoard/SBBulletinListSection.h>

#include <substrate.h>
@class SBBulletinHeaderView; @class SBBulletinListController; 
static void (*_logos_orig$_ungrouped$SBBulletinHeaderView$touchesBegan$withEvent$)(SBBulletinHeaderView*, SEL, NSSet *, UIEvent *); static void _logos_method$_ungrouped$SBBulletinHeaderView$touchesBegan$withEvent$(SBBulletinHeaderView*, SEL, NSSet *, UIEvent *); static id (*_logos_orig$_ungrouped$SBBulletinHeaderView$_sectionNameForSectionID$)(SBBulletinHeaderView*, SEL, id); static id _logos_method$_ungrouped$SBBulletinHeaderView$_sectionNameForSectionID$(SBBulletinHeaderView*, SEL, id); static int (*_logos_orig$_ungrouped$SBBulletinListController$tableView$numberOfRowsInSection$)(SBBulletinListController*, SEL, id, int); static int _logos_method$_ungrouped$SBBulletinListController$tableView$numberOfRowsInSection$(SBBulletinListController*, SEL, id, int); 
static Class _logos_static_class$SBBulletinListController; 
#line 12 "/Users/Jonathan/Desktop/CollapsableNCSection/CollapsableNCSection/CollapsableNCSection.xm"
 

static void _logos_method$_ungrouped$SBBulletinHeaderView$touchesBegan$withEvent$(SBBulletinHeaderView* self, SEL _cmd, NSSet * touches, UIEvent * event) {
    NSMutableArray *cSIDs = [[JBPCollapsableNCController sharedInstance] collapsedSIDs];
    if ([cSIDs containsObject:[self sectionID]]) {
        [cSIDs removeObject:[self sectionID]];
    } else {
        [cSIDs addObject:[self sectionID]];
    }
    [(SBBulletinListController *)[_logos_static_class$SBBulletinListController sharedInstance] _reloadTableView];
    NSString *newStr = [self _sectionNameForSectionID:[self sectionID]];
    UILabel *&_sectionLabel(MSHookIvar<UILabel *>(self, "_sectionLabel"));
    [_sectionLabel setText:newStr];
}

static id _logos_method$_ungrouped$SBBulletinHeaderView$_sectionNameForSectionID$(SBBulletinHeaderView* self, SEL _cmd, id arg1) {
    if ([[[JBPCollapsableNCController sharedInstance] collapsedSIDs] containsObject:[self sectionID]]) {
        NSDictionary *&_enabledSectionsByID(MSHookIvar<NSDictionary *>([_logos_static_class$SBBulletinListController sharedInstance], "_enabledSectionsByID"));
        return [NSString stringWithFormat:@"%@ (%i)", _logos_orig$_ungrouped$SBBulletinHeaderView$_sectionNameForSectionID$(self, _cmd, arg1), [(SBBulletinListSection *)[_enabledSectionsByID objectForKey:[self sectionID]] bulletinCount]];
    } else {
        return _logos_orig$_ungrouped$SBBulletinHeaderView$_sectionNameForSectionID$(self, _cmd, arg1);
    }
}



 

static int _logos_method$_ungrouped$SBBulletinListController$tableView$numberOfRowsInSection$(SBBulletinListController* self, SEL _cmd, id arg1, int arg2) {
    NSArray *csids = [[JBPCollapsableNCController sharedInstance] collapsedSIDs];
    NSArray *&_visibleSectionIDs(MSHookIvar<NSArray *>(self, "_visibleSectionIDs"));
    NSString *currentSID = [_visibleSectionIDs objectAtIndex:arg2];
    if ([csids containsObject:currentSID]) {
        return 0;
    }
    return _logos_orig$_ungrouped$SBBulletinListController$tableView$numberOfRowsInSection$(self, _cmd, arg1, arg2);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBBulletinHeaderView = objc_getClass("SBBulletinHeaderView"); MSHookMessageEx(_logos_class$_ungrouped$SBBulletinHeaderView, @selector(touchesBegan:withEvent:), (IMP)&_logos_method$_ungrouped$SBBulletinHeaderView$touchesBegan$withEvent$, (IMP*)&_logos_orig$_ungrouped$SBBulletinHeaderView$touchesBegan$withEvent$);MSHookMessageEx(_logos_class$_ungrouped$SBBulletinHeaderView, @selector(_sectionNameForSectionID:), (IMP)&_logos_method$_ungrouped$SBBulletinHeaderView$_sectionNameForSectionID$, (IMP*)&_logos_orig$_ungrouped$SBBulletinHeaderView$_sectionNameForSectionID$);Class _logos_class$_ungrouped$SBBulletinListController = objc_getClass("SBBulletinListController"); MSHookMessageEx(_logos_class$_ungrouped$SBBulletinListController, @selector(tableView:numberOfRowsInSection:), (IMP)&_logos_method$_ungrouped$SBBulletinListController$tableView$numberOfRowsInSection$, (IMP*)&_logos_orig$_ungrouped$SBBulletinListController$tableView$numberOfRowsInSection$);} {_logos_static_class$SBBulletinListController = objc_getClass("SBBulletinListController"); } }
#line 51 "/Users/Jonathan/Desktop/CollapsableNCSection/CollapsableNCSection/CollapsableNCSection.xm"
