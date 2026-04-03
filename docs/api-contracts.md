# API MVP

## POST /auth/register

## POST /auth/login

## GET /me

## POST /characters
Создать персонажа.

## GET /characters/:id
Получить состояние персонажа.

## GET /world/locations
Список доступных локаций.

## GET /locations/:id/state
Вернуть:
- локацию
- состояние локации
- активное событие
- последние события
- других игроков в summary-виде

## POST /locations/:id/enter
- фиксируем presence
- обновляем текущую локацию персонажа

## POST /locations/:id/action

Тело:
```json
{
  "request_id": "uuid",
  "character_id": "char_1",
  "raw_text": "я медленно подхожу к телеге и осматриваю следы вокруг"
}