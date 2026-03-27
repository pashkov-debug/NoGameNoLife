Smoke test
Сценарий
зарегистрировать пользователя
создать персонажа
войти в локацию без активного события
убедиться, что событие создалось
отправить действие осматриваю алтарь, не касаясь его
убедиться, что AI вернул intent JSON
убедиться, что rule engine применил результат
убедиться, что запись появилась в action_logs
вторым клиентом войти в ту же локацию
убедиться, что он видит summary текущего события

B) Действия

Создай монорепозиторий
mkdir game && cd game
mkdir -p apps/web apps/api packages/shared-types packages/shared-schemas docs infra db
Зафиксируй документы
docs/domain-model.md
docs/api-contracts.md
docs/ai-contracts.md
docs/location-event-lifecycle.md
docs/mvp-roadmap.md
Подними backend skeleton
NestJS
Prisma
PostgreSQL
Redis
модули:
auth
characters
locations
world-events
actions
combat
ai-gateway
stream
Подними frontend skeleton
React + TS + Vite
роуты:
login
world
location
inventory
character
Сделай shared package
ActionIntentSchema
ActionResolutionSchema
LocationStateDto
WorldEventDto
Реализуй first playable slice
регистрация
создание персонажа
вход в локацию
генерация события
отправка действия
ответ с результатом
логирование
Добавь SSE
подписка на события локации
обновление UI без перезагрузки
Добавь идемпотентность
request_id обязателен для POST /locations/:id/action
Добавь lock на генерацию события
Redis key: lock:location:{id}:spawn
Сделай базовый сид контента
10 локаций
20 монстров
30 предметов
30–50 event templates
Проведи smoke-test
по сценарию из docs/smoke-test-scenario.md
C) Пояснения (кратко)

Это делается для того, чтобы за 1 цикл получить проверяемый игровой контур, а не расплывчатый “AI sandbox”.

Интеграция с другими направлениями


Frontend: UI должен жить на DTO от сервера; не парсить AI-текст как данные.
Backend: все игровые изменения только через rule engine и транзакции.
DevOps: Redis нужен не как “ускоритель”, а как lock/presence/stream вспомогательный слой.
Data/analytics: action_logs и world_events сразу дадут основу для баланса, ретеншна и поиска сломанных сценариев.