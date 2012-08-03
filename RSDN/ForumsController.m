//
//  ForumsController.m
//  RSDN
//
//  Created by Kishik Igor on 24.07.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "ForumsController.h"

@interface ForumsController ()

@end

@implementation ForumsController


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    // Configure the cell...
    
    return cell;

}

@end
