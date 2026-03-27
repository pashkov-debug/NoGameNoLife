create table users (
  id uuid primary key,
  email text unique not null,
  password_hash text not null,
  created_at timestamptz not null default now()
);

create table characters (
  id uuid primary key,
  user_id uuid not null references users(id),
  name text not null,
  class text not null,
  level int not null default 1,
  xp int not null default 0,
  hp_current int not null,
  hp_max int not null,
  location_id uuid null,
  state text not null default 'idle',
  created_at timestamptz not null default now()
);

create table character_stats (
  character_id uuid primary key references characters(id),
  strength int not null,
  agility int not null,
  vitality int not null,
  perception int not null,
  intelligence int not null,
  charisma int not null
);

create table locations (
  id uuid primary key,
  code text unique not null,
  name text not null,
  image_url text not null,
  biome text not null,
  ruleset_id uuid not null,
  is_safe_zone boolean not null default false
);

create table location_states (
  location_id uuid primary key references locations(id),
  version int not null default 1,
  active_event_id uuid null,
  occupancy_count int not null default 0,
  last_activity_at timestamptz null,
  cooldown_until timestamptz null,
  ambient_state_json jsonb not null default '{}'::jsonb
);

create table world_events (
  id uuid primary key,
  location_id uuid not null references locations(id),
  type text not null,
  phase text not null,
  visibility text not null,
  difficulty int not null default 1,
  source text not null,
  payload_json jsonb not null default '{}'::jsonb,
  narrative_text text not null,
  created_at timestamptz not null default now(),
  expires_at timestamptz null,
  resolved_at timestamptz null
);

create table action_logs (
  id uuid primary key,
  request_id uuid not null unique,
  character_id uuid not null references characters(id),
  location_id uuid not null references locations(id),
  raw_text text not null,
  parsed_intent_json jsonb not null,
  resolution_json jsonb not null,
  narrative_text text not null,
  created_at timestamptz not null default now()
);

create table monster_templates (
  id uuid primary key,
  code text unique not null,
  name text not null,
  stats_json jsonb not null,
  abilities_json jsonb not null default '[]'::jsonb,
  loot_table_json jsonb not null default '[]'::jsonb
);

create table item_templates (
  id uuid primary key,
  code text unique not null,
  name text not null,
  type text not null,
  rarity text not null,
  effects_json jsonb not null default '[]'::jsonb,
  stackable boolean not null default false
);

create table inventory_items (
  id uuid primary key,
  character_id uuid not null references characters(id),
  item_template_id uuid not null references item_templates(id),
  quantity int not null default 1,
  durability int null,
  equipped_slot text null,
  metadata_json jsonb not null default '{}'::jsonb
);
