CREATE INDEX indsalary ON employee(salary);
--We create an index on salary, it is useful, because when we do the range search and equality search on salary,
--it will execute much faster than when we don't have index on salary. In application, we use the query to find
--employee whose salary are below a certain number, and employee whose salary are between 2 certain numbers
--These two query can execute much faster than when we don't have index on salary.

CREATE INDEX inddate ON review(date);
--This index will be helpful when we do range and equality sereach on date of review.
--In application, we want to manage the reviews and select all the reviews between 2 specific dates,
--then query will execute quicker with index on date.
