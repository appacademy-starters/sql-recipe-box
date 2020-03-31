--- If a database named 'recipe_box' exists, then drop it.
--- If a user exists named 'recipe_box_app', then drop it.

DROP DATABASE IF EXISTS recipe_box;
DROP USER IF EXISTS recipe_box_app;

-- You will need to create a new user for the application named
-- 'recipe_box_app'. It will need a password set to 'SPuaQ3no'. Best not to make
-- it a super user.

-- YOUR CODE HERE




-- You will need to create a new database for the application named
-- 'recipe_box'. It should be owned by 'recipe_box_app'. You may want to revoke
-- connect privileges from PUBLIC just to have good security.

-- YOUR CODE HERE
