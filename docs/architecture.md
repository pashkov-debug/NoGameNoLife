Целевая модель MVP

Клиент:

PWA в браузере
один экран локации
лог событий
форма ввода действия
панель персонажа


Сервер:

API слой
world service
rule engine
AI gateway
stream layer

Хранилища:

PostgreSQL
Redis
object storage для изображений локаций

Главный принцип:
AI не управляет состоянием мира.
AI интерпретирует и рассказывает.
Состояние меняет только rule engine.

Рекомендовано: стек

Фронт:

React + TypeScript + Vite
TanStack Query
React Router
PWA
SSE для входящих событий

Бэк:

NestJS с Fastify adapter, не с Express
Prisma
PostgreSQL
Redis
BullMQ для AI-задач, TTL и фоновых cleanup-задач

Инфра:

Docker
один VPS/VM для MVP
object storage для картинок локаций
GitHub Actions + GHCR + deploy по SSH