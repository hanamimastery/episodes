CREATE TABLE `schema_migrations`(`filename` varchar(255) NOT NULL PRIMARY KEY);
CREATE TABLE `articles`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` integer DEFAULT(0) NOT NULL
);
INSERT INTO schema_migrations (filename) VALUES
('20241015130536_articles.rb');
