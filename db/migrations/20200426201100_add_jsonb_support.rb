Hanami::Model.migration do
  up do
    execute 'CREATE EXTENSION IF NOT EXISTS "citext"'
  end

  down do
    execute 'DROP EXTENSION IF EXISTS "citext"'
  end
end
