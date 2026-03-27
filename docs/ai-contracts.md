Контракт 1. parse_action

Вход
краткое описание локации
активное событие
состояние персонажа
последние 3–5 событий
raw player text
список допустимых intent types
список допустимых target types
Выход JSON
{
  "intent_type": "inspect",
  "target_type": "event",
  "target_id": "evt_123",
  "approach": "careful",
  "risk_level": 0.35,
  "uses_item_id": null,
  "notes": "Игрок пытается осмотреть следы, не вступая в прямой контакт"
}
Правила
только JSON
только разрешённые enum
без создания новых сущностей
без изменения состояния мира

Контракт 2. narrate_outcome

Вход
server resolution
location context
character context
style constraints
max length
Выход JSON
{
  "narrative_text": "Ты медленно приседаешь у обгоревших следов..."
}

=== docs/api-contracts.md ===
API MVP
POST /auth/register
POST /auth/login
GET /me
POST /characters

создать персонажа

GET /characters/:id

получить состояние персонажа

GET /world/locations

список доступных локаций

GET /locations/:id/state

вернуть:

локацию
состояние локации
активное событие
последние события
других игроков в summary-виде
POST /locations/:id/enter
фиксируем presence
обновляем текущую локацию персонажа
POST /locations/:id/action

тело:

{
  "request_id": "uuid",
  "character_id": "char_1",
  "raw_text": "я медленно подхожу к телеге и осматриваю следы вокруг"
}

ответ:


{
  "action_id": "act_1",
  "resolution": {
    "kind": "success",
    "hp_delta": 0,
    "items_added": [],
    "effects_added": [],
    "world_changes": ["event_progressed"]
  },
  "narrative_text": "Ты осторожно подходишь к телеге..."
}
GET /stream/locations/:id

SSE stream:

presence.updated
event.created
event.updated
action.resolved
combat.started
combat.updated