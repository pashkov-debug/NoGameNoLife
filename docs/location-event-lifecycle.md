Жизненный цикл события
idle
spawned
visible
engaged
resolved
expired
Правила
в локации одновременно 0..N событий, но для MVP лучше 0..1 активное ключевое событие
событие создаётся только сервером
событие может иметь TTL
если никто не взаимодействует, оно истекает
если игроки уже внутри, новые игроки видят summary
=== docs/repository-structure.md ===
Структура репозитория
/game
  /apps
    /web
    /api
  /packages
    /shared-types
    /shared-schemas
    /ui
  /docs
  /infra
    docker-compose.yml
  /.env.example
  /package.json
