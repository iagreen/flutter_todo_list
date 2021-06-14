# Flutter Todo List (with Supabase)

Sample App using Flutter and [Supabase](https://app.supabase.io/).  
Works with to do examples given in the Supabase repo [examples](https://github.com/supabase/supabase/tree/master/examples).  

## Create and configure supabase project
1. Create new project
   Sign up to Supabase - https://app.supabase.io and create a new project. Wait for your database to start.
2. Run "Todo List" Quickstart
   Once your database has started, run the "Todo List" quickstart. Inside of your project, enter the SQL editor tab and scroll down until you see TODO LIST: Build a basic todo list with Row Level Security.
3. Get the URL and Key
   Go to the Project Settings (the cog icon), open the API tab, and find your API URL and anon key, you'll need these in the next step.
4. Copy `lib/config-example.dart` to `lib/config.dart`, add the values for `supabaseUrl` and `supabaseUrl` from Step 3.

## Real-time updates

For realtime updates to work, enable them in your project by going to Database->Replication.  
1. Make sure insert, update, and delete are on.  
2. Click under "source", and make sure the `todos` table is enabled.  

