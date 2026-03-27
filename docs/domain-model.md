Сущности MVP

User

id
email
password_hash
created_at

Character

id
user_id
name
class
level
xp
hp_current
hp_max
location_id
state (idle, in_combat, dead)
created_at

CharacterStats

character_id
strength
agility
vitality
perception
intelligence
charisma

Location

id
code
name
image_url
biome
ruleset_id
is_safe_zone

LocationState

location_id
version
active_event_id
occupancy_count
last_activity_at
cooldown_until
ambient_state_json

WorldEvent

id
location_id
type
phase
visibility
difficulty
source (system, player, ai-assisted)
payload_json
narrative_text
created_at
expires_at
resolved_at

ActionLog

id
request_id
character_id
location_id
raw_text
parsed_intent_json
resolution_json
narrative_text
created_at

InventoryItem

id
character_id
item_template_id
quantity
durability
equipped_slot
metadata_json

MonsterTemplate

id
code
name
stats_json
abilities_json
loot_table_json


ItemTemplate

id
code
name
type
rarity
effects_json
stackable

LocationRuleSet

id
code
event_pool_json
monster_pool_json
loot_modifiers_json
narrative_constraints_json