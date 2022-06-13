 SELECT steps.id, steps.date, steps.step_total, sleep.id, sleep.date, sleep.total_minutes_asleep
 FROM capstone_project.daily_steps AS steps
 INNER JOIN capstone_project.sleep_day AS sleep
 ON steps.id = sleep.id
 WHERE steps.date = sleep.date;