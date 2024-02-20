# README

## usersテーブル

| Column             | Type    | Options    |
| ------------------ | ------- | ---------- |
| nickname           | string  | null:false |
| email              | string  | null:false |
| encrypted_password | string  | null:false |
| profile            | text    | null:false |
| gender_id          | integer | null:false |
| residence_id       | integer | null:false |
| age_id             | integer | null:false |

### Association

- has_many :tweets
- has_many :comments


## tweetsテーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| residence_id | integer    | null:false                    |
| city         | string     |                               |
| spot         | string     |                               |
| shooting_day | date       |                               |
| title        | text       | null:false                    |
| text         | text       | null:false                    |
| user_id      | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## commentsテーブル

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| text     | text       | null:false                    |
| user_id  | references | null:false, foreign_key: true |
| tweet_id | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

