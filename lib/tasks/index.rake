namespace :index do
  desc "Create a new index from an empty database"
  task create: :environment do
    Indexer.new.create_index
  end

  desc "Refresh an existing indexIndexer.new.create_index"
  task refresh: :environment do
    Indexer.new.refresh_index
  end
end
