require "shrine" # core
require "shrine/storage/file_system" # plugin to save files using file system

Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
}

Shrine.plugin :mongoid
