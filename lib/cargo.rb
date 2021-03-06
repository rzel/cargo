module Cargo
  VERSION = "0.0.3"

  def import(file)
    unless file.match(/\.rb$/)
      file = "#{file}.rb"
    end

    load(file, true)

    Thread.current[:cargo].tap do
      Thread.current[:cargo] = nil
    end
  end

  def export(cargo)
    Thread.current[:cargo] = cargo
  end
end

extend Cargo
