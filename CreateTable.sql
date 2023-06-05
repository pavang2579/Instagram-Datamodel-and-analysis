CREATE TABLE Users (
	user_id SERIAL PRIMARY KEY,
	name varchar(50) NOT NULL,
	email varchar(50) UNIQUE NOT NULL,
	phone_number varchar(20) unique
);

CREATE TABLE Posts (
	post_id SERIAL PRIMARY KEY,
	user_id INTEGER NOT NULL,
	caption TEXT,
	image_url varchar(200),
	created_id TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
	like_id SERIAL PRIMARY KEY,
	post_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	created_id TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (post_id) REFERENCES Posts(post_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Followers (
	follower_id SERIAL PRIMARY KEY,
	user_id INTEGER NOT NULL,
	follower_user_id INTEGER NOT NULL,
	created_id TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES Users(user_id),
	FOREIGN KEY (follower_user_id) REFERENCES Users(user_id)
);

CREATE TABLE comments (
	comment_id SERIAL PRIMARY KEY,
	post_id INTEGER NOT NULL,
	user_id INTEGER NOT NULL,
	comment_text TEXT NOT NULL,
	created_id TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (post_id) REFERENCES Posts(post_id),
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
