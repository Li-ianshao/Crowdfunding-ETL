-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT backers_count,
	   cf_id
FROM campaign
WHERE outcome = 'live'
ORDER BY cf_id DESC


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT(backer_id) AS backers_count,
	   cf_id
FROM backers
GROUP BY cf_id
ORDER BY cf_id DESC


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT first_name,last_name,email,goal - pledged AS "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts
JOIN campaign
ON campaign.contact_id = contacts.contact_id
WHERE outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC



-- Check the table


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT email,first_name,last_name,backers.cf_id,company_name,description,end_date,goal - pledged AS "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers
JOIN campaign
ON campaign.cf_id = backers.cf_id
WHERE outcome = 'live'
ORDER BY email DESC

-- Check the table

SELECT * FROM email_contacts_remaining_goal_amount
