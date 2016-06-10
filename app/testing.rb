__END__
curl http://localhost:9292/users -XPOST -H 'Content-Type: application/json' -v \
 -d '{
 "user_name": "uri",
 "email": "uri@example.com"
 }'


curl http://localhost:9292/users -XPOST -H 'Content-Type: application/json' -v \
 -d '{
 "user_name": "hery",
 "email": "hery@example.com"
 }'


curl http://localhost:9292/tournaments -XPOST -H 'Content-Type: application/json' -v \
 -d '{
 "description": "3scale regular Ping Pong tournament",
 "name": "3scale Ping Pong"
 }'

curl http://localhost:9292/games/users -XPOST -H 'Content-Type: application/json' -v \
 -d '{
 "tournament_id": 1,
  "winner_id": 1,
  "loser_id": 2,
  "winner_score": 2,
  "loser_score": 1
 }'
