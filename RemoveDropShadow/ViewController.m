//
//  ViewController.m
//  GettingStarted
//
//  Copyright 2014 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "ViewController.h"
#import "PersonDataObject.h"
#import "PersonDataSource.h"

@implementation ViewController
{
    ShinobiDataGrid* _shinobiDataGrid;
    NSArray* _data;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [ShinobiDataGrids setLicenseKey:@"your license key"]; // TODO: add your trial license key here!
    
    // create a grid - with a 40 pixel padding
    _shinobiDataGrid = [[ShinobiDataGrid alloc] initWithFrame:CGRectInset(self.view.bounds, 40,40)];
    
    
    // add to the view
    [self.view addSubview:_shinobiDataGrid];
    
    // add a name column
    SDataGridColumn* nameColumn = [[SDataGridColumn alloc] initWithTitle:@"Name"];
    nameColumn.width = @484;
    [_shinobiDataGrid addColumn:nameColumn];
    
    // add an age column
    SDataGridColumn* ageColumn = [[SDataGridColumn alloc] initWithTitle:@"Age"];
    ageColumn.width = @200;
    [_shinobiDataGrid addColumn:ageColumn];
    
    // create some data to populate the grid
    _data = [PersonDataSource generatePeople:50];
    
    // set the data-source, this is the class responsible for supplying data to the grid.
    _shinobiDataGrid.dataSource = self;
}

#pragma mark - ShinobiDataGridDataSource methods

-(NSUInteger)shinobiDataGrid:(ShinobiDataGrid *)grid numberOfRowsInSection:(NSInteger)sectionIndex
{
    return _data.count;
}

- (void)shinobiDataGrid:(ShinobiDataGrid *)grid prepareCellForDisplay:(SDataGridCell *)cell
{
    // both columns use a SDataGridTextCell, so we are safe to perform this cast
    SDataGridTextCell* textCell = (SDataGridTextCell*)cell;
    
    // locate the perspon that is rendered on this row
    PersonDataObject* person = _data[cell.coordinate.row.rowIndex];
    
    // determine which column this cell belongs to
    if ([cell.coordinate.column.title isEqualToString:@"Name"])
    {
        // render the name in the 'name' column
        textCell.textField.text = person.forename;
    }
    if ([cell.coordinate.column.title isEqualToString:@"Age"])
    {
        // render the age in the 'age' column
        textCell.textField.text = [person.age stringValue];
    }
}

#pragma mark - UIViewController methods
// < iOS6
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    if (interfaceOrientation==UIInterfaceOrientationPortrait ) {
        return YES;
    } else {
        return NO;
    }
}

// >= iOS6
- (BOOL)shouldAutorotate {
    return NO;
}

@end
