@tool
class_name TileInfo extends Resource
## Resource used to tell the generators which tile from the [TileMap] to place.


enum Type {
	SINGLE_CELL, ## Tile is just a single cell in the TileMap. Requires a [param source_id] and a [param atlas_coord]. Can optionally be an [param alternative_tile].
	TERRAIN ## Tile is a terrain from a terrain set. Allows for autotiling. Requires a [param terrain_set] and a [param terrain]
	}


@export var type: Type = Type.SINGLE_CELL :
	set(value):
		type = value
		notify_property_list_changed()
## The [TileMap] layer the tile will be placed in.
@export var layer: int = 0
## A [TileSetSource] identifier. See [method TileSet.set_source_id].[br]If set to [code]-1[/code], the cell will be erased.
var sourceId: int = 0
## Identifies a tile's coordinates in the atlas (if the source is a [TileSetAtlasSource]).
## For [TileSetScenesCollectionSource] it should always be [code]Vector2i(0, 0)[/code]).[br]If set to [code]Vector2i(-1, -1)[/code], the cell will be erased.
var atlasCoord: Vector2i = Vector2i.ZERO
## Identifies a tile alternative in the atlas (if the source is a [TileSetAtlasSource]),
## and the scene for a [TileSetScenesCollectionSource].[br]If set to [code]-1[/code], the cell will be erased.
var alternativeTile: int = 0
## The tile's terrain set in the [TileMap].
var terrainSet: int = 0
## Terrain in the terrain set determined previously.
var terrain: int = 0


func _get_property_list() -> Array[Dictionary]:
	match type:
		Type.SINGLE_CELL:
			return [
				{
					"name": "sourceId",
					"usage": PROPERTY_USAGE_DEFAULT,
					"type": TYPE_INT
				},
				{
					"name": "atlasCoord",
					"usage": PROPERTY_USAGE_DEFAULT,
					"type": TYPE_VECTOR2I
				},
				{
					"name": "alternativeTile",
					"usage": PROPERTY_USAGE_DEFAULT,
					"type": TYPE_INT
				}
			]
		Type.TERRAIN:
			return [
				{
					"name": "terrainSet",
					"usage": PROPERTY_USAGE_DEFAULT,
					"type": TYPE_INT
				},
				{
					"name": "Terrain",
					"usage": PROPERTY_USAGE_DEFAULT,
					"type": TYPE_INT
				},
			]
		_:
			return []
