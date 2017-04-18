def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end