# NoGameNoLife

MVP браузерной AI-assisted RPG с общим миром.

## Текущий план
- `apps/web` — клиентская PWA
- `apps/api` — backend API + world/rule engine + AI gateway
- `packages/contracts` — общие типы и схемы
- `docs` — архитектурные документы
- `db` — схема БД, миграции, сиды

## Принцип системы
- Backend и БД — источник истины
- AI не меняет состояние мира напрямую
- AI интерпретирует действие игрока и формирует нарратив
- Правила мира, бой, лут, эффекты и инвентарь считает сервер

## Ближайшие шаги
/game
  /apps
    /web
    /api
  /packages
    /contracts
  /docs
  /db
  /.github/workflows
  /.env.example
  /package.json
  /pnpm-workspace.yaml
  /tsconfig.base.json

## Статус
Сейчас репозиторий находится на стадии каркаса и документации.